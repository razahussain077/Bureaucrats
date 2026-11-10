import 'package:flutter/material.dart';
import 'essay_repository.dart';

class EssayScreen extends StatefulWidget {
  const EssayScreen({super.key});
  @override
  State<EssayScreen> createState() => _EssayScreenState();
}

class _EssayScreenState extends State<EssayScreen> {
  final _topic = TextEditingController();
  final _essay = TextEditingController();
  bool _busy = false;
  String? _error;
  Map<String, dynamic>? _evaluation;

  @override
  void dispose() { _topic.dispose(); _essay.dispose(); super.dispose(); }

  Future<void> _submit() async {
    if (_topic.text.trim().length < 5 || _essay.text.trim().length < 500) {
      setState(() => _error = 'Enter a topic (at least 5 characters) and an essay of at least 500 characters.');
      return;
    }
    setState(() { _busy = true; _error = null; _evaluation = null; });
    try {
      final result = await EssayRepository().evaluate(topic: _topic.text.trim(), essay: _essay.text.trim());
      if (mounted) setState(() => _evaluation = result);
    } catch (_) {
      if (mounted) setState(() => _error = 'Evaluation failed. Check your connection and sign-in, then try again.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Essay Examiner')),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const Text('Write with clarity. Argue with evidence.', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800, color: Color(0xFF102A43))),
      const SizedBox(height: 8),
      const Text('Practice feedback is indicative, not an official FPSC assessment.', style: TextStyle(color: Color(0xFF627D98))),
      const SizedBox(height: 20),
      TextField(controller: _topic, decoration: const InputDecoration(labelText: 'Essay topic')),
      const SizedBox(height: 14),
      TextField(controller: _essay, minLines: 14, maxLines: 24, textAlignVertical: TextAlignVertical.top, decoration: const InputDecoration(labelText: 'Your essay', hintText: 'Write your complete essay here...')),
      const SizedBox(height: 16),
      FilledButton.icon(
        onPressed: _busy ? null : _submit,
        icon: _busy ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.fact_check_outlined),
        label: Text(_busy ? 'Evaluating…' : 'Evaluate essay'),
      ),
      if (_error != null) ...[const SizedBox(height: 12), Text(_error!, style: const TextStyle(color: Color(0xFF9B2C2C)))],
      if (_evaluation != null) ...[const SizedBox(height: 24), _EvaluationView(evaluation: _evaluation!)],
    ]),
  );
}

class _EvaluationView extends StatelessWidget {
  const _EvaluationView({required this.evaluation});
  final Map<String, dynamic> evaluation;
  static const _labels = {
    'thesis_and_argument': 'Thesis & argument',
    'structure_and_coherence': 'Structure & coherence',
    'knowledge_and_evidence': 'Knowledge & evidence',
    'analysis_and_critical_thinking': 'Analysis & critical thinking',
    'language_and_expression': 'Language & expression',
  };
  static const _maxima = {
    'thesis_and_argument': 20,
    'structure_and_coherence': 20,
    'knowledge_and_evidence': 20,
    'analysis_and_critical_thinking': 25,
    'language_and_expression': 15,
  };

  @override
  Widget build(BuildContext context) {
    final rubric = evaluation['rubric'] as Map<String, dynamic>;
    final score = (evaluation['total_score'] as num).toInt();
    final strengths = (evaluation['strengths'] as List).whereType<String>().toList();
    final weaknesses = (evaluation['weaknesses'] as List).whereType<String>().toList();
    final revisions = (evaluation['actionable_revisions'] as List).whereType<Map>();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Card(child: Padding(padding: const EdgeInsets.all(20), child: Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('PRACTICE SCORE', style: TextStyle(fontSize: 11, letterSpacing: 1, fontWeight: FontWeight.w700, color: Color(0xFF627D98))),
          const SizedBox(height: 5),
          Text('$score/100', style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: Color(0xFF102A43))),
        ]),
        const Spacer(),
        const Icon(Icons.fact_check_outlined, size: 38, color: Color(0xFF1769AA)),
      ]))),
      const SizedBox(height: 12),
      const Text('Rubric breakdown', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
      const SizedBox(height: 8),
      Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(children: _labels.entries.map((entry) {
        final value = (rubric[entry.key] as num?)?.toInt() ?? 0;
        final max = _maxima[entry.key]!;
        return Padding(padding: const EdgeInsets.only(bottom: 14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [Expanded(child: Text(entry.value, style: const TextStyle(fontWeight: FontWeight.w600))), Text('$value/$max', style: const TextStyle(fontWeight: FontWeight.w700))]),
          const SizedBox(height: 6),
          ClipRRect(borderRadius: BorderRadius.circular(8), child: LinearProgressIndicator(value: value / max, minHeight: 7, backgroundColor: const Color(0xFFEAF0F6))),
        ]));
      }).toList()))),
      const SizedBox(height: 12),
      _FeedbackList(title: 'Strengths', items: strengths, icon: Icons.check_circle_outline),
      _FeedbackList(title: 'Areas to improve', items: weaknesses, icon: Icons.trending_up),
      const SizedBox(height: 12),
      const Text('Actionable revisions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
      const SizedBox(height: 8),
      ...revisions.map((item) => Card(margin: const EdgeInsets.only(bottom: 8), child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('${item['issue'] ?? 'Issue'}', style: const TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        Text('${item['revision'] ?? ''}'),
        if (item['reason'] != null) ...[const SizedBox(height: 5), Text('${item['reason']}', style: const TextStyle(color: Color(0xFF627D98)))],
      ])))),
      const SizedBox(height: 12),
      const Text('Examiner summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
      const SizedBox(height: 8),
      Card(child: Padding(padding: const EdgeInsets.all(16), child: Text('${evaluation['overall_feedback']}'))),
      const SizedBox(height: 8),
      const Text('This is AI-assisted practice feedback, not an official FPSC mark or pass/fail decision.', style: TextStyle(fontSize: 12, color: Color(0xFF627D98))),
    ]);
  }
}

class _FeedbackList extends StatelessWidget {
  const _FeedbackList({required this.title, required this.items, required this.icon});
  final String title;
  final List<String> items;
  final IconData icon;
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
    const SizedBox(height: 8),
    Card(child: Padding(padding: const EdgeInsets.all(14), child: items.isEmpty ? const Text('No items returned.') : Column(children: items.map((item) => Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, size: 18, color: const Color(0xFF1769AA)), const SizedBox(width: 9), Expanded(child: Text(item))]),
    )).toList()))),
  ]));
}
