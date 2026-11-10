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
  String? _feedback;

  @override
  void dispose() { _topic.dispose(); _essay.dispose(); super.dispose(); }

  Future<void> _submit() async {
    if (_topic.text.trim().isEmpty || _essay.text.trim().length < 500) {
      setState(() => _feedback = 'Add a topic and at least 500 characters before submitting.');
      return;
    }
    setState(() { _busy = true; _feedback = null; });
    try {
      final result = await EssayRepository().evaluate(topic: _topic.text.trim(), essay: _essay.text.trim());
      setState(() => _feedback = result);
    } catch (error) {
      setState(() => _feedback = 'Could not evaluate this essay. Check your sign-in and connection, then try again.');
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
      FilledButton.icon(onPressed: _busy ? null : _submit, icon: _busy ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.fact_check_outlined), label: Text(_busy ? 'Evaluating…' : 'Evaluate essay')),
      if (_feedback != null) ...[
        const SizedBox(height: 20),
        Card(child: Padding(padding: const EdgeInsets.all(16), child: SelectableText(_feedback!))),
      ],
    ]),
  );
}
