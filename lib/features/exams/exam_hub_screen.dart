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
    _ExamQuestion('Political Science', 'In a parliamentary system, the executive is primarily accountable to:', ['The legislature', 'The judiciary', 'The armed forces', 'A directly elected president'], 0, 'In parliamentary government the cabinet is drawn from and remains politically accountable to the legislature, usually through confidence procedures.'),
    _ExamQuestion('Political Science', 'The concept of the general will is most closely associated with:', ['Thomas Hobbes', 'John Locke', 'Jean-Jacques Rousseau', 'Montesquieu'], 2, 'Rousseau used the general will to describe collective sovereignty directed toward the common good, distinct from a simple aggregation of private preferences.'),
    _ExamQuestion('International Relations', 'In classical realism, international politics is strongly shaped by:', ['The absence of power competition', 'Human nature and the struggle for power', 'The automatic decline of states', 'The elimination of national interests'], 1, 'Classical realism emphasises power and interest in a world where political actors face insecurity and competition.'),
    _ExamQuestion('International Relations', 'The principle of collective security is most closely associated with:', ['A state acting alone', 'A common response to aggression by the international community', 'The abolition of diplomacy', 'Bilateral trade preferences'], 1, 'Collective security rests on the idea that aggression against one member is a concern for all and should prompt a collective response.'),
    _ExamQuestion('Economics', 'Opportunity cost is best defined as:', ['The money price of every option', 'The next-best alternative forgone', 'A sunk cost already paid', 'The total cost of production'], 1, 'Opportunity cost is the value of the best alternative sacrificed when a choice is made.'),
    _ExamQuestion('Economics', 'If demand is price elastic, a price increase will generally:', ['Increase total revenue', 'Reduce total revenue', 'Leave revenue unchanged in all cases', 'Make demand perfectly inelastic'], 1, 'With elastic demand, the percentage fall in quantity demanded exceeds the percentage rise in price, reducing total revenue.'),
    _ExamQuestion('Computer Science', 'Which data structure follows the Last-In, First-Out principle?', ['Queue', 'Stack', 'Tree', 'Graph'], 1, 'A stack removes the most recently added item first, following Last-In, First-Out ordering.'),
    _ExamQuestion('Computer Science', 'The primary purpose of a database primary key is to:', ['Encrypt all records', 'Uniquely identify each row', 'Compress the database', 'Replace every foreign key'], 1, 'A primary key uniquely identifies a row and enforces entity integrity within a relational table.'),
    _ExamQuestion('Public Administration', 'The politics-administration dichotomy is historically associated with:', ['Woodrow Wilson', 'Max Weber', 'Frederick Taylor', 'Herbert Simon'], 0, 'Woodrow Wilson\'s 1887 essay is commonly associated with the early formulation of separating political direction from administrative execution.'),
    _ExamQuestion('Public Administration', 'A performance audit primarily examines:', ['Only whether cash balances agree', 'Economy, efficiency and effectiveness', 'Only employee attendance', 'The political popularity of a programme'], 1, 'Performance auditing examines the three Es: economy in acquiring resources, efficiency in using them and effectiveness in achieving objectives.'),
    _ExamQuestion('Gender Studies', 'Intersectionality is most closely associated with the scholarship of:', ['Kimberlé Crenshaw', 'Mary Wollstonecraft', 'Emile Durkheim', 'Auguste Comte'], 0, 'Kimberlé Crenshaw developed the term to explain how overlapping structures such as race and gender can shape distinct experiences of discrimination.'),
    _ExamQuestion('Gender Studies', 'Unpaid care work is often undercounted in conventional GDP because it is:', ['Always illegal', 'Often outside market transactions', 'Never economically valuable', 'Only performed by paid workers'], 1, 'Unpaid household and care work produces real services but is commonly excluded from conventional GDP production boundaries.'),
    _ExamQuestion('Sociology', 'The sociological imagination links:', ['Personal troubles and public issues', 'Biology and chemistry only', 'Individual choice to weather', 'Language and mathematics'], 0, 'C. Wright Mills used the sociological imagination to connect individual experiences with wider historical and social structures.'),
    _ExamQuestion('Sociology', 'A social institution is best understood as:', ['A single building', 'An established pattern of norms and relationships organising social life', 'Any temporary crowd', 'A private opinion'], 1, 'Institutions such as family, education and law organise recurring social relationships through norms, roles and practices.'),
    _ExamQuestion('Criminology', 'The classical school of criminology is associated with the principle of:', ['Free will and proportionate punishment', 'Crime as inherited destiny', 'Labelling as the only cause of crime', 'Abolition of legal rules'], 0, 'Classical criminology emphasises rational choice, free will, legality and proportionate punishment, particularly in the work of Beccaria.'),
    _ExamQuestion('Criminology', 'The chain of custody is intended to protect:', ['The reputation of investigators', 'The integrity and documented handling of evidence', 'The speed of sentencing', 'The media value of a case'], 1, 'Chain-of-custody records document the handling and transfer of evidence to help establish that it has not been altered or contaminated.'),
    _ExamQuestion('Environmental Sciences', 'The mitigation hierarchy generally prioritises:', ['Compensation before prevention', 'Avoidance before minimisation and restoration', 'Monitoring instead of impact prevention', 'Project approval before assessment'], 1, 'The mitigation hierarchy gives priority to avoiding impacts, then minimising and restoring damage, with compensation considered for residual impacts where appropriate.'),
    _ExamQuestion('Environmental Sciences', 'The greenhouse gas most associated with fossil-fuel combustion is:', ['Carbon dioxide', 'Helium', 'Neon', 'Argon'], 0, 'Combustion of coal, oil and gas releases carbon dioxide, a major long-lived greenhouse gas.'),
    _ExamQuestion('Business Administration', 'In SWOT analysis, which is an external factor?', ['Strength', 'Weakness', 'Opportunity', 'Internal capability'], 2, 'Opportunities and threats are external conditions; strengths and weaknesses are internal characteristics of an organisation.'),
    _ExamQuestion('Business Administration', 'Working capital is commonly calculated as:', ['Current assets minus current liabilities', 'Total assets minus equity', 'Revenue minus expenses', 'Cash flow plus depreciation'], 0, 'Net working capital is current assets less current liabilities and indicates short-term liquidity resources.'),
    _ExamQuestion('Accountancy & Auditing', 'A sunk cost is a cost that:', ['Changes with each alternative', 'Has already been incurred and cannot be recovered', 'Is always avoidable', 'Is a future opportunity cost'], 1, 'Sunk costs are past and unrecoverable, so they are not relevant to forward-looking choices between alternatives.'),
    _ExamQuestion('Accountancy & Auditing', 'A flexible budget adjusts budgeted figures for:', ['Actual activity level', 'The auditor\'s opinion', 'The share price', 'Last year\'s tax rate only'], 0, 'A flexible budget recalculates expected costs and revenue at the actual activity level to support meaningful performance comparison.'),
    _ExamQuestion('Agriculture & Forestry', 'Soil salinity most directly refers to excessive:', ['Soluble salts in soil', 'Organic matter', 'Nitrogen-fixing bacteria', 'Soil fauna'], 0, 'Salinity is the accumulation of soluble salts in soil, which can reduce plant water uptake and crop productivity.'),
    _ExamQuestion('Agriculture & Forestry', 'Drip irrigation is designed to:', ['Flood the entire field', 'Apply water near plant roots in controlled amounts', 'Increase evaporation', 'Replace soil testing'], 1, 'Drip systems deliver water in controlled amounts near the root zone, potentially improving water-use efficiency when properly managed.'),
    _ExamQuestion('Anthropology', 'Ethnography is most closely associated with:', ['Long-term field-based study of social life', 'Laboratory measurement of voltage', 'Randomised clinical trials only', 'Satellite weather forecasting'], 0, 'Ethnography uses immersive fieldwork and qualitative methods to understand social practices and meanings in context.'),
    _ExamQuestion('Anthropology', 'A matrilineal descent system traces descent primarily through:', ['The father\'s line', 'The mother\'s line', 'The eldest child regardless of gender', 'The local government'], 1, 'Matrilineal descent assigns lineage membership through the maternal line, though authority and residence patterns may differ.'),
    _ExamQuestion('Applied Mathematics', 'The derivative of a function represents its:', ['Instantaneous rate of change', 'Total accumulated area in every case', 'Fixed initial value', 'Random error'], 0, 'The derivative gives the instantaneous rate at which a function changes with respect to its variable.'),
    _ExamQuestion('Applied Mathematics', 'Gaussian elimination is used to solve:', ['Linear systems of equations', 'Only differential equations', 'Chemical reaction rates', 'Sorting algorithms'], 0, 'Gaussian elimination applies elementary row operations to reduce a system of linear equations and determine its solutions.'),
    _ExamQuestion('Physics', 'The SI unit of electric resistance is:', ['Volt', 'Ampere', 'Ohm', 'Watt'], 2, 'Electrical resistance is measured in ohms, symbolised by the Greek letter omega.'),
    _ExamQuestion('Physics', 'Faraday\'s law concerns:', ['Electromagnetic induction', 'Nuclear fission', 'Gravitational attraction', 'Radioactive half-life'], 0, 'Faraday\'s law states that a changing magnetic flux induces an electromotive force in a circuit.'),
    _ExamQuestion('Chemistry', 'A catalyst generally increases reaction rate by:', ['Raising the equilibrium constant', 'Providing an alternative pathway with lower activation energy', 'Increasing product mass', 'Being permanently consumed'], 1, 'A catalyst provides an alternative reaction pathway with lower activation energy and is regenerated overall.'),
    _ExamQuestion('Chemistry', 'Chromatography is commonly used to:', ['Separate components of a mixture', 'Measure gravitational acceleration', 'Generate electricity', 'Determine atomic mass by weighing only'], 0, 'Chromatography separates mixture components through different interactions with stationary and mobile phases.'),
    _ExamQuestion('Constitutional Law', 'Judicial review generally concerns the power of courts to:', ['Make annual budgets', 'Assess legality or constitutionality of public action', 'Appoint every minister', 'Conduct elections'], 1, 'Judicial review allows courts to examine whether public action complies with applicable law and constitutional limits.'),
    _ExamQuestion('Constitutional Law', 'The doctrine of separation of powers distributes functions among:', ['Legislature, executive and judiciary', 'Only federal and local governments', 'Political parties and media', 'Banks and corporations'], 0, 'The doctrine separates legislative, executive and judicial functions and provides checks against arbitrary concentration of power.'),
    _ExamQuestion('British History', 'The Chartist movement primarily campaigned for:', ['Parliamentary and electoral reform', 'The abolition of factories', 'The restoration of feudalism', 'The creation of the European Union'], 0, 'Chartism was a nineteenth-century working-class movement that demanded political reforms including wider male suffrage and secret ballots.'),
    _ExamQuestion('British History', 'The Industrial Revolution first transformed production most dramatically through:', ['Mechanisation and factory production', 'Digital computing', 'Nuclear energy', 'Container shipping'], 0, 'Mechanisation, steam power and factory organisation transformed production and helped drive industrialisation in Britain.'),
    _ExamQuestion('Governance & Public Policies', 'A theory of change links:', ['Inputs and activities to outputs and intended outcomes', 'Only political speeches to election results', 'Audits to court appointments', 'Taxes to exchange rates'], 0, 'A theory of change makes explicit how resources and activities are expected to produce outputs and longer-term outcomes.'),
    _ExamQuestion('Governance & Public Policies', 'Impact evaluation seeks to estimate:', ['The causal effect of an intervention', 'Only the number of meetings held', 'The size of a department\'s building', 'The popularity of a minister'], 0, 'Impact evaluation estimates what difference an intervention caused relative to a credible counterfactual.'),
    _ExamQuestion('Town Planning & Urban Management', 'Mixed-use planning generally combines:', ['Compatible residential, commercial and other uses', 'Only industrial zones', 'Only highways and parking', 'Agriculture and mining exclusively'], 0, 'Mixed-use planning combines compatible activities to support accessibility, walkability and more efficient urban form.'),
    _ExamQuestion('Town Planning & Urban Management', 'A transport accessibility measure focuses on:', ['The number of cars owned only', 'How easily people reach jobs and services', 'Road length without destinations', 'Vehicle speed alone'], 1, 'Accessibility measures the time, cost and ease with which people can reach opportunities such as work, education and healthcare.'),
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

  static const _compulsorySubjects = <String>{
    'Pakistan Affairs',
    'Current Affairs',
    'General Science & Ability',
    'Islamic Studies',
    'English Usage',
  };

  static const _optionalSubjects = <String>{
    'Political Science',
    'International Relations',
    'Economics',
    'Computer Science',
    'Public Administration',
    'Gender Studies',
    'Sociology',
    'Criminology',
    'Environmental Sciences',
    'Business Administration',
    'Accountancy & Auditing',
    'Agriculture & Forestry',
    'Anthropology',
    'Applied Mathematics',
    'Physics',
    'Chemistry',
    'Constitutional Law',
    'British History',
    'Governance & Public Policies',
    'Town Planning & Urban Management',
  };

  List<_ExamQuestion> get _filtered {
    if (_subject == 'Mixed Compulsory') {
      return _questions.where((q) => _compulsorySubjects.contains(q.subject)).toList();
    }
    if (_subject == 'Mixed Optional') {
      return _questions.where((q) => _optionalSubjects.contains(q.subject)).toList();
    }
    return _questions.where((q) => q.subject == _subject).toList();
  }

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
            DropdownMenuItem(value: 'Mixed Optional', child: Text('Mixed optional subjects')),
            DropdownMenuItem(value: 'Pakistan Affairs', child: Text('Pakistan Affairs')),
            DropdownMenuItem(value: 'Current Affairs', child: Text('Current Affairs')),
            DropdownMenuItem(value: 'General Science & Ability', child: Text('General Science & Ability')),
            DropdownMenuItem(value: 'Islamic Studies', child: Text('Islamic Studies')),
            DropdownMenuItem(value: 'English Usage', child: Text('English usage')),
            DropdownMenuItem(value: 'Political Science', child: Text('Political Science')),
            DropdownMenuItem(value: 'International Relations', child: Text('International Relations')),
            DropdownMenuItem(value: 'Economics', child: Text('Economics')),
            DropdownMenuItem(value: 'Computer Science', child: Text('Computer Science')),
            DropdownMenuItem(value: 'Public Administration', child: Text('Public Administration')),
            DropdownMenuItem(value: 'Gender Studies', child: Text('Gender Studies')),
            DropdownMenuItem(value: 'Sociology', child: Text('Sociology')),
            DropdownMenuItem(value: 'Criminology', child: Text('Criminology')),
            DropdownMenuItem(value: 'Environmental Sciences', child: Text('Environmental Sciences')),
            DropdownMenuItem(value: 'Business Administration', child: Text('Business Administration')),
            DropdownMenuItem(value: 'Accountancy & Auditing', child: Text('Accountancy & Auditing')),
            DropdownMenuItem(value: 'Agriculture & Forestry', child: Text('Agriculture & Forestry')),
            DropdownMenuItem(value: 'Anthropology', child: Text('Anthropology')),
            DropdownMenuItem(value: 'Applied Mathematics', child: Text('Applied Mathematics')),
            DropdownMenuItem(value: 'Physics', child: Text('Physics')),
            DropdownMenuItem(value: 'Chemistry', child: Text('Chemistry')),
            DropdownMenuItem(value: 'Constitutional Law', child: Text('Constitutional Law')),
            DropdownMenuItem(value: 'British History', child: Text('British History')),
            DropdownMenuItem(value: 'Governance & Public Policies', child: Text('Governance & Public Policies')),
            DropdownMenuItem(value: 'Town Planning & Urban Management', child: Text('Town Planning & Urban Management')),
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
