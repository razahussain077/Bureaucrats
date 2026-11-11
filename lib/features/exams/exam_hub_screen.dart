import 'dart:async';
import 'package:flutter/material.dart';

class ExamHubScreen extends StatefulWidget {
  const ExamHubScreen({super.key});

  @override
  State<ExamHubScreen> createState() => _ExamHubScreenState();
}

class _ExamHubScreenState extends State<ExamHubScreen> {
  String _subject = 'Mixed Compulsory';
  bool _started = false;
  bool _submitted = false;
  int _index = 0;
  int _secondsLeft = 15 * 60;
  Timer? _timer;
  final Map<int, int> _answers = {};

  static const _questions = <_ExamQuestion>[
    _ExamQuestion('Pakistan Affairs', 'The Simla Deputation met Lord Minto in:', ['1905', '1906', '1909', '1911'], 1, 'The deputation led by Aga Khan met the Viceroy at Simla on 1 October 1906 and sought separate political representation for Muslims.'),
    _ExamQuestion('Pakistan Affairs', 'The Lahore Resolution was moved by:', ['A. K. Fazlul Huq', 'Liaquat Ali Khan', 'Chaudhry Khaliquzzaman', 'Aga Khan III'], 0, 'A. K. Fazlul Huq, the Premier of Bengal, moved the resolution at the Muslim League session in Lahore in March 1940.'),
    _ExamQuestion('Pakistan Affairs', 'The Objectives Resolution was adopted by the Constituent Assembly on:', ['12 March 1949', '23 March 1956', '14 August 1947', '8 June 1962'], 0, 'The Constituent Assembly adopted the Objectives Resolution on 12 March 1949.'),
    _ExamQuestion('Pakistan Affairs', 'The Constitution of 1973 came into force on:', ['23 March 1973', '14 August 1973', '25 December 1973', '1 January 1974'], 1, 'The Constitution was authenticated in April 1973 and came into force on 14 August 1973.'),
    _ExamQuestion('Pakistan Affairs', 'The One Unit scheme was introduced in:', ['1949', '1955', '1958', '1962'], 1, 'The One Unit scheme merged the provinces and princely states of West Pakistan into one administrative unit in 1955.'),
    _ExamQuestion('Current Affairs', 'The Sustainable Development Goals (SDGs) were adopted by UN member states in:', ['2000', '2010', '2015', '2020'], 2, 'The 2030 Agenda, including 17 SDGs, was adopted in September 2015.'),
    _ExamQuestion('Current Affairs', 'The Paris Agreement primarily addresses:', ['Global trade', 'Climate change', 'Nuclear disarmament', 'Maritime boundaries'], 1, 'The Paris Agreement is a treaty under the UNFCCC that aims to limit global temperature rise.'),
    _ExamQuestion('General Science & Ability', 'The SI unit of electric current is:', ['Volt', 'Ohm', 'Ampere', 'Watt'], 2, 'Electric current is measured in amperes (A), named after André-Marie Ampère.'),
    _ExamQuestion('General Science & Ability', 'If a vehicle travels 150 km in 3 hours, its average speed is:', ['30 km/h', '45 km/h', '50 km/h', '60 km/h'], 2, 'Average speed equals total distance divided by total time: 150 ÷ 3 = 50 km/h.'),
    _ExamQuestion('Islamic Studies', 'The first revelation was received in the cave of:', ['Thawr', 'Hira', 'Uhud', 'Safā'], 1, 'The first revelation came to Prophet Muhammad (peace be upon him) in the Cave of Hira.'),
    _ExamQuestion('Islamic Studies', 'The Hijrah from Makkah to Madinah took place in:', ['610 CE', '615 CE', '622 CE', '630 CE'], 2, 'The Hijrah took place in 622 CE and marks the beginning of the Islamic Hijri calendar.'),
    _ExamQuestion('English Usage', 'Choose the grammatically correct sentence:', ['Neither of the answers are correct.', 'Neither of the answers is correct.', 'Neither answers is correct.', 'Neither of answer are correct.'], 1, '“Neither” is treated as singular in formal standard usage in this construction, so it takes “is”.'),
  ];

  List<_ExamQuestion> get _filtered => _subject == 'Mixed Compulsory'
      ? _questions
      : _questions.where((q) => q.subject == _subject).toList();

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _start() {
    setState(() {
      _started = true;
      _submitted = false;
      _index = 0;
      _secondsLeft = 15 * 60;
      _answers.clear();
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted || _submitted) {
        timer.cancel();
        return;
      }
      if (_secondsLeft <= 1) {
        setState(() => _secondsLeft = 0);
        _submit();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  void _submit() {
    _timer?.cancel();
    setState(() {
      _submitted = true;
      _started = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questions = _filtered;
    final correct = questions.asMap().entries
        .where((entry) => _answers[entry.key] == entry.value.answer)
        .length;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FC),
      appBar: AppBar(title: const Text('Practice & Mock Exams')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Build exam discipline', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Color(0xFF102A43))),
          const SizedBox(height: 6),
          const Text('Timed objective practice with answer explanations and a score review.', style: TextStyle(color: Color(0xFF627D98))),
          const SizedBox(height: 20),
          if (!_started && !_submitted) _setupCard(questions.length),
          if (_started) _questionCard(questions),
          if (_submitted) _resultCard(questions, correct),
          const SizedBox(height: 18),
          const _Notice(),
        ],
      ),
    );
  }

  Widget _setupCard(int count) => Card(
    elevation: 0,
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Color(0xFFE2EAF2))),
    child: Padding(
      padding: const EdgeInsets.all(18),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Start a practice test', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: Color(0xFF102A43))),
        const SizedBox(height: 14),
        DropdownButtonFormField<String>(
          value: _subject,
          decoration: const InputDecoration(labelText: 'Question set', border: OutlineInputBorder()),
          items: const [
            DropdownMenuItem(value: 'Mixed Compulsory', child: Text('Mixed compulsory subjects')),
            DropdownMenuItem(value: 'Pakistan Affairs', child: Text('Pakistan Affairs')),
            DropdownMenuItem(value: 'Current Affairs', child: Text('Current Affairs')),
            DropdownMenuItem(value: 'General Science & Ability', child: Text('General Science & Ability')),
            DropdownMenuItem(value: 'Islamic Studies', child: Text('Islamic Studies')),
            DropdownMenuItem(value: 'English Usage', child: Text('English usage')),
          ],
          onChanged: (value) => setState(() => _subject = value ?? 'Mixed Compulsory'),
        ),
        const SizedBox(height: 14),
        Row(children: [
          const Icon(Icons.quiz_outlined, color: Color(0xFF1769AA), size: 18),
          const SizedBox(width: 8),
          Text('$count questions', style: const TextStyle(fontWeight: FontWeight.w700)),
          const Spacer(),
          const Icon(Icons.timer_outlined, color: Color(0xFF1769AA), size: 18),
          const SizedBox(width: 6),
          const Text('15 minutes', style: TextStyle(fontWeight: FontWeight.w700)),
        ]),
        const SizedBox(height: 18),
        SizedBox(width: double.infinity, child: FilledButton.icon(
          onPressed: count == 0 ? null : _start,
          icon: const Icon(Icons.play_arrow_rounded),
          label: const Text('Begin timed test'),
        )),
      ]),
    ),
  );

  Widget _questionCard(List<_ExamQuestion> questions) {
    final q = questions[_index];
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Color(0xFFE2EAF2))),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text('QUESTION ${_index + 1} OF ${questions.length}', style: const TextStyle(fontSize: 10, letterSpacing: 1, fontWeight: FontWeight.w900, color: Color(0xFF1769AA))),
            const Spacer(),
            Text('${(_secondsLeft ~/ 60).toString().padLeft(2, '0')}:${(_secondsLeft % 60).toString().padLeft(2, '0')}', style: const TextStyle(fontFeatures: [], fontWeight: FontWeight.w900, color: Color(0xFF9B2C2C))),
          ]),
          const SizedBox(height: 14),
          LinearProgressIndicator(value: (_index + 1) / questions.length, minHeight: 5, borderRadius: BorderRadius.circular(5)),
          const SizedBox(height: 20),
          Text(q.subject.toUpperCase(), style: const TextStyle(fontSize: 10, color: Color(0xFF718096), fontWeight: FontWeight.w800, letterSpacing: 1)),
          const SizedBox(height: 8),
          Text(q.prompt, style: const TextStyle(fontSize: 18, height: 1.4, fontWeight: FontWeight.w800, color: Color(0xFF102A43))),
          const SizedBox(height: 16),
          ...List.generate(q.options.length, (i) {
            final selected = _answers[_index] == i;
            return Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: InkWell(
                borderRadius: BorderRadius.circular(11),
                onTap: () => setState(() => _answers[_index] = i),
                child: Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: selected ? const Color(0xFFEAF3FB) : Colors.white,
                    border: Border.all(color: selected ? const Color(0xFF1769AA) : const Color(0xFFE2EAF2)),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(children: [
                    Icon(selected ? Icons.radio_button_checked : Icons.radio_button_off, color: selected ? const Color(0xFF1769AA) : const Color(0xFF9AA8B7), size: 19),
                    const SizedBox(width: 10),
                    Expanded(child: Text(q.options[i], style: const TextStyle(fontSize: 13, color: Color(0xFF334E68)))),
                  ]),
                ),
              ),
            );
          }),
          const SizedBox(height: 12),
          Row(children: [
            OutlinedButton(onPressed: _index == 0 ? null : () => setState(() => _index--), child: const Text('Previous')),
            const Spacer(),
            FilledButton(
              onPressed: () {
                if (_index == questions.length - 1) {
                  _submit();
                } else {
                  setState(() => _index++);
                }
              },
              child: Text(_index == questions.length - 1 ? 'Submit test' : 'Next question'),
            ),
          ]),
        ]),
      ),
    );
  }

  Widget _resultCard(List<_ExamQuestion> questions, int correct) => Card(
    elevation: 0,
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Color(0xFFE2EAF2))),
    child: Padding(
      padding: const EdgeInsets.all(18),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('TEST RESULT', style: TextStyle(fontSize: 10, letterSpacing: 1.2, fontWeight: FontWeight.w900, color: Color(0xFF1769AA))),
        const SizedBox(height: 8),
        Text('$correct / ${questions.length}', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF102A43))),
        Text('Correct answers • ${questions.isEmpty ? 0 : (correct * 100 / questions.length).round()}%', style: const TextStyle(color: Color(0xFF627D98))),
        const Divider(height: 26),
        const Text('Review every answer', style: TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF102A43))),
        const SizedBox(height: 10),
        ...questions.asMap().entries.map((entry) {
          final q = entry.value;
          final chosen = _answers[entry.key];
          final right = chosen == q.answer;
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(right ? Icons.check_circle : Icons.cancel, color: right ? const Color(0xFF23845B) : const Color(0xFFB54747), size: 17),
                const SizedBox(width: 8),
                Expanded(child: Text(q.prompt, style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF243B53)))),
              ]),
              const SizedBox(height: 5),
              Text('Your answer: ${chosen == null ? 'Not answered' : q.options[chosen]}', style: const TextStyle(fontSize: 12, color: Color(0xFF627D98))),
              Text('Correct answer: ${q.options[q.answer]}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFF1769AA))),
              const SizedBox(height: 4),
              Text(q.explanation, style: const TextStyle(fontSize: 12, height: 1.45, color: Color(0xFF486581))),
            ]),
          );
        }),
        SizedBox(width: double.infinity, child: FilledButton.icon(onPressed: () => setState(() { _submitted = false; _started = false; }), icon: const Icon(Icons.refresh), label: const Text('Back to test setup'))),
      ]),
    ),
  );
}

class _ExamQuestion {
  const _ExamQuestion(this.subject, this.prompt, this.options, this.answer, this.explanation);
  final String subject;
  final String prompt;
  final List<String> options;
  final int answer;
  final String explanation;
}

class _Notice extends StatelessWidget {
  const _Notice();
  @override
  Widget build(BuildContext context) => const Text(
    'This is an initial practice set, not an official FPSC past-paper archive or a full-length CSS mock examination. Question coverage and exam timing will be expanded after subject-wise content verification.',
    style: TextStyle(fontSize: 11, height: 1.5, color: Color(0xFF718096)),
  );
}
