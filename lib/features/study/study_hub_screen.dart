import 'package:flutter/material.dart';

class StudyHubScreen extends StatelessWidget {
  const StudyHubScreen({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 4,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Study Centre'),
        bottom: const TabBar(
          isScrollable: true,
          tabs: [
            Tab(text: 'Pakistan Affairs'),
            Tab(text: 'Current Affairs'),
            Tab(text: 'MCQ Practice'),
            Tab(text: 'CSS Syllabus'),
          ],
        ),
      ),
      body: const TabBarView(
        children: [
          _PakistanAffairsTab(),
          _CurrentAffairsTab(),
          _McqTab(),
          _SyllabusTab(),
        ],
      ),
    ),
  );
}

class _PakistanAffairsTab extends StatelessWidget {
  const _PakistanAffairsTab();

  static const lessons = <_Lesson>[
    _Lesson('01', 'Historical foundations of Muslim political identity', '1857–1905', 'Understand the decline of Mughal authority, the consequences of 1857, reform movements and the conditions that shaped Muslim political consciousness.', [
      'The uprising of 1857 and its political, social and educational consequences',
      'Sir Syed Ahmad Khan: educational reform, Aligarh and political pragmatism',
      'The Deoband and other religious-intellectual responses',
      'Urdu-Hindi controversy and the growth of representative politics',
    ], 'Do not reduce the period to a list of personalities. Explain how educational exclusion, political representation and competing national visions interacted.'),
    _Lesson('02', 'Emergence of organised Muslim politics', '1905–1916', 'Trace the shift from educational reform to organised constitutional politics.', [
      'Partition of Bengal (1905) and annulment (1911)',
      'Simla Deputation (1906)',
      'Formation of the All-India Muslim League (1906)',
      'Morley–Minto Reforms (1909) and separate electorates',
      'Lucknow Pact (1916)',
    ], 'Evaluate both the political gains and the limitations of separate electorates. Distinguish political safeguards from the later demand for a separate state.'),
    _Lesson('03', 'Constitutional developments and competing visions', '1919–1935', 'Study constitutional reforms and the changing relationship between Congress, the Muslim League and the British government.', [
      'Montagu–Chelmsford Reforms and Government of India Act 1919',
      'Khilafat and Non-Cooperation movements',
      'Nehru Report (1928) and Jinnah’s Fourteen Points (1929)',
      'Round Table Conferences',
      'Government of India Act 1935',
    ], 'Compare the constitutional proposals: what did they offer on federalism, minority safeguards and provincial autonomy?'),
    _Lesson('04', 'The Pakistan demand and its political evolution', '1937–1940', 'Analyse the provincial elections, Congress ministries, Muslim League mobilisation and the Lahore Resolution.', [
      '1937 provincial elections and formation of ministries',
      'Congress rule and Muslim League’s critique',
      'Day of Deliverance (1939)',
      'Lahore Resolution, 23 March 1940',
    ], 'Treat the Lahore Resolution in its historical context. Explain the political conditions behind it rather than presenting it as an isolated announcement.'),
    _Lesson('05', 'Towards independence and partition', '1940–1947', 'Follow the negotiations, plans and political decisions that culminated in independence and partition.', [
      'Cripps Mission (1942) and Quit India movement',
      'Gandhi–Jinnah talks (1944)',
      'Simla Conference (1945) and elections (1945–46)',
      'Cabinet Mission Plan (1946)',
      '3 June Plan, Indian Independence Act and partition',
    ], 'A strong answer weighs political agency, constitutional deadlock, communal violence and the accelerated British withdrawal. Avoid monocausal explanations.'),
    _Lesson('06', 'Early challenges of the new state', '1947–1958', 'Assess the institutional, economic, security and constitutional problems faced by Pakistan after independence.', [
      'Refugee settlement and administrative capacity',
      'Division of assets, defence and financial resources',
      'Kashmir dispute and the first war',
      'Objectives Resolution (1949)',
      'Constitutional delays and the 1956 Constitution',
    ], 'Connect immediate administrative pressures with the longer-term problem of civil-military relations and constitutional continuity.'),
    _Lesson('07', 'Constitutional and political development', '1958–1988', 'Examine military interventions, constitutional experiments and the changing balance between institutions.', [
      '1958 martial law and the 1962 Constitution',
      'The 1965 war and political consequences',
      'The 1970 elections and the 1971 crisis',
      'The 1973 Constitution: federal parliamentary framework',
      '1977 martial law and the Zia period',
    ], 'Use constitutional provisions and institutional changes as evidence. Explain causes and consequences rather than merely narrating regimes.'),
    _Lesson('08', 'Federalism, democracy and governance', '1988–present', 'Build an analytical understanding of democratic transitions, federal relations and governance challenges.', [
      'Civilian governments and institutional imbalance',
      'The 18th Constitutional Amendment (2010)',
      'Council of Common Interests and National Finance Commission',
      'Local government and service delivery',
      'Rule of law, accountability and democratic consolidation',
    ], 'Separate constitutional design from implementation. Assess how fiscal capacity, political incentives and institutional trust affect federal performance.'),
  ];

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(16),
    children: [
      const _SectionIntro(
        eyebrow: 'FOUNDATION COURSE',
        title: 'Pakistan Affairs',
        description: 'Eight structured starting lessons. Read the argument, test your understanding, then practise writing analytical answers.',
      ),
      ...lessons.map((lesson) => Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: ExpansionTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xFFEAF3FB),
            foregroundColor: const Color(0xFF1769AA),
            child: Text(lesson.number, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12)),
          ),
          title: Text(lesson.title, style: const TextStyle(fontWeight: FontWeight.w700)),
          subtitle: Text(lesson.period),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
          children: [
            Align(alignment: Alignment.centerLeft, child: Text(lesson.overview)),
            const SizedBox(height: 12),
            const Align(alignment: Alignment.centerLeft, child: Text('CORE AREAS', style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF1769AA), fontSize: 11, letterSpacing: 1))),
            const SizedBox(height: 8),
            ...lesson.points.map((point) => Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Icon(Icons.arrow_right, size: 19, color: Color(0xFF1769AA)),
                Expanded(child: Text(point)),
              ]),
            )),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: const Color(0xFFF0F6FC), borderRadius: BorderRadius.circular(10)),
              child: Text('EXAMINER’S ANGLE\n${lesson.examinerAngle}', style: const TextStyle(height: 1.45)),
            ),
          ],
        ),
      )),
      const Padding(
        padding: EdgeInsets.only(top: 8, bottom: 20),
        child: Text('Study note: this is a structured introductory course, not a substitute for primary documents, recommended readings or the latest FPSC syllabus.', style: TextStyle(fontSize: 12, color: Color(0xFF627D98))),
      ),
    ],
  );
}

class _CurrentAffairsTab extends StatelessWidget {
  const _CurrentAffairsTab();

  static const issues = <_Issue>[
    _Issue('Pakistan’s economy and structural reform', 'Economy', 'Analyse fiscal constraints, the tax base, debt servicing, energy-sector circular debt, exports and productivity. Connect short-term stabilisation with long-term institutional reform.', 'What reforms can improve fiscal capacity without worsening inequality?'),
    _Issue('Water security and climate resilience', 'Climate & resources', 'Study water availability, irrigation efficiency, groundwater depletion, flood exposure, glacial melt, urban drainage and climate adaptation finance.', 'Why is water governance as important as water infrastructure?'),
    _Issue('Pakistan’s federal structure and provincial capacity', 'Governance', 'Examine the 18th Amendment, NFC arrangements, Council of Common Interests, local government and differences between devolution on paper and service delivery.', 'How can accountability be strengthened across all three tiers of government?'),
    _Issue('Regional connectivity and South Asian stability', 'Foreign policy', 'Assess trade connectivity, border management, Afghanistan, India, China, Iran and the strategic importance of regional economic cooperation.', 'Can economic interdependence reduce regional security dilemmas?'),
    _Issue('Technology, AI and the future of work', 'Science & technology', 'Consider digital public infrastructure, data governance, cyber security, AI adoption, skills, labour-market transitions and unequal access.', 'What regulatory approach can encourage innovation while protecting citizens?'),
    _Issue('Human development and social inclusion', 'Society', 'Evaluate education quality, health access, population growth, gender inclusion, nutrition and the relationship between human capital and economic growth.', 'Why do increases in enrolment or spending not automatically produce better outcomes?'),
  ];

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(16),
    children: [
      const _SectionIntro(
        eyebrow: 'ANALYTICAL ISSUE FILES',
        title: 'Current Affairs',
        description: 'Issue frameworks for CSS answer-writing. These are evergreen study briefs, not a live news feed; verify dates, statistics and recent developments from current primary sources before using them.',
      ),
      ...issues.map((issue) => Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: ExpansionTile(
          title: Text(issue.title, style: const TextStyle(fontWeight: FontWeight.w700)),
          subtitle: Text(issue.category),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            Align(alignment: Alignment.centerLeft, child: Text(issue.brief)),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: const Color(0xFFF0F6FC), borderRadius: BorderRadius.circular(10)),
              child: Text('PRACTICE QUESTION\n${issue.question}', style: const TextStyle(height: 1.45)),
            ),
          ],
        ),
      )),
    ],
  );
}

class _McqTab extends StatefulWidget {
  const _McqTab();
  @override
  State<_McqTab> createState() => _McqTabState();
}

class _McqTabState extends State<_McqTab> {
  static const questions = <_Question>[
    _Question('The Simla Deputation took place in:', ['1905', '1906', '1909', '1911'], 1, 'The Simla Deputation met Lord Minto in October 1906 and sought political safeguards for Muslims.'),
    _Question('The All-India Muslim League was founded in:', ['1905', '1906', '1907', '1909'], 1, 'The Muslim League was established at Dhaka in December 1906.'),
    _Question('The Morley–Minto Reforms are associated with:', ['1909', '1919', '1935', '1947'], 0, 'The Indian Councils Act 1909 introduced separate electorates for Muslims.'),
    _Question('Jinnah’s Fourteen Points were presented in:', ['1927', '1928', '1929', '1930'], 2, 'The Fourteen Points were articulated in 1929 in response to the Nehru Report.'),
    _Question('The Allahabad Address was delivered by Allama Iqbal in:', ['1928', '1929', '1930', '1932'], 2, 'Iqbal delivered the presidential address at the Muslim League session in Allahabad in 1930.'),
    _Question('The Lahore Resolution was adopted on:', ['14 August 1940', '23 March 1940', '3 June 1947', '16 August 1946'], 1, 'The resolution was adopted at the Muslim League session in Lahore on 23 March 1940.'),
    _Question('The Government of India Act that introduced provincial autonomy was:', ['1909', '1919', '1935', '1947'], 2, 'The Government of India Act 1935 introduced provincial autonomy and proposed an all-India federation.'),
    _Question('The Cabinet Mission came to India in:', ['1942', '1945', '1946', '1947'], 2, 'The Cabinet Mission arrived in 1946 to propose a constitutional framework for transfer of power.'),
    _Question('The Objectives Resolution was passed by Pakistan’s Constituent Assembly in:', ['1947', '1948', '1949', '1951'], 2, 'The Objectives Resolution was adopted on 12 March 1949.'),
    _Question('The Constitution of 1973 established a:', ['Presidential system', 'Parliamentary federal system', 'Confederal system', 'Unitary presidential system'], 1, 'The 1973 Constitution established a federal parliamentary framework.'),

    _Question('The first Constitution of Pakistan came into force on:', ['23 March 1956', '14 August 1947', '8 June 1962', '10 April 1973'], 0, 'The 1956 Constitution came into force on 23 March 1956 and declared Pakistan an Islamic Republic.'),
    _Question('The One Unit scheme was introduced in:', ['1949', '1955', '1958', '1962'], 1, 'The One Unit scheme merged the provinces and states of West Pakistan into one administrative unit in 1955.'),
    _Question('The 1962 Constitution introduced which form of government?', ['Parliamentary', 'Presidential', 'Confederal', 'Directorial'], 1, 'The 1962 Constitution established a presidential system with a strong executive presidency.'),
    _Question('The first general elections on the basis of adult franchise in Pakistan were held in:', ['1956', '1965', '1970', '1977'], 2, 'The 1970 general elections were the first nationwide elections based on adult franchise.'),
    _Question('The Legal Framework Order associated with the 1970 elections was issued by:', ['Ayub Khan', 'Yahya Khan', 'Zulfikar Ali Bhutto', 'Zia-ul-Haq'], 1, 'President Yahya Khan issued the Legal Framework Order in 1970 to provide the framework for the elections and constitution-making.'),
    _Question('The Constitution of 1973 was passed by the National Assembly on:', ['10 April 1973', '14 August 1973', '23 March 1973', '12 March 1973'], 0, 'The National Assembly passed the 1973 Constitution on 10 April; it came into force on 14 August 1973.'),
    _Question('The Eighth Amendment to the 1973 Constitution was passed in:', ['1985', '1988', '1997', '2003'], 0, 'The Eighth Amendment was adopted in 1985 and, among other changes, strengthened presidential powers including the dissolution power under Article 58(2)(b).'),
    _Question('The 18th Constitutional Amendment was enacted in:', ['2008', '2010', '2013', '2018'], 1, 'The 18th Amendment was enacted in 2010 and substantially altered the federal-provincial distribution of powers.'),
    _Question('The Council of Common Interests is provided under which article?', ['Article 25', 'Article 58', 'Article 153', 'Article 160'], 2, 'Article 153 of the Constitution provides for the Council of Common Interests.'),
    _Question('The National Finance Commission is constitutionally provided under:', ['Article 140', 'Article 153', 'Article 160', 'Article 184'], 2, 'Article 160 provides for the National Finance Commission to make recommendations on federal-provincial financial distribution.'),
    _Question('The Objectives Resolution was moved by:', ['Liaquat Ali Khan', 'Khawaja Nazimuddin', 'Muhammad Ali Bogra', 'Iskander Mirza'], 0, 'Prime Minister Liaquat Ali Khan moved the Objectives Resolution in the Constituent Assembly in March 1949.'),
    _Question('The first Governor-General of Pakistan was:', ['Liaquat Ali Khan', 'Muhammad Ali Jinnah', 'Ghulam Muhammad', 'Khawaja Nazimuddin'], 1, 'Muhammad Ali Jinnah served as Pakistan’s first Governor-General from 1947 until his death in 1948.'),
    _Question('The first Prime Minister of Pakistan was:', ['Muhammad Ali Jinnah', 'Liaquat Ali Khan', 'Ibrahim Ismail Chundrigar', 'Khawaja Nazimuddin'], 1, 'Liaquat Ali Khan became Pakistan’s first Prime Minister in August 1947.'),
    _Question('The Indus Waters Treaty was signed in:', ['1958', '1960', '1965', '1972'], 1, 'Pakistan and India signed the Indus Waters Treaty in 1960 with the World Bank playing a facilitating role.'),
    _Question('The Tashkent Declaration followed the:', ['1948 war', '1965 war', '1971 war', 'Kargil conflict'], 1, 'The Tashkent Declaration was signed in January 1966 after the 1965 war between Pakistan and India.'),
    _Question('The Simla Agreement between Pakistan and India was signed in:', ['1966', '1971', '1972', '1974'], 2, 'The Simla Agreement was signed in July 1972 after the 1971 war.'),
    _Question('The first session of the Constituent Assembly of Pakistan was held on:', ['10 August 1947', '14 August 1947', '11 September 1948', '12 March 1949'], 0, 'The Constituent Assembly held its first meeting on 10 August 1947 in Karachi.'),
    _Question('The Lahore Resolution was moved by:', ['A.K. Fazlul Huq', 'Liaquat Ali Khan', 'Chaudhry Khaliquzzaman', 'Huseyn Shaheed Suhrawardy'], 0, 'A.K. Fazlul Huq, the Premier of Bengal, moved the Lahore Resolution at the Muslim League session.'),
    _Question('The Nehru Report was published in:', ['1927', '1928', '1929', '1930'], 1, 'The Nehru Report was published in 1928 and proposed a constitutional framework for British India.'),
    _Question('The Cripps Mission visited India in:', ['1940', '1942', '1945', '1946'], 1, 'The Cripps Mission arrived in 1942 during the Second World War to secure Indian cooperation.'),
  ];

  int index = 0;
  int? selected;
  int correct = 0;
  bool finished = false;

  void choose(int value) {
    if (selected != null || finished) return;
    setState(() {
      selected = value;
      if (value == questions[index].answer) correct++;
    });
  }

  void next() {
    setState(() {
      if (index == questions.length - 1) {
        finished = true;
      } else {
        index++;
        selected = null;
      }
    });
  }

  void restart() => setState(() { index = 0; selected = null; correct = 0; finished = false; });

  @override
  Widget build(BuildContext context) {
    if (finished) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.emoji_events_outlined, size: 54, color: Color(0xFF1769AA)),
            const SizedBox(height: 12),
            const Text('Practice complete', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text('$correct / ${questions.length} correct', style: const TextStyle(fontSize: 20, color: Color(0xFF1769AA), fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            const Text('Review explanations and revisit the relevant lesson before attempting again.', textAlign: TextAlign.center),
            const SizedBox(height: 18),
            FilledButton(onPressed: restart, child: const Text('Try again')),
          ]),
        ),
      );
    }

    final question = questions[index];
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('PAKISTAN AFFAIRS • FOUNDATION', style: TextStyle(fontSize: 11, letterSpacing: .8, fontWeight: FontWeight.w800, color: Color(0xFF1769AA))),
          Text('${index + 1} / ${questions.length}', style: const TextStyle(fontWeight: FontWeight.w700)),
        ]),
        const SizedBox(height: 10),
        LinearProgressIndicator(value: (index + 1) / questions.length, minHeight: 6, borderRadius: BorderRadius.circular(8)),
        const SizedBox(height: 24),
        Text(question.prompt, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w800, height: 1.35)),
        const SizedBox(height: 18),
        ...List.generate(question.options.length, (i) {
          final isSelected = selected == i;
          final isCorrect = question.answer == i;
          Color? background;
          Color? foreground;
          if (selected != null && isCorrect) {
            background = const Color(0xFFE4F5EA);
            foreground = const Color(0xFF176B3A);
          } else if (isSelected && !isCorrect) {
            background = const Color(0xFFFCE8E6);
            foreground = const Color(0xFF9B2C2C);
          }
          return Card(
            color: background,
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              onTap: selected == null ? () => choose(i) : null,
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFEAF3FB),
                child: Text(String.fromCharCode(65 + i), style: const TextStyle(color: Color(0xFF1769AA), fontWeight: FontWeight.w700)),
              ),
              title: Text(question.options[i], style: TextStyle(fontWeight: isSelected || (selected != null && isCorrect) ? FontWeight.w700 : FontWeight.w500, color: foreground)),
              trailing: selected != null && isCorrect ? const Icon(Icons.check_circle, color: Color(0xFF176B3A)) : isSelected ? const Icon(Icons.cancel, color: Color(0xFF9B2C2C)) : null,
            ),
          );
        }),
        if (selected != null) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: const Color(0xFFF0F6FC), borderRadius: BorderRadius.circular(12)),
            child: Text('${selected == question.answer ? 'Correct.' : 'Not quite.'} ${question.explanation}', style: const TextStyle(height: 1.45)),
          ),
          const SizedBox(height: 16),
          FilledButton(onPressed: next, child: Text(index == questions.length - 1 ? 'See result' : 'Next question')),
        ],
      ],
    );
  }
}

class _SyllabusTab extends StatefulWidget {
  const _SyllabusTab();
  @override
  State<_SyllabusTab> createState() => _SyllabusTabState();
}

class _SyllabusTabState extends State<_SyllabusTab> {
  static const groups = <String, List<String>>{
    'Compulsory papers': [
      'English Essay',
      'English (Precis & Composition)',
      'General Science & Ability',
      'Current Affairs',
      'Pakistan Affairs',
      'Islamic Studies / Comparative Study of Major Religions',
    ],
    'Optional subject groups (600 marks)': [
      'Group I — 200 marks, choose ONE: Accountancy & Auditing; Economics; Computer Science; Political Science; International Relations',
      'Group II — choose subject(s) totalling 200 marks: Physics (200); Chemistry (200); Applied Mathematics (100); Pure Mathematics (100); Statistics (100); Geology (100)',
      'Group III — 100 marks, choose ONE: Business Administration; Public Administration; Governance & Public Policies; Town Planning & Urban Management',
      'Group IV — 100 marks, choose ONE: History of Pakistan & India; Islamic History & Culture; British History; European History; History of USA',
      'Group V — 100 marks, choose ONE: Gender Studies; Environmental Sciences; Agriculture & Forestry; Botany; Zoology; English Literature; Urdu Literature',
      'Group VI — 100 marks, choose ONE: Law; Constitutional Law; International Law; Muslim Law & Jurisprudence; Mercantile Law; Criminology; Philosophy',
      'Group VII — 100 marks, choose ONE: Journalism & Mass Communication; Psychology; Geography; Sociology; Anthropology; Punjabi; Sindhi; Pashto; Balochi; Persian; Arabic',
    ],
    'Written examination readiness': [
      'Download and verify the latest official FPSC syllabus',
      'Confirm optional subject groups and mark allocations',
      'Prepare a topic-wise past-paper map',
      'Complete at least one timed answer per major topic',
      'Attempt full-length mock papers under exam conditions',
    ],
  };

  final Set<String> completed = <String>{};

  @override
  Widget build(BuildContext context) {
    final all = groups.values.fold<int>(0, (sum, items) => sum + items.length);
    final progress = all == 0 ? 0.0 : completed.length / all;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const _SectionIntro(
          eyebrow: 'PREPARATION CHECKLIST',
          title: 'CSS syllabus tracker',
          description: 'Tick off what you have reviewed. The written examination scheme below follows the FPSC revised CSS syllabus; always verify the latest notice for your exam cycle before finalising subjects.',
        ),
        const Card(child: Padding(
          padding: EdgeInsets.all(14),
          child: Text('EXAM STRUCTURE  •  1,200 MARKS\\n6 compulsory papers = 600 marks + optional subjects = 600 marks. A 200-mark subject comprises two papers; each 100-mark subject comprises one paper. Group II allows a combination totalling 200 marks; Groups III–VII allow one 100-mark subject each.', style: TextStyle(height: 1.5)),
        )),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Overall checklist', style: TextStyle(fontWeight: FontWeight.w700)),
                Text('${completed.length} / $all', style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF1769AA))),
              ]),
              const SizedBox(height: 10),
              LinearProgressIndicator(value: progress, minHeight: 8, borderRadius: BorderRadius.circular(8)),
              const SizedBox(height: 6),
              Text('${(progress * 100).round()}% marked complete', style: const TextStyle(fontSize: 12, color: Color(0xFF627D98))),
            ]),
          ),
        ),
        const SizedBox(height: 10),
        ...groups.entries.map((entry) => Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: ExpansionTile(
            initiallyExpanded: entry.key == 'Compulsory papers',
            title: Text(entry.key, style: const TextStyle(fontWeight: FontWeight.w700)),
            subtitle: Text('${entry.value.where(completed.contains).length} of ${entry.value.length} completed'),
            children: entry.value.map((item) => CheckboxListTile(
              value: completed.contains(item),
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(item, style: const TextStyle(fontSize: 14)),
              onChanged: (value) => setState(() {
                if (value == true) {
                  completed.add(item);
                } else {
                  completed.remove(item);
                }
              }),
            )).toList(),
          ),
        )),
      ],
    );
  }
}

class _SectionIntro extends StatelessWidget {
  const _SectionIntro({required this.eyebrow, required this.title, required this.description});
  final String eyebrow;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 18),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(eyebrow, style: const TextStyle(fontSize: 10, letterSpacing: 1.2, fontWeight: FontWeight.w800, color: Color(0xFF1769AA))),
      const SizedBox(height: 6),
      Text(title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Color(0xFF102A43))),
      const SizedBox(height: 6),
      Text(description, style: const TextStyle(color: Color(0xFF627D98), height: 1.45)),
    ]),
  );
}

class _Lesson {
  const _Lesson(this.number, this.title, this.period, this.overview, this.points, this.examinerAngle);
  final String number, title, period, overview, examinerAngle;
  final List<String> points;
}

class _Issue {
  const _Issue(this.title, this.category, this.brief, this.question);
  final String title, category, brief, question;
}

class _Question {
  const _Question(this.prompt, this.options, this.answer, this.explanation);
  final String prompt;
  final List<String> options;
  final int answer;
  final String explanation;
}
