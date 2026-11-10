import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.49.1";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

const json = (body: unknown, status = 200) =>
  new Response(JSON.stringify(body), { status, headers: { ...corsHeaders, "Content-Type": "application/json" } });

const rubric = {
  thesis_and_argument: 20,
  structure_and_coherence: 20,
  knowledge_and_evidence: 20,
  analysis_and_critical_thinking: 25,
  language_and_expression: 15,
};

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
  if (req.method !== "POST") return json({ error: "Method not allowed" }, 405);

  const supabaseUrl = Deno.env.get("SUPABASE_URL");
  const anonKey = Deno.env.get("SUPABASE_ANON_KEY") ?? Deno.env.get("SUPABASE_PUBLISHABLE_KEY");
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  const geminiKey = Deno.env.get("GEMINI_API_KEY");
  if (!supabaseUrl || !anonKey || !serviceKey || !geminiKey) return json({ error: "Server is not configured" }, 500);

  const authHeader = req.headers.get("Authorization");
  if (!authHeader?.startsWith("Bearer ")) return json({ error: "Authentication required" }, 401);
  const userClient = createClient(supabaseUrl, anonKey, { global: { headers: { Authorization: authHeader } } });
  const { data: userData, error: userError } = await userClient.auth.getUser();
  if (userError || !userData.user) return json({ error: "Invalid session" }, 401);

  let body: { topic?: unknown; essay?: unknown };
  try { body = await req.json(); } catch { return json({ error: "Invalid JSON body" }, 400); }
  const topic = typeof body.topic === "string" ? body.topic.trim() : "";
  const essay = typeof body.essay === "string" ? body.essay.trim() : "";
  if (topic.length < 5 || topic.length > 300 || essay.length < 500 || essay.length > 20000) {
    return json({ error: "Topic must be 5-300 characters and essay 500-20,000 characters" }, 400);
  }

  const prompt = `You are a strict but fair CSS essay practice examiner. Assess only the submitted essay, not the candidate. Do not invent quotations, statistics, citations or facts. If evidence is unsupported, say so. Return JSON only with keys total_score, rubric, strengths, weaknesses, actionable_revisions, overall_feedback. Score each rubric item as an integer within its maximum: thesis_and_argument /20, structure_and_coherence /20, knowledge_and_evidence /20, analysis_and_critical_thinking /25, language_and_expression /15. total_score MUST equal the sum (out of 100). strengths and weaknesses are arrays of concise strings. actionable_revisions is an array of objects with issue, revision, reason. overall_feedback is a concise paragraph. Do not claim this is an official FPSC score.

Topic: ${topic}

Essay:
${essay}`;

  const modelResponse = await fetch("https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=" + encodeURIComponent(geminiKey), {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      contents: [{ role: "user", parts: [{ text: prompt }] }],
      generationConfig: { responseMimeType: "application/json", temperature: 0.2 },
    }),
  });
  if (!modelResponse.ok) return json({ error: "Examiner service is temporarily unavailable" }, 502);
  const modelData = await modelResponse.json();
  const raw = modelData?.candidates?.[0]?.content?.parts?.map((p: { text?: string }) => p.text ?? "").join("");
  let evaluation: Record<string, unknown>;
  try { evaluation = JSON.parse(raw); } catch { return json({ error: "Examiner returned invalid structured feedback" }, 502); }

  const rubricResult = evaluation.rubric as Record<string, unknown> | undefined;
  const valid = rubricResult && Object.entries(rubric).every(([key, max]) =>
    Number.isInteger(rubricResult[key]) && Number(rubricResult[key]) >= 0 && Number(rubricResult[key]) <= max
  );
  const sum = rubricResult ? Object.values(rubric).reduce((total, max, index) => {
    const key = Object.keys(rubric)[index];
    return total + (Number(rubricResult[key]) || 0);
  }, 0) : -1;
  if (!valid || !Number.isInteger(evaluation.total_score) || evaluation.total_score !== sum ||
      !Array.isArray(evaluation.strengths) || !Array.isArray(evaluation.weaknesses) ||
      !Array.isArray(evaluation.actionable_revisions) || typeof evaluation.overall_feedback !== "string") {
    return json({ error: "Examiner output failed validation" }, 502);
  }

  const admin = createClient(supabaseUrl, serviceKey);
  const { data: saved, error: saveError } = await admin.from("essay_submissions").insert({
    user_id: userData.user.id, topic, essay_text: essay, evaluation,
    total_score: evaluation.total_score,
  }).select("id, created_at").single();
  if (saveError) return json({ error: "Could not save evaluation" }, 500);
  return json({ submission: saved, evaluation });
});
