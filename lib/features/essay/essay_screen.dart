import 'package:flutter/material.dart';

class EssayScreen extends StatefulWidget {
  const EssayScreen({super.key});
  @override
  State<EssayScreen> createState() => _EssayScreenState();
}

class _EssayScreenState extends State<EssayScreen> {
  final _topic = TextEditingController();
  final _essay = TextEditingController();
  final Set<int> _reviewed = {};
  static const _checks = [
    'My introduction directly addresses the exact question.',
    'My thesis is clear, specific and arguable.',
    'Each paragraph develops one main claim.',
    'I support claims with relevant examples or credible evidence.',
    'I consider counterarguments and alternative explanations.',
    'My paragraphs connect logically and avoid repetition.',
    'My conclusion answers the question without introducing a new argument.',
    'I checked grammar, punctuation, spelling and sentence clarity.',
  ];

  int get _words => _essay.text.trim().isEmpty
      ? 0
      : _essay.text.trim().split(RegExp(r'\\s+')).length;

  @override
  void initState() {
    super.initState();
    _essay.addListener(_refresh);
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _topic.dispose();
    _essay.removeListener(_refresh);
    _essay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Essay Examiner')),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text('Write with clarity. Argue with evidence.', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800, color: Color(0xFF102A43))),
        const SizedBox(height: 8),
        const Text('A structured practice desk for planning, drafting and reviewing CSS essays.', style: TextStyle(color: Color(0xFF627D98))),
        const SizedBox(height: 20),
        TextField(controller: _topic, decoration: const InputDecoration(labelText: 'Essay topic', hintText: 'Enter the exact essay question')),
        const SizedBox(height: 14),
        Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Text('Before you write', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF102A43))),
              SizedBox(height: 10),
              _PlanStep(number: '01', title: 'Decode the prompt', detail: 'Identify the command, scope, assumptions and central issue.'),
              _PlanStep(number: '02', title: 'Take a position', detail: 'Write a one-sentence thesis that answers the question.'),
              _PlanStep(number: '03', title: 'Build the argument', detail: 'Arrange 6–10 claims in a logical sequence; attach evidence to each.'),
              _PlanStep(number: '04', title: 'Test the outline', detail: 'Check relevance, balance, counterarguments and a defensible conclusion.'),
            ]),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: _essay,
          minLines: 14,
          maxLines: 28,
          textAlignVertical: TextAlignVertical.top,
          decoration: const InputDecoration(labelText: 'Essay draft', alignLabelWithHint: true, hintText: 'Write your introduction, thesis, body paragraphs and conclusion here...', border: OutlineInputBorder()),
        ),
        const SizedBox(height: 8),
        Row(children: [
          Text('$_words words', style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF1769AA))),
          const Spacer(),
          Text(_words < 1500 ? 'Practice target: develop a full-length argument' : 'Long-form draft', style: const TextStyle(fontSize: 11, color: Color(0xFF718096))),
        ]),
        const SizedBox(height: 22),
        const Text('Self-review checklist', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF102A43))),
        const SizedBox(height: 5),
        Text('${_reviewed.length} of ${_checks.length} checks completed', style: const TextStyle(color: Color(0xFF627D98))),
        const SizedBox(height: 8),
        LinearProgressIndicator(value: _reviewed.length / _checks.length, minHeight: 6, borderRadius: BorderRadius.circular(8)),
        const SizedBox(height: 8),
        Card(
          elevation: 0,
          child: Column(children: List.generate(_checks.length, (i) => CheckboxListTile(
            value: _reviewed.contains(i),
            onChanged: (value) => setState(() { if (value == true) { _reviewed.add(i); } else { _reviewed.remove(i); } }),
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            title: Text(_checks[i], style: const TextStyle(fontSize: 13)),
          ))),
        ),
        const SizedBox(height: 12),
        const Text('AI evaluation and saved submission history are not enabled in this public guest workspace yet. This page provides local drafting and self-review only; it does not assign an AI score or save your essay to a server.', style: TextStyle(fontSize: 12, height: 1.5, color: Color(0xFF627D98))),
      ],
    ),
  );
}

class _PlanStep extends StatelessWidget {
  const _PlanStep({required this.number, required this.title, required this.detail});
  final String number, title, detail;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CircleAvatar(radius: 14, backgroundColor: const Color(0xFFEAF3FB), child: Text(number, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: Color(0xFF1769AA)))),
      const SizedBox(width: 10),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF243B53))),
        const SizedBox(height: 2),
        Text(detail, style: const TextStyle(fontSize: 12, height: 1.4, color: Color(0xFF627D98))),
      ])),
    ]),
  );
}
