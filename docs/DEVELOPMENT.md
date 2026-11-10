# Development setup

## Requirements
- Flutter stable (Dart 3.4+)
- A Supabase project
- Gemini API key stored only as a Supabase Edge Function secret

## Run
1. Copy `.env.example` values into your local run configuration.
2. Run `flutter pub get`.
3. Run `flutter run --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...`.

The publishable/anon key is designed for client use; database access is constrained by RLS. Never ship a service-role key or Gemini key in the app.

## Supabase
Apply the SQL in `supabase/migrations` using the Supabase CLI or SQL editor. Deploy `supabase/functions/evaluate-essay` and set `GEMINI_API_KEY` as a function secret. Keep JWT verification enabled.

## Current milestone
The repository contains the initial app shell and the essay submission/evaluation foundation. Authentication UI, complete subject content, MCQ delivery, billing, analytics, accessibility review, automated integration tests, and production deployment are not complete. Do not market this commit as production-ready.

## Quality gates
Before release: run `flutter analyze`, `flutter test`, exercise RLS with two different accounts, test malformed/oversized essay payloads, validate model output against the JSON schema, and review Supabase security/performance advisors.
