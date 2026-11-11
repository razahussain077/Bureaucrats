import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'academy_library_screen.dart';

class StudyHubScreen extends StatelessWidget {
  const StudyHubScreen({super.key, this.initialTabIndex = 0});

  final int initialTabIndex;

  @override
  Widget build(BuildContext context) => DefaultTabController(
    initialIndex: initialTabIndex.clamp(0, 7).toInt(),
    length: 8,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Study Centre'),
        bottom: const TabBar(
          isScrollable: true,
          tabs: [
            Tab(text: 'Pakistan Affairs'),
            Tab(text: 'Compulsory Papers'),
            Tab(text: 'Optional Papers'),
            Tab(text: 'Current Affairs'),
            Tab(text: 'MCQ Practice'),
            Tab(text: 'Past Papers'),
            Tab(text: 'CSS Syllabus'),
            Tab(text: 'Academy Lessons'),
          ],
        ),
      ),
      body: const TabBarView(
        children: [
          _PakistanAffairsTab(),
          _CompulsoryTab(),
          _OptionalPapersTab(),
          _CurrentAffairsTab(),
          _McqTab(),
          _PastPapersTab(),
          _SyllabusTab(),
          AcademyLibraryScreen(),
        ],
      ),
    ),
  );
}

class _PakistanAffairsTab extends StatelessWidget {
  const _PakistanAffairsTab();

  static const _teachingNotes = <String, String>{
    '01': 'The events of 1857 marked a decisive rupture in North Indian political life. The end of the Mughal dynasty and the transfer of authority to the British Crown changed the structure of power. Muslim communities faced uneven regional consequences, including loss of political influence and barriers to new administrative opportunities. Reformers responded in different ways: Sir Syed Ahmad Khan emphasised modern education and engagement with the colonial state; the Deoband movement prioritised religious learning and moral renewal. These responses were not identical, and Muslim society was never politically or intellectually uniform. The Urdu-Hindi controversy and debates over representation gradually made language, education and political safeguards central questions. The key historical argument is that Muslim political identity developed through several overlapping processes—not through one event or one leader alone.',
    '02': 'The 1905 partition of Bengal altered provincial politics and was welcomed by many Muslims in eastern Bengal, while it faced strong opposition from sections of the nationalist movement. Its annulment in 1911 reinforced Muslim concerns about the reliability of political assurances. The Simla Deputation of 1906 sought separate political representation; the Muslim League, founded later that year at Dhaka, provided an organised platform. The Indian Councils Act 1909 recognised separate electorates, giving Muslims a distinct channel of representation but also institutionalising communal categories. The Lucknow Pact of 1916 demonstrated that Congress and the League could negotiate constitutional arrangements. In an answer, distinguish the immediate demand for safeguards within a united India from the later evolution of the Pakistan demand.',
    '03': 'The Government of India Act 1919 introduced dyarchy in the provinces, dividing subjects between transferred and reserved categories, but its limited franchise and executive controls left substantial dissatisfaction. The Khilafat and Non-Cooperation movements briefly brought different political constituencies into a shared campaign, though their objectives and later trajectories diverged. The Nehru Report of 1928 proposed dominion status and a constitutional framework; Jinnah’s Fourteen Points in 1929 articulated safeguards relating to federalism, provincial autonomy and minority representation. The Round Table Conferences exposed disagreements over the constitutional future of India. The Government of India Act 1935 expanded provincial autonomy and proposed a federation that never fully came into operation. Compare these proposals on the distribution of power, not merely their dates.',
    '04': 'The 1937 provincial elections were a turning point in party organisation and political messaging. Congress formed ministries in several provinces; the Muslim League struggled electorally in some Muslim-majority regions and subsequently intensified its effort to become the principal representative of Muslim political interests. League criticism of Congress ministries became part of its mobilisation narrative, while the experiences and interpretations of provincial politics were contested. The resignation of Congress ministries in 1939 and the League’s observance of the Day of Deliverance reflected deepening political polarisation. The Lahore Resolution of 23 March 1940 called for geographically contiguous units in Muslim-majority regions to be constituted into independent states, with autonomous and sovereign constituent units. A strong answer explains how provincial politics, constitutional deadlock and competing ideas of representation shaped the resolution.',
    '05': 'The final phase of British rule involved wartime pressures, failed constitutional negotiations and increasingly irreconcilable political claims. The Cripps proposals of 1942 did not secure agreement. The Gandhi–Jinnah talks in 1944 failed to bridge differences over the principle and timing of partition. The 1945–46 elections strengthened the League’s claim to speak for a large majority of Muslim voters in the separate Muslim constituencies, while Congress won broad support in general constituencies. The Cabinet Mission Plan of 1946 attempted to preserve a united India through a weak centre and provincial groupings, but disagreement over its interpretation and implementation undermined it. The 3 June Plan accepted partition; the Indian Independence Act 1947 provided the legal framework for the creation of two dominions. Analyse agency, negotiation and violence together.',
    '06': 'Pakistan inherited a new state structure under severe pressure: mass migration, communal violence, shortages of trained personnel, disputes over assets and the urgent task of building central institutions. The Kashmir conflict became an early security challenge. The Objectives Resolution, adopted on 12 March 1949, articulated principles that influenced later constitutional debates about sovereignty, democracy and the role of Islam. Constitution-making was delayed by disagreements over representation, federalism, language and the balance between the centre and provinces. The 1956 Constitution established a parliamentary federal framework and declared Pakistan an Islamic Republic, but it did not produce durable constitutional stability. Avoid treating the early period as a simple list of crises; show how institutional choices and unresolved political bargains shaped later governance.',
    '07': 'The 1958 military takeover interrupted constitutional government. The 1962 Constitution introduced a presidential system and a centralised political structure. The 1965 war had significant political, diplomatic and economic consequences, while the Tashkent Declaration generated domestic controversy. The 1970 general elections produced a clear majority for the Awami League in the National Assembly, but the transfer of power did not occur. Political confrontation, military action, civil war and Indian intervention culminated in the separation of East Pakistan in 1971. The 1973 Constitution, adopted by consensus in the National Assembly, restored a parliamentary federal framework and remains the central constitutional document. The 1977 coup and subsequent military rule again disrupted constitutional continuity. Explain the interaction between electoral legitimacy, federal accommodation and coercive power.',
    '08': 'The post-1988 period has included alternating civilian and military-led governments, constitutional amendments and recurring disputes over institutional authority. The 18th Amendment of 2010 strengthened parliamentary government, expanded provincial autonomy and abolished the Concurrent Legislative List, while related reforms affected appointments and constitutional institutions. The Council of Common Interests provides a forum for federal-provincial coordination on shared subjects; the National Finance Commission addresses distribution of financial resources. Their effectiveness depends on regular meetings, reliable data, administrative capacity and political trust. Local government is essential for service delivery but its design and continuity vary across provinces. A balanced answer distinguishes constitutional devolution from practical outcomes in education, health, policing and municipal services.',
  };

  static const _writingTasks = <String, String>{
    '01': '“Muslim political consciousness in colonial India emerged from educational, social and constitutional developments.” Discuss with reference to 1857–1905.',
    '02': 'Evaluate the significance and limitations of separate electorates in the evolution of Muslim political representation.',
    '03': 'Compare the Nehru Report and Jinnah’s Fourteen Points with reference to federalism and minority safeguards.',
    '04': 'Was the Lahore Resolution a sudden departure or the outcome of accumulated constitutional and political tensions? Analyse.',
    '05': 'Assess the reasons for the failure of the Cabinet Mission Plan and the consequences for the transfer of power.',
    '06': 'Discuss how the constitutional delays of 1947–1956 affected Pakistan’s federal and political development.',
    '07': '“The crisis of 1971 exposed the consequences of denying electoral and federal accommodation.” Discuss.',
    '08': 'Evaluate the achievements and implementation challenges of the 18th Constitutional Amendment.',
  };

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
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: const Color(0xFFFAFCFE), border: Border.all(color: const Color(0xFFE3ECF4)), borderRadius: BorderRadius.circular(12)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('CLASS NOTES', style: TextStyle(fontSize: 11, letterSpacing: 1, fontWeight: FontWeight.w900, color: Color(0xFF1769AA))),
                const SizedBox(height: 8),
                Text(_teachingNotes[lesson.number] ?? 'Use the core areas below to build a chronological and evidence-led account.', style: const TextStyle(height: 1.6)),
                const SizedBox(height: 10),
                const Text('ANSWER-WRITING TASK', style: TextStyle(fontSize: 10, letterSpacing: .8, fontWeight: FontWeight.w900, color: Color(0xFF1769AA))),
                const SizedBox(height: 5),
                Text(_writingTasks[lesson.number] ?? 'Write a short analytical answer using a thesis, evidence and a balanced conclusion.', style: const TextStyle(height: 1.5)),
              ]),
            ),
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


class _CompulsoryTab extends StatelessWidget {
  const _CompulsoryTab();

  static const courses = <_CoreCourse>[
    _CoreCourse('English Essay', '100 marks', 'Build a defensible thesis, a coherent argument and evidence-led paragraphs.', [
      'Interpret the question: command words, scope and assumptions',
      'Choose and narrow a topic; formulate a precise thesis',
      'Plan a logical outline with a clear introduction and conclusion',
      'Develop analytical paragraphs using claims, evidence and reasoning',
      'Use examples, counterarguments and balanced evaluation',
      'Practise timed essays, revision and language accuracy',
    ], 'The examiner assesses relevant knowledge, analysis, organisation, expression and technical control. Avoid memorised material that does not answer the exact topic.'),
    _CoreCourse('English (Precis & Composition)', '100 marks', 'Practise the distinct language tasks specified in the FPSC syllabus.', [
      'Precis writing: central idea, compression, title and faithful tone',
      'Reading comprehension: inference, evidence and concise responses',
      'Grammar and vocabulary: tense, articles, prepositions, conjunctions and usage',
      'Sentence correction: identify the exact structural or punctuation fault',
      'Grouping of words and pairs of commonly confused words',
      'Urdu-to-English translation: meaning, idiom and sentence structure',
    ], 'Do not add opinions to a precis or alter the author’s meaning. In correction questions, make only the necessary changes.'),
    _CoreCourse('General Science & Ability', '100 marks', 'Cover the official science and quantitative / reasoning components systematically.', [
      'Physical sciences: universe, Earth systems, weather, hazards and energy',
      'Chemistry and materials: atomic structure, bonding, radiation and modern materials',
      'Biological sciences: cells, biomolecules, plant and animal kingdoms, human physiology and common diseases',
      'Environment: atmosphere, water and land pollution, climate, GIS and population',
      'Food science: balanced diet, nutrients, food quality, deterioration and preservation',
      'Information technology: hardware, software, networks, information systems, AI and telecommunications',
      'Quantitative ability: arithmetic, algebra, geometry, ratios, rates, percentages and sampling',
      'Logical / analytical reasoning and verbal, mechanical, numerical and social mental abilities',
    ], 'Separate the 60-mark General Science component from the 40-mark General Ability component when planning revision. Show working in numerical questions.'),
    _CoreCourse('Current Affairs', '100 marks', 'Build issue-based analysis across Pakistan’s domestic affairs, external relations and global issues.', [
      'Pakistan domestic affairs: political, economic and social developments',
      'Pakistan external affairs: India, China, Afghanistan, Russia and the Muslim world',
      'Relations with the United States and regional / international organisations',
      'Global issues: security, political economy, human rights and climate',
      'Population, terrorism, energy politics, nuclear security and international trade',
      'Middle East, Kashmir, Palestine, globalisation and maritime cooperation',
      'Evidence file: dated facts, official documents, credible data and competing viewpoints',
    ], 'Every current-affairs statistic must carry a date and credible source. Distinguish verified fact from analysis and forecast.'),
    _CoreCourse('Islamic Studies / Comparative Study of Major Religions', '100 marks', 'Prepare the relevant paper according to the candidate’s eligibility and the official syllabus.', [
      'Core beliefs, sources and principles of the selected paper',
      'Seerah / foundational historical context and ethical framework',
      'Social justice, human dignity, rights, responsibilities and governance',
      'Economic principles, welfare, accountability and public ethics',
      'Contemporary challenges and reasoned application of principles',
      'Comparative themes and interfaith understanding where prescribed',
      'Practise structured answers with accurate references and balanced analysis',
    ], 'Non-Muslim candidates may opt for Comparative Study of Major Religions. Check the official paper’s language and syllabus instructions before preparation.'),
  ];

  static const _classNotes = <String, String>{
    'English Essay': 'A CSS essay is an argument, not a collection of quotations or memorised paragraphs. Begin by unpacking the exact wording: identify the command (discuss, evaluate, critically examine), the subject, the limits of the question and any hidden assumption. Convert this into a thesis that answers the prompt in one or two precise sentences. Build an outline before drafting: introduction, a sequence of logically connected claims, counterarguments or limitations, a synthesis and a conclusion. Each body paragraph should make one claim, explain its logic, support it with relevant evidence or a concrete example, and link back to the thesis. Use evidence selectively: official statistics need dates and sources; constitutional claims should refer to the relevant provision; historical claims need context. Acknowledge uncertainty and opposing explanations instead of overstating. Keep the introduction focused and avoid generic openings. The conclusion should resolve the argument, not merely repeat headings. In timed practice, reserve time for planning and final editing. The examiner is looking for relevance, coherence, analysis, knowledge, organisation and clear expression—not decorative vocabulary.',
    'English (Precis & Composition)': 'Precis writing tests whether you can identify and reproduce an author’s central argument accurately and economically. Read the passage twice: first for the overall argument, then to mark the thesis, supporting reasons, contrasts and conclusion. Remove examples, repetition and secondary detail only when doing so does not distort the meaning. Write in your own words, preserve the author’s tone and logical sequence, and do not insert personal opinion. A suitable title captures the central idea rather than one minor detail. Check the required word limit and count carefully. For comprehension, answer only what the passage supports and distinguish inference from explicit statement. For grammar, identify the underlying rule before changing a sentence: subject–verb agreement, tense consistency, pronoun reference, parallel structure, modifiers, articles, prepositions and punctuation. Vocabulary tasks require context-sensitive usage, not memorised synonyms. Translation should preserve meaning, register and idiom rather than follow Urdu word order mechanically. Practise each question type separately, then complete mixed timed sets.',
    'General Science & Ability': 'Plan this paper in two distinct blocks: General Science (60 marks) and General Ability (40 marks), following the published syllabus. For science, build concepts before memorising facts. In physics, understand motion, force, energy, electricity, waves and everyday applications. In chemistry, revise atomic structure, elements, compounds, mixtures, acids and bases, reactions and materials. In biology, cover cells, genetics, human body systems, nutrition, immunity and common diseases. Earth and environmental science includes atmosphere, climate systems, water, natural hazards, ecosystems, pollution and resource management. Technology topics include computer fundamentals, networks, information systems, telecommunications and the opportunities and risks of AI. For ability, practise arithmetic, fractions, percentages, ratios, averages, rates, time and work, algebra, geometry, data interpretation and basic statistics. Develop a repeatable method: identify what is asked, list known values, select the formula or logical rule, show each step, check units and estimate whether the answer is plausible. For reasoning questions, identify patterns and eliminate options systematically. Maintain an error log and revisit the concept behind every mistake.',
    'Current Affairs': 'Treat current affairs as an evidence-based analysis paper, not a newspaper summary. Organise preparation around durable themes—Pakistan’s political and constitutional system, economy, human development, climate and water, security, foreign relations, regional connectivity and global governance. For every issue, prepare a one-page brief with: background, current position, stakeholders, structural causes, consequences, policy choices, constraints and a balanced way forward. Maintain a dated evidence file using primary sources where possible: Pakistan Bureau of Statistics, State Bank of Pakistan, Finance Division, Economic Survey, official legislation, UN agencies and recognised international datasets. Record the publication date and the period covered; never present an old statistic as current. Distinguish facts from interpretation and forecasts. For foreign policy, explain interests and constraints on all sides rather than relying on slogans. In answers, use a clear thesis, a small number of well-developed arguments, relevant evidence and feasible recommendations. Revisit briefs monthly because developments and figures change.',
    'Islamic Studies / Comparative Study of Major Religions': 'First confirm which paper applies to your candidature and follow the exact FPSC syllabus. Build answers from accurate primary references and sound scholarship; do not quote a verse, hadith or religious text unless you can verify its wording and context. Organise themes around foundational beliefs and sources, ethical principles, human dignity, social justice, rights and responsibilities, family and society, economic fairness, governance, tolerance and contemporary challenges as prescribed. Explain the principle before applying it to a modern policy or social question. Avoid unsupported generalisations about religious communities and distinguish normative ideals from historical practice. Comparative discussion should be respectful, precise and based on comparable concepts rather than stereotypes. Use a structured answer: define the concept, establish its textual or intellectual basis, explain its implications, consider contemporary application and conclude with a balanced assessment.',
  };

  static const _practiceTasks = <String, String>{
    'English Essay': '“Education is not merely a tool for economic growth; it is the foundation of responsible citizenship.” Develop a balanced, evidence-led essay outline and write a thesis that directly answers the statement.',
    'English (Precis & Composition)': 'Take a 250–300 word editorial passage from a credible newspaper. Produce a precis in roughly one-third of its length, give it a precise title, and list three ideas you deliberately removed without changing the author’s argument.',
    'General Science & Ability': 'A household reduces electricity use from 500 kWh to 425 kWh. Calculate the percentage reduction, show your working, then explain two demand-side measures that could produce lasting energy savings.',
    'Current Affairs': '“Pakistan’s economic stabilisation requires institutional reform as much as short-term financing.” Build an answer plan that separates fiscal, energy, export and human-development constraints; attach a dated primary source to each major claim.',
    'Islamic Studies / Comparative Study of Major Religions': 'Choose one prescribed theme from the official syllabus. Explain its foundational principle, cite a verified primary reference, and evaluate one contemporary application without confusing ideals with implementation.',
  };

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(16),
    children: [
      const _SectionIntro(
        eyebrow: 'COMPULSORY PAPER ROADMAPS',
        title: 'Core CSS papers',
        description: 'Five compulsory-paper roadmaps alongside the Pakistan Affairs foundation course. Use these as a structured starting checklist, then study the full official syllabus and primary sources.',
      ),
      ...courses.map((course) => Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: ExpansionTile(
          title: Text(course.title, style: const TextStyle(fontWeight: FontWeight.w700)),
          subtitle: Text(course.marks),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            Align(alignment: Alignment.centerLeft, child: Text(course.purpose)),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: const Color(0xFFFAFCFE), border: Border.all(color: const Color(0xFFE3ECF4)), borderRadius: BorderRadius.circular(12)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('TEACHING NOTES', style: TextStyle(fontSize: 11, letterSpacing: 1, fontWeight: FontWeight.w900, color: Color(0xFF1769AA))),
                const SizedBox(height: 8),
                Text(_classNotes[course.title] ?? 'Follow the official syllabus and build topic-by-topic notes.', style: const TextStyle(height: 1.6)),
                const SizedBox(height: 12),
                const Text('PRACTICE TASK', style: TextStyle(fontSize: 10, letterSpacing: .8, fontWeight: FontWeight.w900, color: Color(0xFF1769AA))),
                const SizedBox(height: 5),
                Text(_practiceTasks[course.title] ?? 'Write a structured answer using a clear thesis and relevant evidence.', style: const TextStyle(height: 1.5)),
              ]),
            ),
            const SizedBox(height: 12),
            const Align(alignment: Alignment.centerLeft, child: Text('TOPIC ROADMAP', style: TextStyle(fontSize: 11, letterSpacing: 1, fontWeight: FontWeight.w800, color: Color(0xFF1769AA)))),
            const SizedBox(height: 8),
            ...course.topics.map((topic) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Icon(Icons.checklist_rounded, size: 18, color: Color(0xFF1769AA)),
                const SizedBox(width: 8),
                Expanded(child: Text(topic)),
              ]),
            )),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: const Color(0xFFF0F6FC), borderRadius: BorderRadius.circular(10)),
              child: Text('EXAMINER’S GUIDANCE\n${course.guidance}', style: const TextStyle(height: 1.45)),
            ),
          ],
        ),
      )),
      const Text('These roadmaps are learning aids, not a claim that every topic has been fully taught. The FPSC syllabus remains authoritative.', style: TextStyle(fontSize: 12, color: Color(0xFF627D98))),
    ],
  );
}

class _CoreCourse {
  const _CoreCourse(this.title, this.marks, this.purpose, this.topics, this.guidance);
  final String title, marks, purpose, guidance;
  final List<String> topics;
}


class _OptionalPapersTab extends StatelessWidget {
  const _OptionalPapersTab();

  static const groups = <_OptionalGroup>[
    _OptionalGroup('Group I', '200 marks • Select ONE subject', 'Accountancy & Auditing · Economics · Computer Science · Political Science · International Relations'),
    _OptionalGroup('Group II', '200 marks • Select subject(s) totalling 200', 'Physics (200) · Chemistry (200) · Applied Mathematics (100) · Pure Mathematics (100) · Statistics (100) · Geology (100)'),
    _OptionalGroup('Group III', '100 marks • Select ONE subject', 'Business Administration · Public Administration · Governance & Public Policies · Town Planning & Urban Management'),
    _OptionalGroup('Group IV', '100 marks • Select ONE subject', 'History of Pakistan & India · Islamic History & Culture · British History · European History · History of USA'),
    _OptionalGroup('Group V', '100 marks • Select ONE subject', 'Gender Studies · Environmental Sciences · Agriculture & Forestry · Botany · Zoology · English Literature · Urdu Literature'),
    _OptionalGroup('Group VI', '100 marks • Select ONE subject', 'Law · Constitutional Law · International Law · Muslim Law & Jurisprudence · Mercantile Law · Criminology · Philosophy'),
    _OptionalGroup('Group VII', '100 marks • Select ONE subject', 'Journalism & Mass Communication · Psychology · Geography · Sociology · Anthropology · Punjabi · Sindhi · Pashto · Balochi · Persian · Arabic'),
  ];

  static const courses = <_OptionalCourse>[
    _OptionalCourse('Political Science', 'Group I • 200 marks', [
      'Political theory: state, sovereignty, liberty, equality, justice and rights',
      'Major political thinkers and traditions; compare arguments rather than memorising biographies',
      'Comparative government: constitutions, executives, legislatures, judiciaries and party systems',
      'Political systems of the UK, USA and other prescribed cases',
      'Political development, ideologies and contemporary governance debates',
      'Muslim political thought and the political system of Pakistan',
    ], 'Compare parliamentary and presidential systems with reference to executive accountability and legislative oversight.'),
    _OptionalCourse('International Relations', 'Group I • 200 marks', [
      'Scope, evolution and levels of analysis in International Relations',
      'Realism, liberalism, constructivism and critical approaches',
      'Foreign policy analysis, national interest and decision-making',
      'International law, diplomacy, security and conflict',
      'Global political economy, trade, institutions and interdependence',
      'Pakistan’s foreign policy and relations with neighbouring and major powers',
    ], 'Assess whether economic interdependence reduces conflict or creates new forms of strategic vulnerability.'),
    _OptionalCourse('Economics', 'Group I • 200 marks', [
      'Demand, supply, elasticity, consumer choice and production theory',
      'Costs, market structures, pricing and factor markets',
      'National income, consumption, investment and aggregate demand',
      'Money, banking, inflation, unemployment and monetary policy',
      'Fiscal policy, public finance, taxation and public debt',
      'Growth, development, poverty, inequality and Pakistan’s economic structure',
    ], 'Evaluate the trade-offs between fiscal consolidation, growth and distributional equity in a developing economy.'),
    _OptionalCourse('Computer Science', 'Group I • 200 marks', [
      'Programming fundamentals, algorithms, data structures and complexity',
      'Computer organisation, operating systems and memory management',
      'Database concepts, relational modelling, SQL and transactions',
      'Computer networks, protocols, security and distributed systems',
      'Software engineering, testing, requirements and design',
      'Artificial intelligence, machine learning and data-related fundamentals',
    ], 'Explain how database normalisation reduces anomalies, and identify situations where denormalisation may be justified.'),
    _OptionalCourse('Public Administration', 'Group III • 100 marks', [
      'Evolution and scope of public administration; classical and contemporary theories',
      'Organisation, bureaucracy, leadership, motivation and administrative behaviour',
      'Public policy cycle, implementation, evaluation and evidence use',
      'Financial administration, budgeting, audit and accountability',
      'Civil service systems, reforms, ethics and administrative law',
      'Local government, service delivery and administrative challenges in Pakistan',
    ], 'Why do administrative reforms often fail at implementation despite sound policy design?'),
    _OptionalCourse('Governance & Public Policies', 'Group III • 100 marks', [
      'Governance concepts: legitimacy, accountability, transparency and participation',
      'State capacity, institutions, rule of law and regulatory quality',
      'Policy formulation, stakeholder analysis and policy instruments',
      'Implementation gaps, monitoring, evaluation and public-sector performance',
      'Federalism, decentralisation, local government and intergovernmental coordination',
      'Governance challenges and reform options in Pakistan',
    ], 'Propose a practical framework for improving local service delivery while strengthening accountability.'),
    _OptionalCourse('History of Pakistan & India', 'Group IV • 100 marks', [
      'Political and cultural formations before the colonial period',
      'Expansion of British rule and the transformation of institutions',
      'Reform, resistance and social change in the nineteenth century',
      'Constitutional reforms, political organisations and mass movements',
      'Partition, independence and early state-building',
      'Post-independence political, constitutional and regional developments',
    ], 'Assess the relative importance of constitutional negotiations and mass politics in the making of Pakistan.'),
    _OptionalCourse('Gender Studies', 'Group V • 100 marks', [
      'Key concepts: sex, gender, patriarchy, intersectionality and socialisation',
      'Major feminist theories and debates',
      'Gender, work, education, health, media and political participation',
      'Violence, rights, law and institutional responses',
      'Gender and development; measurement and policy approaches',
      'Gender issues, legislation and public policy in Pakistan',
    ], 'Evaluate how unpaid care work shapes women’s economic participation and what policy responses are feasible.'),
    _OptionalCourse('Environmental Sciences', 'Group V • 100 marks', [
      'Ecosystems, biodiversity, biogeochemical cycles and conservation',
      'Air, water and soil pollution; sources, impacts and control',
      'Climate science, vulnerability, adaptation and mitigation',
      'Natural resources, energy, water management and sustainability',
      'Environmental impact assessment, law and institutions',
      'Pakistan’s environmental risks, disaster management and climate policy',
    ], 'Compare climate adaptation and mitigation priorities for a climate-vulnerable country such as Pakistan.'),
    _OptionalCourse('Criminology', 'Group VI • 100 marks', [
      'Definitions, measurement and patterns of crime',
      'Classical, positivist, sociological and critical theories of crime',
      'Juvenile delinquency, organised crime, cybercrime and terrorism',
      'Criminal justice institutions: police, prosecution, courts and corrections',
      'Victimology, rehabilitation, deterrence and restorative approaches',
      'Crime prevention, criminal justice reform and Pakistan’s context',
    ], 'Critically assess whether deterrence alone can reduce repeat offending.'),
    _OptionalCourse('Psychology', 'Group VII • 100 marks', [
      'Foundations, schools of thought and research methods',
      'Biological bases of behaviour, sensation, perception and consciousness',
      'Learning, memory, cognition, intelligence and motivation',
      'Developmental, social and personality psychology',
      'Psychological disorders, assessment and evidence-based interventions',
      'Applications of psychology in education, organisations and society',
    ], 'Discuss the strengths and limitations of intelligence testing across different cultural and social settings.'),
    _OptionalCourse('Sociology', 'Group VII • 100 marks', [
      'Sociological imagination, methods and major theoretical perspectives',
      'Culture, socialisation, groups, organisations and social control',
      'Family, education, religion, economy and political institutions',
      'Stratification, class, status, gender and social mobility',
      'Population, urbanisation, migration, development and social change',
      'Social problems, civil society and the Pakistani social structure',
    ], 'Analyse the relationship between rapid urbanisation, informal settlements and unequal access to public services.'),
    _OptionalCourse('Journalism & Mass Communication', 'Group VII • 100 marks', [
      'Communication models, news values and the role of mass media',
      'Media theories, public opinion, agenda-setting and framing',
      'Journalism genres, reporting, editing and media ethics',
      'Broadcast, print, digital media and platform transformation',
      'Development communication, advertising and public relations',
      'Media law, regulation, misinformation and Pakistan’s media landscape',
    ], 'Evaluate how digital platforms have changed agenda-setting and the verification responsibilities of journalists.'),
    _OptionalCourse('Business Administration', 'Group III • 100 marks', [
      'Management foundations, organisational structure and leadership',
      'Strategic management, competitive analysis and decision-making',
      'Marketing principles, consumer behaviour and market research',
      'Human resource management, performance and organisational culture',
      'Operations, quality, supply chains and process improvement',
      'Financial management, entrepreneurship and business ethics',
    ], 'Explain how a firm can improve operational efficiency without undermining service quality or employee capability.'),
  ];

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(16),
    children: [
      const _SectionIntro(
        eyebrow: 'OPTIONAL SUBJECT FACULTY',
        title: 'Choose strategically. Study systematically.',
        description: 'The CSS written examination allocates 600 marks to optional subjects. Review the official group rules before choosing; the modules below are introductory study frameworks, not complete subject syllabi.',
      ),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: const Color(0xFF123B63), borderRadius: BorderRadius.circular(16)),
        child: const Row(children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('OPTIONAL PAPERS', style: TextStyle(color: Color(0xFFB9D9F5), fontSize: 10, letterSpacing: 1.2, fontWeight: FontWeight.w900)),
            SizedBox(height: 7),
            Text('600 marks', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900)),
            SizedBox(height: 4),
            Text('Subject combinations must follow FPSC group restrictions.', style: TextStyle(color: Color(0xFFE1EDF7), fontSize: 12, height: 1.4)),
          ])),
          Icon(Icons.account_balance_rounded, size: 42, color: Color(0xFFB9D9F5)),
        ]),
      ),
      const SizedBox(height: 20),
      const Text('OFFICIAL SUBJECT GROUPS', style: TextStyle(fontSize: 11, letterSpacing: 1.1, fontWeight: FontWeight.w900, color: Color(0xFF1769AA))),
      const SizedBox(height: 8),
      ...groups.map((group) => Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: ExpansionTile(
          title: Text(group.name, style: const TextStyle(fontWeight: FontWeight.w800)),
          subtitle: Text(group.selection),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [Align(alignment: Alignment.centerLeft, child: Text(group.subjects, style: const TextStyle(height: 1.55, color: Color(0xFF486581))))],
        ),
      )),
      const SizedBox(height: 18),
      const Text('STARTER LEARNING MODULES', style: TextStyle(fontSize: 11, letterSpacing: 1.1, fontWeight: FontWeight.w900, color: Color(0xFF1769AA))),
      const SizedBox(height: 5),
      const Text('Selected subjects with topic maps and analytical practice prompts.', style: TextStyle(fontSize: 12, color: Color(0xFF627D98))),
      const SizedBox(height: 9),
      ...courses.map((course) => Card(
        margin: const EdgeInsets.only(bottom: 9),
        child: ExpansionTile(
          leading: const CircleAvatar(backgroundColor: Color(0xFFEAF3FB), child: Icon(Icons.menu_book_rounded, color: Color(0xFF1769AA), size: 19)),
          title: Text(course.title, style: const TextStyle(fontWeight: FontWeight.w800)),
          subtitle: Text(course.group),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            const Align(alignment: Alignment.centerLeft, child: Text('CORE TOPIC MAP', style: TextStyle(fontSize: 10, letterSpacing: 1, fontWeight: FontWeight.w900, color: Color(0xFF1769AA)))),
            const SizedBox(height: 8),
            ...course.topics.map((topic) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Icon(Icons.arrow_right_rounded, size: 18, color: Color(0xFF1769AA)),
                Expanded(child: Text(topic, style: const TextStyle(height: 1.4))),
              ]),
            )),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: const Color(0xFFF0F6FC), borderRadius: BorderRadius.circular(10)),
              child: Text('CSS PRACTICE QUESTION\n${course.question}', style: const TextStyle(height: 1.5)),
            ),
          ],
        ),
      )),
      const SizedBox(height: 6),
      const Text('Coverage note: these are starter modules for selected optional subjects. Use the official FPSC syllabus to confirm every prescribed topic; subjects not yet expanded still appear in their correct group above.', style: TextStyle(fontSize: 11, height: 1.5, color: Color(0xFF627D98))),
    ],
  );
}

class _OptionalGroup {
  const _OptionalGroup(this.name, this.selection, this.subjects);
  final String name, selection, subjects;
}

class _OptionalCourse {
  const _OptionalCourse(this.title, this.group, this.topics, this.question);
  final String title, group, question;
  final List<String> topics;
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


class _PastPapersTab extends StatelessWidget {
  const _PastPapersTab();

  static final Uri _archive = Uri.parse('https://www.fpsc.gov.pk/Schedule?section=Previous+Question+Papers%2FCSS');
  static final Uri _syllabus = Uri.parse('https://www.fpsc.gov.pk/Syllabuses?section=CSS+Syllabi');
  static final Uri _rules = Uri.parse('https://www.fpsc.gov.pk/MPTandMAIN?section=CSS+Rules');

  Future<void> _open(BuildContext context, Uri uri) async {
    try {
      final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!opened && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not open the FPSC website. Please try again.')));
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not open the FPSC website. Please try again.')));
      }
    }
  }

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(16),
    children: [
      const _SectionIntro(
        eyebrow: 'AUTHENTIC EXAM MATERIAL',
        title: 'Official CSS past papers',
        description: 'Open original papers from the Federal Public Service Commission. Bureaucrats does not re-host, alter or label generated questions as official past papers.',
      ),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: const Color(0xFF123B63), borderRadius: BorderRadius.circular(16)),
        child: const Row(children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('SOURCE OF RECORD', style: TextStyle(color: Color(0xFFB9D9F5), fontSize: 10, letterSpacing: 1.2, fontWeight: FontWeight.w900)),
            SizedBox(height: 7),
            Text('Federal Public Service Commission', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900)),
            SizedBox(height: 5),
            Text('Use the original papers to understand question style, depth and recurring syllabus areas.', style: TextStyle(color: Color(0xFFE1EDF7), fontSize: 12, height: 1.45)),
          ])),
          Icon(Icons.verified_outlined, size: 38, color: Color(0xFFB9D9F5)),
        ]),
      ),
      const SizedBox(height: 14),
      _OfficialResourceCard(
        icon: Icons.picture_as_pdf_outlined,
        title: 'Previous Question Papers — CSS',
        detail: 'Official FPSC archive. The archive page lists papers by examination year and subject, including recent years where published.',
        action: 'OPEN FPSC ARCHIVE',
        onTap: () => _open(context, _archive),
      ),
      _OfficialResourceCard(
        icon: Icons.menu_book_rounded,
        title: 'CSS Syllabus',
        detail: 'Verify compulsory papers, optional subject groups, topic coverage and mark allocations before finalising your study plan.',
        action: 'VIEW OFFICIAL SYLLABUS',
        onTap: () => _open(context, _syllabus),
      ),
      _OfficialResourceCard(
        icon: Icons.gavel_rounded,
        title: 'CSS Rules',
        detail: 'Consult the Commission’s published rules for examination requirements and procedural matters.',
        action: 'VIEW OFFICIAL RULES',
        onTap: () => _open(context, _rules),
      ),
      const SizedBox(height: 10),
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: const Color(0xFFFFF7E8), borderRadius: BorderRadius.circular(12), border: Border.all(color: Color(0xFFF3E4C5))),
        child: const Text('Study method: attempt one paper under timed conditions, mark every question against the syllabus, classify your weak areas, then write a revised answer plan. Always confirm that the paper belongs to the correct examination year and subject.', style: TextStyle(height: 1.5, color: Color(0xFF76551D))),
      ),
      const SizedBox(height: 10),
      const Text('Official material is hosted by FPSC and may change or move. If an archive item is unavailable, use FPSC website navigation to locate the latest published paper.', style: TextStyle(fontSize: 11, height: 1.5, color: Color(0xFF627D98))),
    ],
  );
}

class _OfficialResourceCard extends StatelessWidget {
  const _OfficialResourceCard({required this.icon, required this.title, required this.detail, required this.action, required this.onTap});
  final IconData icon;
  final String title, detail, action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 10),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(width: 42, height: 42, decoration: BoxDecoration(color: const Color(0xFFEAF3FB), borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: const Color(0xFF1769AA))),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF102A43))),
          const SizedBox(height: 5),
          Text(detail, style: const TextStyle(fontSize: 12, height: 1.45, color: Color(0xFF627D98))),
          const SizedBox(height: 10),
          TextButton.icon(onPressed: onTap, icon: const Icon(Icons.open_in_new_rounded, size: 15), label: Text(action), style: TextButton.styleFrom(padding: EdgeInsets.zero, visualDensity: VisualDensity.compact)),
        ])),
      ]),
    ),
  );
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

  static const _progressStorageKey = 'bureaucrats.css_syllabus.completed.v1';
  final Set<String> completed = <String>{};
  final SharedPreferencesAsync _preferences = SharedPreferencesAsync();
  bool _loadingProgress = true;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    try {
      final saved = await _preferences.getStringList(_progressStorageKey);
      if (!mounted) return;
      setState(() {
        completed
          ..clear()
          ..addAll(saved ?? const <String>[]);
        _loadingProgress = false;
      });
    } catch (_) {
      if (mounted) setState(() => _loadingProgress = false);
    }
  }

  Future<void> _saveProgress() async {
    try {
      final values = completed.toList()..sort();
      await _preferences.setStringList(_progressStorageKey, values);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Progress could not be saved on this device.')),
        );
      }
    }
  }

  void _updateProgress(String item, bool? isComplete) {
    setState(() {
      if (isComplete == true) {
        completed.add(item);
      } else {
        completed.remove(item);
      }
    });
    _saveProgress();
  }

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
          child: Text('EXAM STRUCTURE  •  1,200 MARKS\n6 compulsory papers = 600 marks + optional subjects = 600 marks. A 200-mark subject comprises two papers; each 100-mark subject comprises one paper. Group II allows a combination totalling 200 marks; Groups III–VII allow one 100-mark subject each.', style: TextStyle(height: 1.5)),
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
              LinearProgressIndicator(value: _loadingProgress ? null : progress, minHeight: 8, borderRadius: BorderRadius.circular(8)),
              const SizedBox(height: 7),
              Row(children: [
                Expanded(child: Text(_loadingProgress ? 'Restoring saved progress…' : '${(progress * 100).round()}% marked complete', style: const TextStyle(fontSize: 12, color: Color(0xFF627D98)))),
                const Icon(Icons.phone_android_rounded, size: 13, color: Color(0xFF627D98)),
                const SizedBox(width: 5),
                const Text('Saved on this device', style: TextStyle(fontSize: 10, color: Color(0xFF627D98))),
              ]),
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
              onChanged: _loadingProgress ? null : (value) => _updateProgress(item, value),
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
