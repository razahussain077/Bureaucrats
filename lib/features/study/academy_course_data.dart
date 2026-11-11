import 'package:flutter/material.dart';

@immutable
class AcademyLessonSection {
  const AcademyLessonSection(this.heading, this.content);
  final String heading;
  final String content;
}

@immutable
class AcademyLesson {
  const AcademyLesson({
    required this.title,
    required this.objectives,
    required this.sections,
    required this.keyTerms,
    required this.examQuestion,
    required this.practiceTask,
  });

  final String title;
  final String objectives;
  final List<AcademyLessonSection> sections;
  final List<String> keyTerms;
  final String examQuestion;
  final String practiceTask;
}

@immutable
class AcademyChapter {
  const AcademyChapter({
    required this.number,
    required this.title,
    required this.syllabusLink,
    required this.lessons,
  });

  final String number;
  final String title;
  final String syllabusLink;
  final List<AcademyLesson> lessons;
}

@immutable
class AcademyCourse {
  const AcademyCourse({
    required this.title,
    required this.marks,
    required this.description,
    required this.chapters,
  });

  final String title;
  final String marks;
  final String description;
  final List<AcademyChapter> chapters;
}

const compulsoryAcademyCourses = <AcademyCourse>[
  AcademyCourse(
    title: 'Pakistan Affairs',
    marks: '100 marks',
    description: 'A historical, constitutional, geographical, economic and strategic study of Pakistan, aligned to the FPSC Pakistan Affairs syllabus.',
    chapters: [
      AcademyChapter(
        number: '01',
        title: 'Intellectual foundations and Muslim reform movements',
        syllabusLink: 'Ideology of Pakistan; Muslim rule, decline and renaissance; reform movements; Iqbal and Jinnah',
        lessons: [
          AcademyLesson(
            title: 'How Muslim political thought developed in South Asia',
            objectives: 'Explain the historical background of Muslim political identity without reducing it to a single event or personality.',
            sections: [
              AcademyLessonSection('1. The historical setting', '''The political history of Muslims in South Asia cannot be understood by beginning with the Lahore Resolution alone. Muslim communities lived in different regions, spoke different languages and followed diverse intellectual and political traditions. Under the Mughal Empire, political authority was connected to a large imperial structure. The weakening of that structure in the eighteenth century, the rise of regional powers and the expansion of the East India Company changed the political environment in which Muslim elites, scholars and ordinary communities operated.

The decline of Mughal authority did not mean that Muslim society disappeared or became politically uniform. It meant that older institutions of patronage, administration and learning were transformed. New colonial laws, revenue arrangements, education systems and employment structures altered access to power. The nineteenth century therefore produced a debate about how Muslims should respond to a new political order.'''),
              AcademyLessonSection('2. Reform was not one movement', '''Shah Waliullah sought intellectual and religious renewal and addressed the moral and political problems of his age. His work is important for understanding debates about the relationship between religious learning, social order and political decline. Sayyid Ahmad Shaheed led a reformist and militant movement in a different context. These movements should not be treated as identical: their methods, historical circumstances and immediate objectives differed.

After the upheavals of the nineteenth century, educational movements became especially important. Sir Syed Ahmad Khan argued that modern scientific education and engagement with the new administration were necessary for Muslim advancement. The Aligarh movement created an institutional route to modern education and a new Muslim professional class. Deoband placed emphasis on traditional religious scholarship and the preservation of Islamic learning. Nadwatul Ulama sought a synthesis and reform of educational traditions. Sindh Madressatul Islam and Islamia College Peshawar later contributed to modern Muslim education in their respective regions.'''),
              AcademyLessonSection('3. From social reform to political consciousness', '''Education, language and representation gradually became political questions. The Urdu-Hindi controversy showed that language could represent access to courts, administration and cultural recognition. Debates about employment and educational disadvantage raised questions about how a community could participate in a system where political power was moving away from older elites.

The central analytical point is that Muslim political consciousness emerged through overlapping processes: colonial restructuring, educational reform, cultural debates, elite organisation and constitutional negotiations. It was not inevitable from 1857, and it was not produced by one leader alone. A strong CSS answer should identify continuity as well as change and should compare reformist approaches instead of simply praising or condemning them.'''),
            ],
            keyTerms: ['Colonial restructuring', 'Aligarh movement', 'Deoband', 'Nadwatul Ulama', 'Modern education', 'Political representation'],
            examQuestion: '“Muslim political consciousness in colonial India developed through educational, social and constitutional change.” Discuss.',
            practiceTask: 'Prepare a 5-paragraph answer plan. Give one paragraph each to colonial change, educational reform, language and representation, political organisation, and a balanced conclusion.',
          ),
        ],
      ),
      AcademyChapter(
        number: '02',
        title: 'From 1857 to the formation of the Muslim League',
        syllabusLink: 'Downfall of Muslim rule; reform and renaissance; political safeguards and representation',
        lessons: [
          AcademyLesson(
            title: '1857, colonial rule and the search for safeguards',
            objectives: 'Trace the shift from the uprising of 1857 to organised Muslim political representation by 1906.',
            sections: [
              AcademyLessonSection('1. 1857 and the transfer of authority', '''The uprising of 1857 was a major challenge to East India Company rule. Its suppression ended the Mughal dynasty as a political institution and was followed by the transfer of authority to the British Crown under the Government of India Act 1858. The rebellion involved different groups with different motives; it should not be described as a fully unified national movement in the modern sense.

The consequences varied across regions and communities. The colonial state reorganised the army and administration, strengthened surveillance and changed the relationship between rulers and subjects. Muslim elites in some areas experienced loss of patronage and political influence, while new educational and administrative opportunities increasingly favoured people equipped for the colonial system. These developments created pressure for new strategies of social and educational advancement.'''),
              AcademyLessonSection('2. Educational reform and the limits of a single explanation', '''Sir Syed Ahmad Khan's response focused on education, scientific inquiry and political accommodation. The Aligarh movement aimed to prepare Muslims for participation in modern institutions. Its significance lay not only in the college itself but also in its network of teachers, graduates, debate and political leadership. It did not represent every Muslim group, and it was criticised by other scholars for its approach to colonial authority and educational reform.

The Deoband movement, established in 1866, prioritised religious scholarship and the continuity of Islamic intellectual life. Nadwatul Ulama, established later in Lucknow, tried to respond to the perceived divide between older and newer educational approaches. A careful answer recognises different goals and methods instead of placing all reformers in one category.'''),
              AcademyLessonSection('3. From the Simla Deputation to the Muslim League', '''The Simla Deputation met Viceroy Lord Minto in October 1906 and asked for political representation that recognised Muslims as a distinct political community. The All-India Muslim League was founded at Dhaka in December 1906. These developments gave Muslim political demands a more organised institutional form.

The Indian Councils Act 1909 introduced separate electorates for Muslims. This provided a mechanism for representation but also formalised communal categories in the electoral system. For CSS analysis, distinguish the immediate purpose of political safeguards from the later consequences of separate electorates. Do not assume that the demand for separate electorates in 1906 was already a demand for a separate sovereign state.'''),
            ],
            keyTerms: ['Government of India Act 1858', 'Aligarh', 'Simla Deputation', 'Muslim League', 'Separate electorates'],
            examQuestion: 'Evaluate the significance of the Simla Deputation and the formation of the All-India Muslim League in Muslim political representation.',
            practiceTask: 'Construct a timeline from 1857 to 1909 and write a short explanation of how education, language and constitutional representation interacted.',
          ),
        ],
      ),
      AcademyChapter(
        number: '03',
        title: 'Constitutional negotiations and the Pakistan Movement',
        syllabusLink: 'Political development in British India; constitutional proposals; Iqbal, Jinnah and the Pakistan demand',
        lessons: [
          AcademyLesson(
            title: 'From Lucknow Pact to the Fourteen Points',
            objectives: 'Compare key constitutional proposals through the distribution of power, minority safeguards and provincial autonomy.',
            sections: [
              AcademyLessonSection('1. Negotiation within a common constitutional framework', '''The Lucknow Pact of 1916 represented a negotiated arrangement between the Indian National Congress and the Muslim League. It accepted separate electorates and included agreement on legislative representation. Its significance was that political organisations could negotiate constitutional safeguards, but it did not settle every disagreement about the future structure of India.

The Government of India Act 1919 introduced dyarchy in the provinces. Some subjects were transferred to Indian ministers, while others remained under the control of the governor and executive. The system widened participation but retained important powers in British hands. The limited franchise also meant that the electorate represented only a fraction of the population.'''),
              AcademyLessonSection('2. Nehru Report and Jinnah’s response', '''The Nehru Report of 1928 proposed a constitutional framework based on dominion status and a parliamentary structure. Muslim political leaders disagreed with provisions they believed insufficiently protected Muslim representation and provincial autonomy. Jinnah's Fourteen Points in 1929 responded to these concerns. They stressed federalism, provincial powers, minority representation and safeguards in legislatures and services.

The comparison should be analytical. Ask who would control residual powers, how provinces would be protected, whether representation reflected population or community status, and how minorities could influence central institutions. The Fourteen Points were a set of constitutional demands; they should not be inaccurately described as a complete declaration of the later Pakistan state.'''),
              AcademyLessonSection('3. Iqbal's Allahabad Address', '''Allama Muhammad Iqbal's presidential address at Allahabad in 1930 is important to debates about Muslim political identity and the constitutional future of north-western Muslim-majority regions. Iqbal discussed the political consolidation of Muslim-majority provinces. His address should be read in its own context rather than treated as a fully drafted state constitution.

For exam purposes, distinguish intellectual influence from direct institutional implementation. Explain how Iqbal's political thought contributed to later debates, then connect it to the changing constitutional environment of the 1930s and 1940s.'''),
            ],
            keyTerms: ['Lucknow Pact', 'Dyarchy', 'Nehru Report', 'Fourteen Points', 'Allahabad Address', 'Federalism'],
            examQuestion: 'Compare the Nehru Report and Jinnah’s Fourteen Points with reference to federalism and minority safeguards.',
            practiceTask: 'Create a comparison table with four headings: centre, provinces, representation and minority safeguards. Use it to write a balanced 500-word answer.',
          ),
        ],
      ),
      AcademyChapter(
        number: '04',
        title: 'The final phase: 1935–1947',
        syllabusLink: 'Provincial autonomy; 1937 elections; Lahore Resolution; transfer of power',
        lessons: [
          AcademyLesson(
            title: 'Why constitutional deadlock ended in partition',
            objectives: 'Explain the role of provincial politics, political mobilisation and failed negotiations in the transfer of power.',
            sections: [
              AcademyLessonSection('1. Government of India Act 1935 and provincial politics', '''The Government of India Act 1935 introduced provincial autonomy and proposed an all-India federation. The federal part did not come into operation, but provincial elections under the Act changed party competition. The 1937 elections exposed the Muslim League's limited electoral reach in several Muslim-majority provinces. The League then intensified its organisational work and its claim to represent Muslim political interests.

Congress ministries formed governments in several provinces. The League criticised aspects of their policies and presented its own account of Muslim political insecurity. These interpretations were politically contested. A good answer should not simply repeat party claims; it should distinguish documented policy, political rhetoric and later historical interpretation.'''),
              AcademyLessonSection('2. Lahore Resolution and wartime negotiations', '''The Lahore Resolution was adopted on 23 March 1940 at the Muslim League's annual session. It called for geographically contiguous units in Muslim-majority areas to be grouped into independent states, with autonomous and sovereign constituent units. Its language and later interpretation have been debated. Explain the text and its political context instead of assuming that every later constitutional detail was already settled in 1940.

The Cripps proposals of 1942 failed to secure agreement. The Gandhi-Jinnah talks in 1944 did not resolve disagreement about the principle and timing of partition. The 1945–46 elections strengthened the League's claim to represent a large majority of Muslim voters in separate Muslim constituencies.'''),
              AcademyLessonSection('3. Cabinet Mission, partition and independence', '''The Cabinet Mission Plan of 1946 sought to preserve a united India through a weak centre and provincial groupings. Disagreement over the interpretation and implementation of the plan undermined it. The 3 June Plan accepted partition, and the Indian Independence Act 1947 provided the legal framework for the creation of the two dominions.

The transfer of power was accompanied by mass displacement and communal violence. A complete answer therefore examines constitutional bargaining and political leadership while also addressing the human consequences of partition. Avoid monocausal explanations: constitutional disagreement, competing national projects, political mobilisation, imperial decisions and violence all mattered.'''),
            ],
            keyTerms: ['Government of India Act 1935', '1937 elections', 'Lahore Resolution', 'Cabinet Mission Plan', '3 June Plan', 'Indian Independence Act 1947'],
            examQuestion: 'Was partition inevitable by 1947? Evaluate the constitutional and political factors that led to the final decision.',
            practiceTask: 'Write two competing explanations for the failure of the Cabinet Mission Plan, then assess which factors carry the greatest explanatory weight.',
          ),
        ],
      ),
      AcademyChapter(
        number: '05',
        title: 'State formation and constitutional development',
        syllabusLink: 'Political evolution; democratic system; constitutional history',
        lessons: [
          AcademyLesson(
            title: 'The constitutional journey from 1947 to 1973',
            objectives: 'Understand the institutional pressures at independence and the different constitutional designs adopted by Pakistan.',
            sections: [
              AcademyLessonSection('1. The challenges of state formation', '''At independence Pakistan faced immediate administrative and political challenges: migration on a vast scale, communal violence, division of assets, shortage of trained personnel, financial constraints and disputes over territory. The new state had to create functioning institutions while also negotiating the relationship between the federation and its constituent units.

The Objectives Resolution, adopted on 12 March 1949, set out principles that shaped future constitutional debates about sovereignty, democracy, rights and the role of Islam. It did not by itself settle the practical design of institutions. Disagreements over representation, language, provincial autonomy and the balance of power contributed to delay in constitution-making.'''),
              AcademyLessonSection('2. The 1956 and 1962 constitutional systems', '''The Constitution of 1956 came into force on 23 March 1956 and declared Pakistan an Islamic Republic. It created a parliamentary federal framework. Political instability and unresolved institutional tensions meant that the constitutional order did not endure; martial law was imposed in October 1958.

The Constitution of 1962 introduced a presidential system with a strong executive. Its political structure was more centralised and relied on the system of Basic Democracies. Compare the two constitutions by asking how the executive was selected, how legislatures operated, how provinces were represented and what accountability mechanisms existed.'''),
              AcademyLessonSection('3. The 1973 Constitution', '''The separation of East Pakistan in 1971 followed a severe political crisis involving the 1970 election result, failure to transfer power, military action, civil conflict and Indian intervention. It exposed the consequences of denying electoral legitimacy and failing to manage federal diversity.

The Constitution of 1973 was adopted by the National Assembly on 10 April and came into force on 14 August 1973. It restored a parliamentary federal framework and was negotiated through broad political consensus. Its significance lies in the institutional settlement it attempted to create, not in a claim that constitutional text alone could eliminate political conflict.'''),
            ],
            keyTerms: ['Objectives Resolution', '1956 Constitution', '1962 Constitution', '1970 elections', '1971 crisis', '1973 Constitution'],
            examQuestion: 'Assess the relationship between federal accommodation, electoral legitimacy and constitutional stability in Pakistan from 1947 to 1973.',
            practiceTask: 'Prepare a comparison grid for the 1956, 1962 and 1973 constitutions: executive, legislature, federalism, rights and accountability.',
          ),
        ],
      ),
      AcademyChapter(
        number: '06',
        title: 'Federalism, democracy and civil-military relations',
        syllabusLink: 'Civil-military relations; political evolution since 1971; democratic evolution; national integration',
        lessons: [
          AcademyLesson(
            title: 'Institutions, political authority and federal accommodation',
            objectives: 'Analyse how institutional imbalance and uneven federal arrangements affect democratic consolidation.',
            sections: [
              AcademyLessonSection('1. Civil-military relations as an institutional question', '''Civil-military relations concern the constitutional and practical balance between elected civilian authority and the armed forces. In a constitutional democracy, elected institutions set national policy, while the military performs its constitutionally assigned defence role under lawful civilian authority. In practice, the balance is influenced by security threats, party organisation, bureaucratic capacity, judicial decisions, public legitimacy and the history of political intervention.

A strong answer avoids treating the issue as a personality contest. Examine institutional incentives, crisis conditions, the weakness or strength of civilian policymaking and the consequences of repeated interruptions in constitutional government.'''),
              AcademyLessonSection('2. Democratic evolution and accountability', '''Pakistan's political history since 1971 includes elected governments, military interventions, constitutional amendments and changes in the distribution of authority. The Eighth Amendment altered the balance between the president and prime minister in the 1980s. Later constitutional changes modified that arrangement. The 18th Constitutional Amendment of 2010 strengthened parliamentary government and expanded provincial autonomy, including the abolition of the Concurrent Legislative List.

Democratic consolidation requires more than holding elections. It depends on regular constitutional transfers of power, capable legislatures, independent and lawful institutions, internal party democracy, access to information and effective delivery of public services.'''),
              AcademyLessonSection('3. Federal institutions and devolution', '''The Council of Common Interests provides a constitutional forum for coordination between the federation and provinces on matters within its remit. The National Finance Commission provides a framework for distributing financial resources between the federation and provinces. Local government is important because provinces and the federation cannot directly manage every municipal and neighbourhood service.

Devolution must be evaluated through both legal powers and practical capacity. Ask whether local bodies receive predictable finance, trained staff, data, authority and accountability. Constitutional changes can transfer responsibility, but implementation determines whether citizens actually experience better services.'''),
            ],
            keyTerms: ['Civilian supremacy', '18th Amendment', 'Council of Common Interests', 'National Finance Commission', 'Local government', 'Devolution'],
            examQuestion: '“Constitutional devolution is necessary but not sufficient for effective federalism in Pakistan.” Discuss.',
            practiceTask: 'Choose one public service and trace which level of government is responsible for policy, financing, implementation and accountability.',
          ),
        ],
      ),
      AcademyChapter(
        number: '07',
        title: 'Geography, society and natural resources',
        syllabusLink: 'Land and people; geography; society; natural resources; agriculture; industry; education',
        lessons: [
          AcademyLesson(
            title: 'How geography shapes Pakistan’s development',
            objectives: 'Connect physical geography and human geography to agriculture, settlement, infrastructure and national development.',
            sections: [
              AcademyLessonSection('1. Physical geography and strategic location', '''Pakistan connects South Asia, Central Asia, the Middle East and the Arabian Sea. Its geography includes high mountain systems in the north, the Indus river basin, arid and semi-arid regions, the Balochistan plateau, deserts and a coastline along the Arabian Sea. These regions differ in climate, terrain, water availability, population density and access to infrastructure.

The Indus river system is central to settlement, irrigation and economic activity. Mountain areas are important for water storage, glaciers, hydropower potential and ecological services, but they are also exposed to earthquakes, landslides and climate-related hazards. Geography creates opportunities, but it also imposes costs on transport, service delivery and resource management.'''),
              AcademyLessonSection('2. Population, society and human development', '''Population analysis should distinguish total population from its age structure, regional distribution, urbanisation, migration and labour-force participation. A large working-age population can support growth only when people have education, health, skills and productive employment. Rapid urbanisation can create economic opportunity but also pressure on housing, water, sanitation, transport and local government.

Social diversity is an important feature of Pakistan. Language, province, ethnicity, class and rural-urban differences affect identity and access to public services. National integration is strengthened when citizens experience fair representation, equal legal protection and credible public institutions.'''),
              AcademyLessonSection('3. Agriculture, industry and education', '''Agriculture remains connected to water allocation, land productivity, rural livelihoods, food security and climate risk. Industrial development depends on reliable energy, logistics, finance, skills, technology and predictable regulation. Education affects productivity through literacy, numeracy, technical capability and the capacity to adopt new technologies.

In examination answers, avoid listing resources as if their presence automatically produces prosperity. Explain the institutions and investments needed to convert natural resources, human capital and location into productive outcomes.'''),
            ],
            keyTerms: ['Indus basin', 'Human geography', 'Urbanisation', 'Food security', 'Human capital', 'Productivity'],
            examQuestion: 'Evaluate how Pakistan can convert its geographical and human resources into sustainable economic development.',
            practiceTask: 'Build a cause-and-effect diagram linking water, agriculture, energy, industrial productivity and employment.',
          ),
        ],
      ),
      AcademyChapter(
        number: '08',
        title: 'Economic, energy and water challenges',
        syllabusLink: 'Economic challenges; energy problems; hydro-politics and domestic/regional water issues',
        lessons: [
          AcademyLesson(
            title: 'Structural economic constraints and resource governance',
            objectives: 'Distinguish short-term stabilisation from the deeper institutional reforms needed for sustainable growth.',
            sections: [
              AcademyLessonSection('1. Structural economic challenges', '''Economic performance should be analysed through productivity, investment, exports, taxation, public expenditure, debt, employment and human development. Recurrent balance-of-payments pressure can arise when import demand grows faster than export capacity and stable foreign-exchange inflows. Fiscal stress is linked to a narrow tax base, high debt servicing, subsidies, loss-making public enterprises and the quality of expenditure.

Stabilisation measures may reduce immediate pressure, but sustainable growth requires higher productivity, competitive firms, human capital, predictable regulation and investment. In a CSS answer, separate symptoms from underlying causes and do not treat borrowing as a complete development strategy.'''),
              AcademyLessonSection('2. Energy as an economic and governance issue', '''Energy security concerns availability, affordability, reliability and sustainability. A power system can face problems from fuel import exposure, weak transmission and distribution, losses, unpaid bills, circular debt, poor planning and a mismatch between generation and demand. Simply adding generation capacity does not solve every problem if the grid cannot transmit electricity efficiently or consumers cannot afford reliable supply.

A balanced energy strategy considers domestic and imported resources, renewables, storage, grid modernisation, demand management, transparent pricing and targeted support for vulnerable households. Policy choices involve trade-offs among cost, reliability, climate impact and energy independence.'''),
              AcademyLessonSection('3. Water governance and hydro-politics', '''Water security includes availability, quality, access and the capacity to manage droughts and floods. In Pakistan, the Indus basin supports agriculture and urban populations, while groundwater extraction, inefficient irrigation, pollution and climate variability create pressure. Water governance is not only about building dams or canals. It also involves measurement, allocation rules, maintenance, agricultural incentives, urban conservation and cooperation among provinces.

At the regional level, transboundary rivers create diplomatic and legal questions. A sound answer identifies the role of treaties, data sharing, institutional trust and technical cooperation, while avoiding unsupported claims about water flows or treaty obligations.'''),
            ],
            keyTerms: ['Balance of payments', 'Fiscal capacity', 'Circular debt', 'Energy security', 'Water governance', 'Indus basin'],
            examQuestion: 'Why do Pakistan’s energy and water crises require governance reforms alongside infrastructure investment?',
            practiceTask: 'Write a policy brief with three reforms each for energy and water. For every proposal, identify the responsible institution and one implementation risk.',
          ),
        ],
      ),
      AcademyChapter(
        number: '09',
        title: 'Foreign policy and regional cooperation',
        syllabusLink: 'Changing regional apparatus; Pakistan’s regional role; regional organisations; relations with neighbours',
        lessons: [
          AcademyLesson(
            title: 'National interest, neighbours and regional institutions',
            objectives: 'Use national interest and foreign-policy analysis to explain Pakistan’s regional relationships.',
            sections: [
              AcademyLessonSection('1. A framework for analysing foreign policy', '''Foreign policy is the set of choices through which a state manages relations with other states and international institutions. It is shaped by geography, security, economic needs, domestic politics, leadership, public opinion and the wider international system. National interest is not a slogan; it must be specified in practical terms such as territorial security, economic welfare, diplomatic autonomy, access to markets and regional stability.

A disciplined answer distinguishes stated objectives from actual policy instruments. It asks what resources a state possesses, what constraints it faces and what outcomes are realistically achievable.'''),
              AcademyLessonSection('2. Neighbouring states and major partners', '''Relations with China include strategic, defence, infrastructure and economic dimensions. Relations with Afghanistan are affected by border management, security, refugees, trade and the political situation inside Afghanistan. Relations with Iran involve border security, energy potential and regional diplomacy. Relations with India have been shaped by partition, Kashmir, wars, nuclearisation, trade restrictions and recurring crises. Each relationship has its own history and should not be described through a single template.

The United States has been an important partner in different periods, particularly in security and economic matters. Relations have also experienced mistrust and divergence over regional priorities. Explain changes over time rather than describing the relationship as permanently friendly or hostile.'''),
              AcademyLessonSection('3. Regional and international organisations', '''The South Asian Association for Regional Cooperation was designed to promote regional cooperation, but political disputes have limited its effectiveness. The Economic Cooperation Organization focuses on regional economic cooperation among its members. The Shanghai Cooperation Organisation provides a forum for security, political and economic engagement across a wider Eurasian region.

Organisations should be assessed by their mandate, membership, decision-making rules, resources and actual outcomes. Pakistan's participation creates diplomatic opportunities, but membership alone does not guarantee trade growth or regional integration.'''),
            ],
            keyTerms: ['National interest', 'Strategic partnership', 'SAARC', 'ECO', 'SCO', 'Regional connectivity'],
            examQuestion: 'Assess the opportunities and constraints shaping Pakistan’s role in the changing regional order.',
            practiceTask: 'Prepare one-page country briefs on China, Afghanistan, Iran, India and the United States. Use the same headings to make comparison possible.',
          ),
        ],
      ),
      AcademyChapter(
        number: '10',
        title: 'National security, sovereignty and non-traditional threats',
        syllabusLink: 'Nuclear programme; safety and security; non-state actors; sovereignty; proxy conflict; Afghanistan and war on terror',
        lessons: [
          AcademyLesson(
            title: 'A wider understanding of national security',
            objectives: 'Evaluate conventional and non-traditional threats without reducing national security to military capability alone.',
            sections: [
              AcademyLessonSection('1. Conventional and non-traditional security', '''Traditional national security focuses on the protection of territory, political independence and the state against external military threats. Contemporary security analysis also considers internal conflict, terrorism, cyber threats, economic vulnerability, climate hazards, food and water insecurity, public health and critical infrastructure. These challenges can reinforce one another. A flood, for example, can damage livelihoods, displace communities and increase pressure on already weak public services.

Security policy should therefore link defence, diplomacy, law enforcement, intelligence, economic resilience and social development. It must also protect constitutional rights and lawful civilian oversight.'''),
              AcademyLessonSection('2. Non-state actors and proxy conflict', '''Non-state actors include organisations and networks that operate outside formal state institutions. Some provide legitimate civic or humanitarian services; others use violence or coercion. It is essential to distinguish categories rather than using the term as a catch-all label. The presence of armed groups can undermine public authority, target civilians, disrupt investment and complicate regional diplomacy.

Proxy conflict occurs when external actors support local groups to influence a conflict while avoiding direct confrontation. Establishing that a specific group is acting as a proxy requires evidence. CSS answers should distinguish verified support, allegations and analytical inference.'''),
              AcademyLessonSection('3. Nuclear programme, safety and international concerns', '''Pakistan's nuclear programme is connected to the security environment of South Asia and the strategic relationship with India. Nuclear deterrence is intended to raise the cost of major aggression, but it also creates risks associated with escalation, misperception, command and control, accidents and crisis communication. Safety and security are distinct but related: safety concerns preventing accidents and unintended harm, while security concerns preventing unauthorised access, theft or deliberate misuse.

A balanced answer recognises deterrence arguments and international concerns. It should focus on risk reduction, credible communication, responsible stewardship and confidence-building rather than unsupported technical claims.'''),
            ],
            keyTerms: ['Human security', 'Non-state actors', 'Proxy conflict', 'Deterrence', 'Nuclear safety', 'Crisis stability'],
            examQuestion: '“Pakistan’s national security must integrate military preparedness with human, economic and environmental security.” Discuss.',
            practiceTask: 'Select one non-traditional threat and map its causes, affected institutions, citizens at risk, prevention measures and response capacity.',
          ),
        ],
      ),
      AcademyChapter(
        number: '11',
        title: 'Kashmir, Palestine and international issues',
        syllabusLink: 'Kashmir issue; Palestine issue; Pakistan’s regional and international role',
        lessons: [
          AcademyLesson(
            title: 'International disputes: law, history and diplomacy',
            objectives: 'Construct evidence-led answers on long-running international disputes and distinguish legal principles from political positions.',
            sections: [
              AcademyLessonSection('1. The Kashmir dispute', '''The Kashmir dispute emerged during the partition of British India in 1947 and has remained a central issue in Pakistan-India relations. Its history involves the princely state, accession, wars, UN involvement, competing national claims and the political aspirations and rights of the people of the region. The dispute has also been affected by changes in constitutional arrangements, security policies and regional diplomacy.

A CSS answer should establish chronology, identify the positions of the principal parties, refer accurately to relevant international instruments and distinguish legal claims from political arguments. Avoid presenting a complex dispute as if one slogan or one event explains its entire history.'''),
              AcademyLessonSection('2. The Palestine issue', '''The Palestine issue has historical, territorial, humanitarian, legal and diplomatic dimensions. It involves competing national claims, displacement, occupation, settlement activity, security, governance and the status of Jerusalem. International debate includes self-determination, civilian protection, humanitarian access and the application of international law.

Pakistan's stated position has historically supported Palestinian self-determination. To analyse policy, distinguish diplomatic declarations, votes in international forums, humanitarian assistance and practical leverage. Keep the human impact visible and apply legal concepts consistently to all parties.'''),
              AcademyLessonSection('3. Writing about international disputes', '''Begin with a short historical timeline, then identify the applicable legal and political framework. Explain the interests of the parties and the role of external actors. Evaluate the available diplomatic options, their constraints and the likely consequences. A balanced answer does not require treating all claims as equally supported; it requires stating what evidence supports each claim and where uncertainty remains.

Use dated primary sources for current developments. Conflict facts can change quickly, and a statistic without a date, geographic scope and source may mislead the examiner.'''),
            ],
            keyTerms: ['Self-determination', 'International law', 'UN resolutions', 'Occupation', 'Humanitarian protection', 'Diplomacy'],
            examQuestion: 'Analyse the Kashmir dispute as a challenge to regional stability and international diplomacy.',
            practiceTask: 'Prepare separate timelines for Kashmir and Palestine. For each, list three legal issues, three political obstacles and three realistic diplomatic measures.',
          ),
        ],
      ),
      AcademyChapter(
        number: '12',
        title: 'Afghanistan, post-9/11 policy and Pakistan’s strategic choices',
        syllabusLink: 'War in Afghanistan since 1979; post-2014 challenges; Pakistan-US war on terror; foreign policy after 9/11',
        lessons: [
          AcademyLesson(
            title: 'Afghanistan’s conflicts and their impact on Pakistan',
            objectives: 'Trace the main phases of conflict in Afghanistan and assess the political, security and economic consequences for Pakistan.',
            sections: [
              AcademyLessonSection('1. The conflict from 1979', '''The Soviet intervention in Afghanistan in 1979 internationalised an existing political conflict. Pakistan became a frontline state in the anti-Soviet resistance, hosting refugees and serving as a major channel for external assistance to Afghan resistance groups. The conflict militarised the region, strengthened armed networks and contributed to long-term social and security consequences.

The Soviet withdrawal did not produce a stable political settlement. Rival factions fought for power, and the Taliban emerged as a major force in the 1990s. The instability affected Pakistan through refugees, border insecurity, weapons proliferation, sectarian and militant networks, trade disruption and difficult diplomatic choices.'''),
              AcademyLessonSection('2. Post-9/11 and the war on terror', '''After the attacks of 11 September 2001, the United States launched military operations in Afghanistan and Pakistan became a key partner in the wider war on terror. The relationship brought security cooperation and international support, but it also generated domestic political controversy, militant backlash and difficult questions about sovereignty and strategic autonomy.

Analyse the policy through costs and benefits rather than a simple judgement of success or failure. Consider border operations, intelligence cooperation, displacement, civilian harm, economic cost, internal militancy and the relationship between external pressure and domestic legitimacy.'''),
              AcademyLessonSection('3. Post-2014 and contemporary policy challenges', '''The withdrawal of most international combat forces in 2014 changed the security environment, but it did not end Afghanistan's instability. Later political transitions created new uncertainty around border security, recognition, refugees, trade and militant activity. Pakistan's policy must balance security concerns with cross-border commerce, humanitarian obligations and regional diplomacy.

A sound policy discussion considers border management, dialogue, intelligence coordination, refugee protection, legal trade, regional engagement and domestic capacity. It should not assume that military measures alone can create a durable political settlement.'''),
            ],
            keyTerms: ['Soviet intervention', 'Afghan refugees', 'War on terror', 'Sovereignty', 'Border management', 'Regional diplomacy'],
            examQuestion: 'Evaluate the effects of the Afghan conflict on Pakistan’s internal security and foreign policy since 1979.',
            practiceTask: 'Divide the answer into three periods: 1979–1989, 1989–2001 and 2001 onward. For each, list security, economic, social and diplomatic effects.',
          ),
        ],
      ),
    ],
  ),
  AcademyCourse(
    title: 'English Essay',
    marks: '100 marks',
    description: 'Learn to interpret prompts, build a thesis, organise arguments and write a coherent research-informed essay.',
    chapters: [
      AcademyChapter(number: '01', title: 'Understanding the essay task', syllabusLink: 'Comprehensive knowledge, articulation, expression and technical treatment of essay writing', lessons: [
        AcademyLesson(title: 'Read the question before you write', objectives: 'Convert a broad prompt into a precise, answerable argument.', sections: [
          AcademyLessonSection('1. Identify the command', '''Words such as discuss, evaluate, examine, critically analyse and to what extent require different intellectual work. Discuss asks you to explore important dimensions. Evaluate requires a judgement against stated criteria. Critically analyse asks you to examine assumptions, evidence, competing explanations and limitations. To what extent requires a measured position rather than an absolute yes or no.

Underline the command word and translate it into a task. If you cannot state what the examiner wants in one sentence, you are not ready to draft.'''),
          AcademyLessonSection('2. Set boundaries', '''Identify the subject, time period, geography and implied comparison. A topic such as technology and education is too broad unless you decide whether you are discussing access, learning outcomes, labour markets, governance or inequality. Define key terms briefly and state what your essay will and will not cover.

A precise scope protects the essay from becoming a collection of loosely related facts.'''),
          AcademyLessonSection('3. Build a defensible position', '''Your position should answer the exact prompt and acknowledge complexity. Avoid a slogan such as technology is good or bad. A more defensible claim might explain that technology can widen access and improve learning, but only where infrastructure, teacher capability, language inclusion and data protection are addressed.

The thesis should give the examiner a clear sense of the argument that the body paragraphs will prove.'''),
        ], keyTerms: ['Command word', 'Scope', 'Assumption', 'Thesis statement'], examQuestion: 'What is the difference between discussing a topic and evaluating a proposition?', practiceTask: 'Take three past CSS essay titles. Mark the command word, define the scope and write a two-sentence thesis for each.'),
      ]),
      AcademyChapter(number: '02', title: 'Planning and outlining', syllabusLink: 'Organisation, coherence and technical treatment', lessons: [
        AcademyLesson(title: 'Turn ideas into a logical outline', objectives: 'Build a complete essay structure before drafting.', sections: [
          AcademyLessonSection('1. Brainstorm by dimensions', '''Generate arguments under clear headings: political, economic, social, technological, environmental, legal and ethical. Use only the dimensions relevant to the prompt. Brainstorming is a discovery stage, not the final outline.

For each possible heading, ask whether it advances the thesis. Delete points that merely repeat another point or are too weak to support.'''),
          AcademyLessonSection('2. Sequence the argument', '''A good outline moves from context to causes, mechanisms, consequences, counterarguments and policy implications. It may move chronologically or from foundational to specific issues. The order should make the reasoning easier to follow.

Each heading must express an argument, not a vague label. “Economic effects” is a topic; “Unequal access to capital prevents small firms from adopting productivity-enhancing technology” is an argument.'''),
          AcademyLessonSection('3. Check balance and coverage', '''Make sure the outline addresses the full question and gives space to important counterarguments. A one-sided outline may look confident but often ignores implementation problems or alternative explanations. A balanced essay can still reach a clear conclusion.

Before writing, read the outline as if you were the examiner. Can every paragraph be linked to the thesis? Does each major part answer a part of the question?'''),
        ], keyTerms: ['Brainstorming', 'Argument hierarchy', 'Outline', 'Counterargument'], examQuestion: 'Why is a detailed outline essential for a long analytical essay?', practiceTask: 'Prepare a 10-heading outline for an essay on climate change and national security. Arrange headings in a logical sequence.'),
      ]),
      AcademyChapter(number: '03', title: 'Argument, evidence and counterargument', syllabusLink: 'Research-based knowledge and analytical argument', lessons: [
        AcademyLesson(title: 'Write analytical body paragraphs', objectives: 'Move from assertion to explanation and evidence.', sections: [
          AcademyLessonSection('1. Claim, reasoning and evidence', '''A strong paragraph begins with one clear claim. It then explains why the claim is true, gives evidence or a concrete example, interprets that evidence and links it to the essay's central argument.

Evidence can include a dated official statistic, a constitutional provision, a historical example, a scholarly finding or a well-documented case. A quotation is not evidence merely because it sounds impressive. The source must be relevant and credible.'''),
          AcademyLessonSection('2. Explain the mechanism', '''Analysis explains how one condition produces another. Instead of writing that weak education harms the economy, explain how low foundational literacy reduces worker capability, limits technology adoption, weakens productivity and narrows the tax base over time.

Mechanisms make an answer analytical. They show the examiner that you understand relationships rather than simply memorising statements.'''),
          AcademyLessonSection('3. Handle opposing views', '''A counterargument identifies a plausible alternative explanation or limitation. Present it fairly, then evaluate its strength and explain why your thesis still holds or needs qualification. Do not dismiss opposing views with words such as obviously or undoubtedly.

A sophisticated essay can revise its own claim when evidence requires it. Intellectual honesty improves credibility.'''),
        ], keyTerms: ['Claim', 'Reasoning', 'Evidence', 'Mechanism', 'Counterargument'], examQuestion: 'How can evidence be integrated into an essay without turning it into a list of facts?', practiceTask: 'Write three body paragraphs using claim, explanation, evidence, analysis and link-back. Underline each component.'),
      ]),
      AcademyChapter(number: '04', title: 'Introductions, conclusions and cohesion', syllabusLink: 'Articulation, expression and structure', lessons: [
        AcademyLesson(title: 'Make the essay read as one argument', objectives: 'Write focused openings, meaningful conclusions and coherent transitions.', sections: [
          AcademyLessonSection('1. The introduction', '''The introduction should establish the issue, define only the terms that need clarification, identify the central tension and present the thesis. Avoid generic openings such as since the dawn of time. Begin with a relevant fact, problem or conceptual distinction when it genuinely helps the argument.

The introduction is a promise to the reader. Do not promise a discussion of five areas and then omit two of them.'''),
          AcademyLessonSection('2. Paragraph transitions', '''Transitions show whether the next paragraph adds a reason, introduces a contrast, explains a consequence or moves to a policy response. They should reflect the logical relationship between ideas. Words such as furthermore and moreover cannot repair a broken argument.

Repeat key concepts where necessary so the reader can follow the thread. Vary sentence structures without sacrificing precision.'''),
          AcademyLessonSection('3. The conclusion', '''The conclusion should answer the question in light of the arguments already presented. It can state the conditions under which the thesis holds and identify realistic implications. It should not introduce a major new argument or merely copy the introduction.

A strong conclusion resolves the essay's central tension and leaves the examiner with a clear final judgement.'''),
        ], keyTerms: ['Thesis', 'Cohesion', 'Transition', 'Synthesis'], examQuestion: 'What makes a conclusion analytical rather than repetitive?', practiceTask: 'Write an introduction and conclusion for the same essay title. Check that both express the same position but perform different functions.'),
      ]),
    ],
  ),
  AcademyCourse(
    title: 'English (Precis & Composition)',
    marks: '100 marks',
    description: 'Prepare each FPSC question type separately: precis, comprehension, grammar, correction, vocabulary and translation.',
    chapters: [
      AcademyChapter(number: '01', title: 'Precis writing', syllabusLink: 'Precis writing and appropriate title', lessons: [
        AcademyLesson(title: 'Compress without changing meaning', objectives: 'Identify the central argument and reproduce it accurately in fewer words.', sections: [
          AcademyLessonSection('1. Read for structure', '''Read the passage once for its overall meaning. On the second reading, identify the main proposition, reasons, contrasts, examples and conclusion. Mark repeated ideas and supporting illustrations. The purpose is not to shorten every sentence equally; it is to preserve the author's central line of reasoning.

A precis should represent the original passage, not your personal response to it.'''),
          AcademyLessonSection('2. Remove secondary material', '''Remove repetition, anecdotes, decorative phrases and examples where they are not essential to the argument. Combine related points and replace wordy expressions with precise language. Do not remove a qualification if it changes the author's position.

Preserve relationships such as cause and effect, condition and result, contrast and concession. Compression that destroys logic is inaccurate.'''),
          AcademyLessonSection('3. Write and verify', '''Use your own words while retaining the author's tone and viewpoint. Do not insert facts, criticism or recommendations that were not in the passage. Follow the requested length and count words carefully. Give a short title that captures the central idea rather than a minor example.

Finally compare the precis with the source: Is the thesis intact? Are the major reasons present? Has any personal opinion slipped in?'''),
        ], keyTerms: ['Central idea', 'Compression', 'Tone', 'Title', 'Word limit'], examQuestion: 'What are the qualities of a good precis?', practiceTask: 'Take a 300-word editorial and reduce it to approximately one-third. Mark every sentence that carries a main idea.'),
      ]),
      AcademyChapter(number: '02', title: 'Reading comprehension', syllabusLink: 'Comprehension passage with evidence-based answers', lessons: [
        AcademyLesson(title: 'Answer from the passage, not from memory', objectives: 'Distinguish explicit information, inference, vocabulary in context and authorial purpose.', sections: [
          AcademyLessonSection('1. Locate evidence', '''Read the question before returning to the relevant part of the passage. Identify the sentence or group of sentences that supports the answer. Paraphrase accurately and avoid adding outside information unless the question specifically invites broader knowledge.

A correct answer is not simply a true statement; it is an answer supported by the passage.'''),
          AcademyLessonSection('2. Understand inference', '''An inference is a conclusion reasonably supported by the text but not necessarily stated word for word. It must follow from the author's evidence. Do not confuse inference with speculation or a personal assumption.

Look for contrast words, qualifications and causal statements. They often signal the author's intended meaning.'''),
          AcademyLessonSection('3. Control length and precision', '''Answer the question asked. A short response should include the relevant point and its supporting explanation. Long introductions waste time and may create opportunities for error. When asked for the author's purpose, explain the function of the passage rather than simply repeating its subject.'''),
        ], keyTerms: ['Explicit meaning', 'Inference', 'Authorial purpose', 'Contextual vocabulary'], examQuestion: 'How does a candidate distinguish a valid inference from an unsupported assumption?', practiceTask: 'Answer five questions from one passage. For each answer, underline the exact phrase or sentence that supports it.'),
      ]),
      AcademyChapter(number: '03', title: 'Grammar and sentence correction', syllabusLink: 'Tense, articles, prepositions, conjunctions, punctuation and sentence correction', lessons: [
        AcademyLesson(title: 'Correct the structure, not just the surface', objectives: 'Identify common grammatical faults and make only the necessary correction.', sections: [
          AcademyLessonSection('1. Agreement and tense', '''The subject and verb must agree in number. The main verb should reflect the intended time and maintain consistency unless the meaning requires a shift. Be careful with long subjects, collective nouns and phrases placed between subject and verb.

Example: “The list of proposals are ready” is incorrect because the subject is list. The correct form is “The list of proposals is ready.”'''),
          AcademyLessonSection('2. Articles and prepositions', '''Articles depend on whether a noun is specific, general, countable or uncountable. Use a or an for a singular count noun introduced generally, and the when the reference is identifiable. Some nouns do not take an article in general statements.

Prepositions are often fixed by meaning and usage. Learn them in phrases and sentences rather than memorising isolated translations. “Depend on”, “interested in” and “responsible for” are common patterns.'''),
          AcademyLessonSection('3. Punctuation and sentence logic', '''Punctuation clarifies relationships between clauses. A comma splice joins two independent clauses incorrectly. Use a full stop, semicolon or a suitable conjunction. Check parallel structure in lists and comparisons. Ensure modifiers are placed near the words they describe.

In sentence correction, do not rewrite a sound sentence merely to make it stylistically different. Identify the exact fault and repair it with the minimum change.'''),
        ], keyTerms: ['Subject-verb agreement', 'Tense consistency', 'Articles', 'Prepositions', 'Comma splice', 'Parallelism'], examQuestion: 'Why does CSS sentence correction reward minimal and accurate changes?', practiceTask: 'Write ten incorrect sentences covering ten different grammar rules. Correct them and state the rule behind each correction.'),
      ]),
      AcademyChapter(number: '04', title: 'Vocabulary, word pairs and translation', syllabusLink: 'Grouping of words; pairs of commonly confused words; Urdu-to-English translation', lessons: [
        AcademyLesson(title: 'Precision in word choice and translation', objectives: 'Demonstrate vocabulary through context and translate meaning rather than word order.', sections: [
          AcademyLessonSection('1. Context determines meaning', '''A word may have more than one meaning depending on context. When grouping words, identify whether the question requires synonyms or antonyms. Avoid pairing words simply because they share a general topic. A synonym must preserve the intended sense in the given context.

For pairs of commonly confused words, explain the distinction briefly and then use each word in a sentence that demonstrates the difference.'''),
          AcademyLessonSection('2. Translate the idea first', '''Urdu and English often organise clauses differently. Identify the subject, main verb, object, tense, time reference and intended tone before translating. Preserve the meaning and idiom rather than copying the Urdu word order.

Translate idiomatic expressions by meaning. A literal translation may be grammatically possible but still communicate the wrong idea.'''),
          AcademyLessonSection('3. Edit the translation', '''After drafting, check articles, prepositions, subject-verb agreement, tense, pronoun reference and natural word order. Ensure that formal Urdu expressions are not converted into awkward English phrases. The final sentence should read like clear English while preserving the original meaning.'''),
        ], keyTerms: ['Synonym', 'Antonym', 'Context', 'Collocation', 'Idiom', 'Register'], examQuestion: 'Why is word-for-word translation often inaccurate?', practiceTask: 'Translate ten Urdu sentences. For each, identify the tense and one phrase that required meaning-based rather than literal translation.'),
      ]),
    ],
  ),
  AcademyCourse(
    title: 'General Science & Ability',
    marks: '100 marks',
    description: 'Build scientific understanding and solve quantitative and analytical questions methodically.',
    chapters: [
      AcademyChapter(number: '01', title: 'Universe, Earth and astronomical systems', syllabusLink: 'Physical Sciences: universe, galaxy, light year, solar system, Sun and Earth', lessons: [
        AcademyLesson(title: 'Scale and structure of the universe', objectives: 'Understand basic astronomical units and the relationship between the Sun, Earth and wider universe.', sections: [
          AcademyLessonSection('1. Universe and galaxies', '''The universe includes space, time, matter and energy. A galaxy is a vast system of stars, gas, dust and dark matter held together by gravity. The Milky Way is the galaxy that contains our Solar System. The Solar System consists of the Sun and the objects gravitationally bound to it, including planets, dwarf planets, moons, asteroids and comets.

Scientific explanations are based on observation and models. In an exam answer, distinguish a galaxy from a solar system and avoid using the two terms interchangeably.'''),
          AcademyLessonSection('2. Astronomical distance', '''A light-year is a unit of distance, not time. It is the distance travelled by light in a vacuum in one year. Astronomical units are useful for distances within the Solar System; one astronomical unit is approximately the mean distance between Earth and the Sun.

Scientific notation helps express very large and very small quantities. Always include the unit when presenting a physical measurement.'''),
          AcademyLessonSection('3. Earth’s movements', '''Earth rotates on its axis and revolves around the Sun. Rotation produces the daily cycle of day and night. Revolution, combined with Earth's axial tilt, produces the seasonal pattern. The changing angle and duration of sunlight are central to understanding seasonal temperature differences.

An eclipse occurs when the Sun, Earth and Moon align in a way that causes one body to cast a shadow on another. A solar eclipse involves the Moon passing between Earth and the Sun; a lunar eclipse occurs when Earth comes between the Sun and Moon.'''),
        ], keyTerms: ['Galaxy', 'Solar System', 'Light-year', 'Astronomical unit', 'Rotation', 'Revolution', 'Eclipse'], examQuestion: 'Differentiate between rotation and revolution of Earth and explain their effects.', practiceTask: 'Draw and label simple diagrams for solar and lunar eclipses and explain the alignment in each case.'),
      ]),
      AcademyChapter(number: '02', title: 'Weather, climate and natural hazards', syllabusLink: 'Weather variables; earthquakes, volcanoes, tsunamis, floods, cyclones, drought and disaster risk management', lessons: [
        AcademyLesson(title: 'Understand atmospheric processes and hazards', objectives: 'Distinguish weather from climate and explain how hazards become disasters.', sections: [
          AcademyLessonSection('1. Weather variables', '''Weather describes the short-term condition of the atmosphere at a particular place and time. Its main variables include temperature, atmospheric pressure, wind, humidity, cloud cover and precipitation. Climate describes long-term patterns and variations, usually assessed over many years.

Air pressure differences drive wind. Moisture in the atmosphere influences cloud formation and precipitation. Temperature and pressure patterns interact with circulation systems, mountains, oceans and land surfaces.'''),
          AcademyLessonSection('2. Natural hazards', '''Earthquakes result from the sudden release of energy in the Earth's crust, often along faults. Volcanoes release magma, ash and gases. Tsunamis may be generated by undersea earthquakes, landslides or volcanic activity. Floods can result from intense rainfall, river overflow, snowmelt, storm surge or inadequate urban drainage.

Tropical cyclones are organised low-pressure systems that form over warm ocean water. Tornadoes are much smaller but can produce extremely intense local winds. Drought develops through prolonged deficits in precipitation and water availability.'''),
          AcademyLessonSection('3. Hazard and disaster risk management', '''A hazard becomes a disaster when it interacts with exposed and vulnerable people, infrastructure and livelihoods. Risk reduction therefore involves hazard monitoring, land-use planning, building standards, early warning, evacuation, public education, resilient infrastructure and recovery planning.

Emergency relief is essential, but it cannot replace prevention. Evaluate disaster management through preparedness, response, recovery and long-term risk reduction.'''),
        ], keyTerms: ['Weather', 'Climate', 'Humidity', 'Atmospheric pressure', 'Tsunami', 'Vulnerability', 'Early warning'], examQuestion: 'Explain why disaster risk depends on exposure and vulnerability as well as the physical hazard.', practiceTask: 'Select a flood-prone district and propose one measure each for prevention, preparedness, response and recovery.'),
      ]),
      AcademyChapter(number: '03', title: 'Energy resources and conservation', syllabusLink: 'Renewable and non-renewable energy; energy conservation and sustainable use', lessons: [
        AcademyLesson(title: 'Compare energy sources and their trade-offs', objectives: 'Evaluate energy choices using reliability, cost, environmental impact and security.', sections: [
          AcademyLessonSection('1. Renewable and non-renewable sources', '''Renewable energy sources are replenished naturally on human timescales. Solar, wind and hydropower are major examples. Non-renewable sources such as coal, oil, natural gas and uranium depend on finite resources or fuel cycles that cannot be replenished at the rate of consumption.

No source is free of trade-offs. Solar and wind have variable output and require grid flexibility or storage. Hydropower depends on river flows and can affect ecosystems and communities. Fossil fuels provide dispatchable energy but produce greenhouse gases and air pollution.'''),
          AcademyLessonSection('2. Efficiency and conservation', '''Energy efficiency means delivering the same service with less energy. Conservation involves reducing unnecessary use. Efficient lighting, insulation, efficient motors, public transport, industrial process improvements and demand management can reduce costs and emissions.

Energy policy should distinguish installed capacity from dependable supply. A power system needs generation, transmission, distribution, maintenance, fuel availability and mechanisms to balance demand.'''),
          AcademyLessonSection('3. Sustainable energy planning', '''A sustainable energy strategy balances affordability, reliability, environmental impact and access. Diversification can reduce exposure to fuel-price shocks. Grid investment, storage, modern forecasting, transparent regulation and targeted support for vulnerable households are part of the system, not optional additions.

In an analytical answer, compare complete system costs rather than judging sources by fuel price alone.'''),
        ], keyTerms: ['Renewable energy', 'Fossil fuels', 'Energy efficiency', 'Demand management', 'Grid flexibility'], examQuestion: 'Why is diversification and grid reform as important as adding new generation capacity?', practiceTask: 'Compare solar, wind, hydropower and natural gas by reliability, cost drivers, emissions and infrastructure needs.'),
      ]),
      AcademyChapter(number: '04', title: 'Atomic structure, bonding and modern materials', syllabusLink: 'Atomic structure; chemical bonding; electromagnetic radiation; semiconductors, plastics, ceramics and modern chemicals', lessons: [
        AcademyLesson(title: 'Matter, atoms and material properties', objectives: 'Explain basic atomic structure and relate bonding to material behaviour.', sections: [
          AcademyLessonSection('1. Atomic structure', '''An atom contains a nucleus of protons and neutrons, with electrons occupying regions around the nucleus. The number of protons defines the element. Atoms of the same element can have different numbers of neutrons; these are isotopes. The arrangement of electrons helps explain chemical behaviour.

Chemical reactions involve changes in the arrangement of electrons and atoms. They do not normally create or destroy the atoms themselves.'''),
          AcademyLessonSection('2. Chemical bonds', '''Ionic bonding involves the transfer of electrons and electrostatic attraction between oppositely charged ions. Covalent bonding involves the sharing of electron pairs. Metallic bonding involves positive metal ions in a structure with delocalised electrons. These bonding types help explain conductivity, melting points, hardness and solubility.

Avoid learning properties as disconnected facts. Link a property to structure and bonding wherever possible.'''),
          AcademyLessonSection('3. Materials and electromagnetic radiation', '''Semiconductors have electrical properties that can be controlled through composition, temperature and doping; they are essential to electronic devices. Plastics are polymers with a wide range of properties. Ceramics are often hard and heat-resistant but may be brittle. Antibiotics, vaccines, fertilisers and pesticides are chemicals or biological preparations with different uses and risks.

Electromagnetic radiation includes radio waves, microwaves, infrared, visible light, ultraviolet, X-rays and gamma rays. Their energy and applications differ. Higher-frequency radiation generally has higher photon energy.'''),
        ], keyTerms: ['Proton', 'Neutron', 'Isotope', 'Ionic bond', 'Covalent bond', 'Semiconductor', 'Polymer'], examQuestion: 'How does atomic and molecular structure influence the properties of modern materials?', practiceTask: 'Create a comparison table for ionic, covalent and metallic bonding with one example and two resulting properties each.'),
      ]),
      AcademyChapter(number: '05', title: 'Cell biology and biomolecules', syllabusLink: 'Cell structure and function; nucleus, mitochondria, ribosomes; proteins, lipids, carbohydrates and enzymes', lessons: [
        AcademyLesson(title: 'The cell as the basis of life', objectives: 'Describe cell organisation and explain the roles of major biomolecules.', sections: [
          AcademyLessonSection('1. Cell structure', '''The cell is the basic structural and functional unit of life. The cell membrane controls exchange with the environment. The cytoplasm contains structures where many chemical reactions occur. The nucleus stores most genetic information in eukaryotic cells. Mitochondria are central to aerobic energy production, while ribosomes build proteins.

Plant cells usually have a cell wall, chloroplasts and a large central vacuole. Animal cells do not have these structures in the same form. The comparison is useful because structure is related to function.'''),
          AcademyLessonSection('2. Biomolecules', '''Carbohydrates are an important energy source and also serve structural roles. Lipids store energy and form major components of cell membranes. Proteins perform structural, transport, signalling, defence and catalytic functions. Enzymes are biological catalysts that speed up reactions by lowering activation energy.

Enzyme activity depends on factors such as temperature, pH and substrate concentration. Extreme conditions can alter the structure of an enzyme and reduce its function.'''),
          AcademyLessonSection('3. Link structure to function', '''Biology questions often test relationships rather than isolated definitions. A cell with many mitochondria is adapted for high energy demand. A membrane's composition affects what can pass through it. Protein shape is connected to its function.

When explaining a biological process, identify the structure, describe the mechanism and state the outcome.'''),
        ], keyTerms: ['Cell membrane', 'Nucleus', 'Mitochondria', 'Ribosome', 'Carbohydrate', 'Lipid', 'Enzyme'], examQuestion: 'Explain how the structure of a cell supports its functions.', practiceTask: 'Draw a labelled plant cell and animal cell. Add one sentence explaining the function of each labelled organelle.'),
      ]),
      AcademyChapter(number: '06', title: 'Human physiology, disease and prevention', syllabusLink: 'Human physiology; polio, diarrhoea, malaria, hepatitis, dengue; causes and prevention', lessons: [
        AcademyLesson(title: 'Major body systems and public health', objectives: 'Describe the functions of major physiological systems and distinguish prevention strategies for common diseases.', sections: [
          AcademyLessonSection('1. Human physiology', '''The human body operates through interacting systems. The digestive system breaks food into absorbable nutrients. The respiratory system exchanges oxygen and carbon dioxide. The circulatory system transports gases, nutrients, hormones and waste. The nervous and endocrine systems coordinate responses. The kidneys help regulate water, salts and waste removal. The immune system identifies and responds to pathogens.

Physiology answers should explain the sequence of a process. For example, digestion is not simply the breakdown of food; it includes mechanical processing, chemical digestion, absorption and transport.'''),
          AcademyLessonSection('2. Infectious diseases', '''Polio is a viral disease that can cause paralysis and is preventable through vaccination. Diarrhoea has multiple possible causes and can lead to dangerous dehydration; safe water, sanitation, hygiene and oral rehydration are central to prevention and treatment. Malaria is transmitted by infected female Anopheles mosquitoes. Dengue is transmitted by Aedes mosquitoes. Hepatitis refers to inflammation of the liver and can have viral and non-viral causes; prevention depends on the type.

Do not confuse the pathogen, route of transmission and prevention method. Vaccination is not available for every disease or every form of a disease.'''),
          AcademyLessonSection('3. Public health prevention', '''Prevention operates at several levels: safe water and sanitation, vaccination, vector control, food safety, health education, disease surveillance, timely diagnosis and access to treatment. Public health measures work best when communities trust health services and can reach them.

A CSS answer should connect household behaviour with public infrastructure. Telling people to maintain hygiene is insufficient where safe water and sanitation are unavailable.'''),
        ], keyTerms: ['Physiology', 'Immunity', 'Vaccination', 'Vector', 'Dehydration', 'Sanitation', 'Surveillance'], examQuestion: 'Explain why disease prevention requires both individual behaviour and public infrastructure.', practiceTask: 'Prepare a disease table showing cause, transmission, major risk, prevention and public-health response for the five diseases in the syllabus.'),
      ]),
      AcademyChapter(number: '07', title: 'Environmental science and climate systems', syllabusLink: 'Atmosphere, hydrosphere, biosphere, lithosphere; pollution; global warming; ozone depletion; treaties', lessons: [
        AcademyLesson(title: 'Environmental systems and pollution', objectives: 'Understand Earth systems and explain major forms of environmental degradation.', sections: [
          AcademyLessonSection('1. Earth systems', '''The atmosphere is the layer of gases surrounding Earth. The hydrosphere includes water in oceans, rivers, lakes, groundwater and ice. The biosphere includes living organisms and the ecosystems they form. The lithosphere is the rigid outer part of Earth, including rocks and minerals.

These systems interact. A change in land cover can affect runoff, soil erosion, local temperature and biodiversity. Environmental analysis is therefore based on systems and feedbacks, not isolated components.'''),
          AcademyLessonSection('2. Air and water pollution', '''Air pollutants include particulate matter, nitrogen oxides, sulphur dioxide, carbon monoxide, ground-level ozone and volatile organic compounds. Sources include transport, power generation, industry, household fuel and agriculture. Effects may include respiratory illness, reduced visibility, crop damage and environmental harm.

Water pollution can arise from sewage, industrial effluent, agricultural runoff, heavy metals, pathogens, sediments and plastics. Water quality depends on the pollutant, concentration, exposure route and treatment capacity. Explain both source and effect when writing an answer.'''),
          AcademyLessonSection('3. Global environmental change', '''The greenhouse effect is a natural process in which gases absorb and re-emit infrared radiation. Human activities have increased concentrations of several greenhouse gases, strengthening warming. Ozone depletion in the stratosphere is a different problem, historically driven by ozone-depleting substances such as chlorofluorocarbons. Acid rain is associated with emissions of sulphur and nitrogen compounds.

International agreements address specific problems. The Montreal Protocol targets ozone-depleting substances. The Kyoto Protocol established emissions commitments for certain parties under the climate regime. Do not confuse the goals or legal structures of different agreements.'''),
        ], keyTerms: ['Atmosphere', 'Hydrosphere', 'Biosphere', 'Particulate matter', 'Greenhouse effect', 'Ozone depletion', 'Montreal Protocol'], examQuestion: 'Differentiate between global warming, ozone depletion and acid rain in terms of causes and consequences.', practiceTask: 'Make a three-column comparison of these environmental problems and identify one policy response for each.'),
      ]),
      AcademyChapter(number: '08', title: 'Information technology and biofuel', syllabusLink: 'Information technology; modern communication; new model concepts of producing biofuel', lessons: [
        AcademyLesson(title: 'Digital systems and sustainable technology', objectives: 'Understand basic computing, networks, digital risks and the principles of biofuel production.', sections: [
          AcademyLessonSection('1. Computing fundamentals', '''A computer system combines hardware, software, data and users. Hardware includes the processor, memory, storage and input/output devices. Software includes system software and applications. Networks connect devices so that information and resources can be shared.

The internet is a network of networks. It supports communication, commerce, education and public services, but dependence on digital systems creates risks involving privacy, cybercrime, misinformation and service disruption.'''),
          AcademyLessonSection('2. Digital governance and communication', '''Information systems collect, process, store and distribute data to support decisions. Telecommunications use technologies such as fibre, radio and satellite systems to carry information. Artificial intelligence refers to methods that allow computer systems to perform tasks such as pattern recognition, prediction and language processing.

Digital systems require secure infrastructure, reliable electricity, skilled users, data protection rules and inclusive access. A policy analysis should consider who benefits, who is excluded and how misuse can be prevented.'''),
          AcademyLessonSection('3. Biofuel production', '''Biofuels are fuels produced from biological material. Depending on the feedstock and process, they may include bioethanol, biodiesel and biogas. Feedstocks can include crops, organic waste, agricultural residues and other biomass. Production processes may involve fermentation, oil extraction and transesterification, or anaerobic digestion.

Biofuels are not automatically sustainable. Their overall impact depends on land and water use, feedstock choice, energy inputs, transport and effects on food prices and ecosystems.'''),
        ], keyTerms: ['Hardware', 'Software', 'Network', 'Information system', 'Cybersecurity', 'Bioethanol', 'Biodiesel', 'Biogas'], examQuestion: 'Assess the opportunities and limitations of digital technology and biofuels for sustainable development.', practiceTask: 'Draw a simple information-system diagram and a biofuel production flow from feedstock to final fuel.'),
      ]),
      AcademyChapter(number: '09', title: 'Quantitative ability and logical reasoning', syllabusLink: 'Arithmetic, algebra, geometry, ratios, rates, percentages, sampling and reasoning', lessons: [
        AcademyLesson(title: 'A repeatable method for problem solving', objectives: 'Translate word problems into mathematical steps and test whether answers are reasonable.', sections: [
          AcademyLessonSection('1. Arithmetic and percentages', '''For percentage change, subtract the original value from the new value, divide the difference by the original value, then multiply by 100. The original value is the base. Confusing the base can produce a plausible but incorrect result.

For ratios, simplify by dividing each term by the same factor. For rates, identify the quantity per unit, such as distance per hour or cost per item. Always write units so that the meaning of a calculation remains visible.'''),
          AcademyLessonSection('2. Algebra, geometry and data', '''Algebra represents unknown quantities with symbols. Build an equation from the relationship described in the question, solve it using valid operations and check the result by substitution. Geometry requires attention to definitions, diagrams, units and formula conditions. Data interpretation requires checking axes, sample sizes, units and whether values are absolute or relative.

A numerical result without a method may hide a conceptual error. Show the steps clearly.'''),
          AcademyLessonSection('3. Logical reasoning and error review', '''Reasoning questions may test sequences, classification, conditional statements, analogies, spatial patterns and argument structure. Identify the rule before selecting an answer. For complex items, write down what is known, what must be established and which possibilities can be eliminated.

Maintain an error log. Record the type of error, the underlying concept and the method that would prevent it next time. Revisit repeated errors rather than simply doing more questions.'''),
        ], keyTerms: ['Percentage change', 'Ratio', 'Rate', 'Equation', 'Data interpretation', 'Inference', 'Sampling'], examQuestion: 'Why is identifying the correct base essential when calculating percentage change?', practiceTask: 'A household uses 500 kWh in one month and 425 kWh the next. Calculate the percentage reduction and explain the method.',
      )]),
    ],
  ),
  AcademyCourse(
    title: 'Current Affairs',
    marks: '100 marks',
    description: 'Study Pakistan’s domestic affairs, external relations and global issues through dated evidence and policy analysis.',
    chapters: [
      AcademyChapter(number: '01', title: 'A method for studying current affairs', syllabusLink: 'Interpret current affairs through history, politics and international affairs', lessons: [
        AcademyLesson(title: 'Turn daily news into an analytical issue brief', objectives: 'Separate background, verified facts, stakeholders, causes and policy options.', sections: [
          AcademyLessonSection('1. Start with the structural issue', '''A news event is usually the visible point of a deeper issue. A budget announcement, for example, belongs to a wider discussion of taxation, public spending, debt, distribution and economic growth. Begin by identifying the policy area and the historical or institutional background that helps explain the event.

Do not write a newspaper summary. Ask why the issue exists, who is affected and which institutions have authority to act.'''),
          AcademyLessonSection('2. Build an evidence file', '''Record the date of publication, the period covered, the institution responsible and the exact indicator being reported. Give preference to primary sources such as official legislation, statistical agencies, central banks, government reports and recognised international organisations. A figure should not be described as current unless its reporting period supports that claim.

Keep facts separate from analysis and forecasts. Clearly label estimates and projections.'''),
          AcademyLessonSection('3. Construct the answer', '''An issue brief should include background, current position, stakeholders, structural causes, consequences, policy choices, implementation constraints and a balanced conclusion. In the examination, use a clear thesis and a limited number of well-developed arguments. Recommendations should identify institutions, resources and implementation risks.

A short, dated evidence file is more useful than a large folder of unverified headlines.'''),
        ], keyTerms: ['Primary source', 'Stakeholder', 'Structural cause', 'Policy instrument', 'Implementation constraint'], examQuestion: 'Why should current-affairs preparation be organised around issues rather than daily headlines?', practiceTask: 'Prepare a one-page brief on one current issue using the nine headings taught in this lesson. Date every statistic.'),
      ]),
      AcademyChapter(number: '02', title: 'Pakistan’s domestic affairs', syllabusLink: 'Domestic affairs: political, economic and social issues', lessons: [
        AcademyLesson(title: 'Political, economic and social analysis', objectives: 'Connect institutional design, economic structure and human development.', sections: [
          AcademyLessonSection('1. Political affairs', '''Political analysis should examine constitutional arrangements, parliament, executive authority, courts, political parties, elections, local government and accountability. Institutions matter because they define who can make decisions, how those decisions can be challenged and how public power is constrained.

Do not confuse political stability with the absence of disagreement. Democratic stability depends on lawful competition, predictable rules, peaceful transfers of power and the ability to resolve disputes constitutionally.'''),
          AcademyLessonSection('2. Economic affairs', '''Economic analysis should separate short-term stabilisation from long-term development. Examine public finances, external accounts, taxation, productivity, investment, exports, energy, employment and social protection. A single macroeconomic indicator rarely explains the full condition of an economy.

When using statistics, state the year and the source. Explain what an indicator measures and what it does not measure.'''),
          AcademyLessonSection('3. Social affairs', '''Social analysis focuses on education, health, population, gender inclusion, poverty, urbanisation, migration and access to public services. Enrolment does not automatically mean learning, and expenditure does not automatically mean better health outcomes. Examine quality, distribution, institutional capacity and outcomes.

A policy recommendation should be realistic about budgets, provincial responsibilities, administrative capacity and the needs of different communities.'''),
        ], keyTerms: ['Constitutionalism', 'Political stability', 'Productivity', 'Human development', 'Service delivery'], examQuestion: 'How are political institutions, economic productivity and human development connected in Pakistan?', practiceTask: 'Select one domestic challenge and map its political, economic and social causes on a single page.'),
      ]),
      AcademyChapter(number: '03', title: 'Pakistan’s external affairs', syllabusLink: 'Relations with neighbours, Muslim world, United States and international organisations', lessons: [
        AcademyLesson(title: 'Analyse foreign relations through interests and constraints', objectives: 'Compare bilateral relations and multilateral diplomacy without relying on slogans.', sections: [
          AcademyLessonSection('1. Bilateral relationships', '''For each country, identify shared interests, sources of disagreement, economic links, security issues and diplomatic channels. Relations with neighbouring states are shaped by geography and history, but they also respond to domestic politics and changes in the international system.

Use a consistent structure when preparing country notes. It makes comparison easier and helps avoid writing the same generic claims about every relationship.'''),
          AcademyLessonSection('2. The Muslim world and the United States', '''Relations with Muslim-majority states may include energy, labour migration, investment, security cooperation, religious ties and diplomacy. These interests are not always identical. Relations with the United States have changed across different periods according to regional security, economic cooperation, domestic politics and strategic priorities.

Explain continuity and change. Avoid describing complex relations as permanently allied or permanently hostile.'''),
          AcademyLessonSection('3. International organisations', '''The United Nations, World Trade Organization, SAARC, ECO, OIC and other institutions have different mandates. Some are designed for security, others for trade, development or political coordination. Evaluate their effectiveness by examining decision-making rules, enforcement capacity, political constraints and concrete outcomes.

A country's membership creates a platform, but influence depends on diplomacy, resources, coalitions and follow-through.'''),
        ], keyTerms: ['Bilateral diplomacy', 'Multilateralism', 'Strategic interest', 'Economic diplomacy', 'International organisation'], examQuestion: 'Can Pakistan pursue economic diplomacy while managing long-standing security concerns? Discuss.', practiceTask: 'Prepare a country brief on one neighbour and one major partner, using identical categories for comparison.'),
      ]),
      AcademyChapter(number: '04', title: 'Global issues', syllabusLink: 'Security, political economy, human rights, environment, population, terrorism, energy, nuclear security, trade and oceans', lessons: [
        AcademyLesson(title: 'Connect global problems to international political economy', objectives: 'Explain how global risks cross borders and affect Pakistan.', sections: [
          AcademyLessonSection('1. Security and political economy', '''International security includes armed conflict, nuclear risks, terrorism, maritime security, cyber threats and competition among major powers. International political economy examines how trade, finance, investment, technology and institutions distribute costs and benefits across countries.

Globalisation creates opportunities through markets and knowledge exchange, but it can also transmit financial shocks, supply-chain disruption and unequal bargaining power.'''),
          AcademyLessonSection('2. Human rights, environment and population', '''Human rights debates involve legal obligations, political practice, enforcement and the protection of vulnerable groups. Environmental issues such as climate change, air pollution, biodiversity loss and water stress often cross national borders. Population trends influence labour markets, public services, migration and urban planning.

Avoid treating these issues as isolated. Climate shocks can affect food prices, migration and security; rapid urbanisation can increase exposure to heat and flooding.'''),
          AcademyLessonSection('3. Trade, energy and maritime cooperation', '''International trade depends on market access, standards, logistics, financing and the rules governing commerce. Global energy politics involves supply security, price volatility, technology, sanctions and the transition to lower-carbon systems. The Arabian Sea and wider Indian and Pacific Oceans are important for trade routes, fisheries, naval activity and strategic competition.

A good answer identifies who controls key routes or institutions, what interests are at stake and how cooperation could reduce risk.'''),
        ], keyTerms: ['International political economy', 'Globalisation', 'Human rights', 'Energy politics', 'Maritime security', 'Supply chain'], examQuestion: 'How do global economic and environmental shocks create new national-security challenges for developing countries?', practiceTask: 'Choose one global issue and connect it to Pakistan through three channels: economy, society and foreign policy.'),
      ]),
    ],
  ),
  AcademyCourse(
    title: 'Islamic Studies',
    marks: '100 marks',
    description: 'Study the FPSC Islamic Studies themes through accurate concepts, primary references, historical context and contemporary application.',
    chapters: [
      AcademyChapter(number: '01', title: 'Introduction to Islam', syllabusLink: 'Concept of Islam; Din and religion; beliefs; worship and their individual/social impact', lessons: [
        AcademyLesson(title: 'Islam as a comprehensive way of life', objectives: 'Explain the concept of Islam, the role of Din and the relationship between belief, worship and conduct.', sections: [
          AcademyLessonSection('1. Concept of Islam and Din', '''In Islamic thought, Islam refers to submission to God and the pursuit of a life ordered by divine guidance. The term Din is often used for a comprehensive framework of belief, worship, ethics and social responsibility. The syllabus asks candidates to explain the importance of Din in human life and to distinguish its scope from a narrow understanding of religion as a private ritual practice.

A strong answer should define terms carefully and avoid unsupported claims about how every society understands religion. Explain the concept, then show how it influences personal conduct and social obligations.'''),
          AcademyLessonSection('2. Belief and moral responsibility', '''Islamic belief includes faith in God, prophethood, revelation, angels, the Hereafter and divine decree. Belief is not presented merely as a theoretical list; it is connected to accountability, honesty, justice, patience and responsibility. The idea of accountability before God gives ethical significance to private conduct as well as public action.

When writing an answer, connect each belief to a practical consequence rather than repeating definitions without analysis.'''),
          AcademyLessonSection('3. Worship and its impact', '''Worship includes devotional acts that cultivate discipline, gratitude, humility and social responsibility. Prayer structures time and encourages remembrance and moral restraint. Fasting develops self-control and awareness of the needs of others. Zakat links wealth to social responsibility and the welfare of eligible recipients. Hajj represents collective worship and the unity of believers.

Explain spiritual, moral and social effects together. Do not claim that ritual performance automatically produces ethical conduct; the syllabus invites analysis of the intended impact and its application.'''),
        ], keyTerms: ['Din', 'Aqidah', 'Accountability', 'Worship', 'Zakat', 'Moral responsibility'], examQuestion: 'Explain how Islamic beliefs and worship shape the moral and social life of an individual.', practiceTask: 'Choose two pillars of Islam and explain their individual, moral and social implications using verified references.'),
      ]),
      AcademyChapter(number: '02', title: 'Seerah as a role model', syllabusLink: 'Prophet Muhammad (PBUH) as individual, diplomat, educator, military strategist and peacemaker', lessons: [
        AcademyLesson(title: 'Study Seerah through roles and context', objectives: 'Analyse Seerah as a model for personal conduct, diplomacy, education and conflict management.', sections: [
          AcademyLessonSection('1. Personal conduct and trust', '''The study of Seerah includes the Prophet Muhammad's (PBUH) character, relationships, patience, truthfulness, compassion and responsibility. These qualities can be examined as an integrated ethical model rather than as disconnected anecdotes.

When presenting an example, establish its historical context and use a reliable source. Avoid attributing quotations or events without verification.'''),
          AcademyLessonSection('2. Diplomatic and educational leadership', '''The Prophet's (PBUH) role as a diplomat can be studied through negotiation, agreements, communication and the management of relations with different communities. His role as an educator includes gradual instruction, accessibility, practical demonstration and the development of moral character.

Analyse the method and purpose of an example. A strong answer explains what principle it illustrates and how that principle may be applied in contemporary public life.'''),
          AcademyLessonSection('3. Conflict and peacemaking', '''The syllabus includes military strategy and peacemaking. These should be studied through historical context, ethical limits, preparation, consultation, protection of non-combatants and the search for peaceful settlement. Do not remove events from their context or present a complex historical episode as a simple modern policy manual.

A balanced answer can recognise both security responsibilities and the value of reconciliation.'''),
        ], keyTerms: ['Seerah', 'Amanah', 'Consultation', 'Diplomacy', 'Education', 'Peacemaking'], examQuestion: 'How does the Seerah provide guidance for diplomacy, education and conflict resolution?', practiceTask: 'Prepare one verified historical example for each role listed in the syllabus and explain the principle it demonstrates.'),
      ]),
      AcademyChapter(number: '03', title: 'Human rights and the status of women', syllabusLink: 'Human rights, dignity of men and women, rights and responsibilities', lessons: [
        AcademyLesson(title: 'Dignity, equality and social responsibility', objectives: 'Explain the ethical basis of human dignity and analyse rights within a framework of duties and justice.', sections: [
          AcademyLessonSection('1. Human dignity', '''Islamic ethical discussions of human rights begin with the dignity of human beings and the responsibility to act justly. Relevant themes include protection of life, property, honour, family, conscience and fair treatment. Explain the concept before listing rights and connect it to the duties of individuals and public authorities.

Use verified Quranic and Hadith references, including their context. An inaccurate quotation can weaken an otherwise sound answer.'''),
          AcademyLessonSection('2. Women’s status and rights', '''The syllabus explicitly asks candidates to examine the status of women and the dignity of men and women. Study rights and responsibilities in education, property, inheritance, marriage, family life, social participation and protection from injustice. Distinguish normative principles from the ways they have been interpreted or implemented in different historical and social settings.

Avoid sweeping claims that ignore differences among legal schools, societies and historical periods. A careful answer identifies the relevant principle and explains its application.'''),
          AcademyLessonSection('3. Rights and public institutions', '''Rights require institutions that can protect them. Family structures, courts, public administration, education and social welfare systems all influence whether people can exercise their rights. A policy answer should consider access, enforcement, awareness and remedies for violations.

The examiner is testing conceptual understanding and application, not merely the ability to repeat general statements about equality.'''),
        ], keyTerms: ['Human dignity', 'Justice', 'Rights', 'Responsibilities', 'Inheritance', 'Social protection'], examQuestion: 'Discuss human dignity and the status of women in Islam with reference to rights and responsibilities.', practiceTask: 'Prepare a structured answer on one right. Include its ethical basis, practical implications and institutional safeguards.'),
      ]),
      AcademyChapter(number: '04', title: 'Islamic civilization and culture', syllabusLink: 'Meanings, vital elements, personality, community and characteristics of civilization', lessons: [
        AcademyLesson(title: 'The foundations of Islamic civilization', objectives: 'Explain the principles that shaped Islamic civilization and their effects on individuals and communities.', sections: [
          AcademyLessonSection('1. Meaning and elements', '''Civilization includes institutions, knowledge, social practices, arts, law, economic life and systems of governance. Islamic civilization developed across diverse regions and historical periods. It cannot be reduced to one language, ethnicity or political dynasty.

Its intellectual and social history includes religious scholarship, philosophy, science, literature, architecture, trade and legal traditions. A sound answer distinguishes enduring principles from changing historical expressions.'''),
          AcademyLessonSection('2. Core characteristics', '''The syllabus identifies Tawhid, self-purification, human dignity, equality, social justice, moral values, tolerance and rule of law as important characteristics. Explain each principle and show how it shapes behaviour and institutions. For example, rule of law requires public authority to operate through just and accountable standards, while social justice concerns fair treatment and the protection of rights.

Do not merely list the characteristics. Explain the relationship among them and the conditions needed for implementation.'''),
          AcademyLessonSection('3. Personality and community', '''Civilization influences personality through education, family, social norms, law and public institutions. It influences community life through cooperation, dispute resolution, welfare and shared values. Historical achievements should be studied alongside intellectual disagreements and institutional change.

A balanced answer avoids presenting history as uninterrupted success or decline. It identifies periods, contexts and contributions with evidence.'''),
        ], keyTerms: ['Tawhid', 'Tazkiyah', 'Social justice', 'Tolerance', 'Rule of law', 'Civilization'], examQuestion: 'How do the principles of Islamic civilization contribute to the development of individual character and social institutions?', practiceTask: 'Choose three characteristics and provide one historical illustration and one contemporary institutional application for each.'),
      ]),
      AcademyChapter(number: '05', title: 'Islam and the modern world', syllabusLink: 'Impact on and from the West; role in modern world; Muslim world challenges; extremism', lessons: [
        AcademyLesson(title: 'Contemporary challenges and intellectual engagement', objectives: 'Evaluate contemporary challenges without stereotyping Muslim societies or the wider world.', sections: [
          AcademyLessonSection('1. Historical exchange and intellectual influence', '''The relationship between Islamic civilization and the West has involved exchange, translation, trade, conflict, scholarship and institutional change across many centuries. Influence has moved in different directions and has varied by period and field. Avoid simplified claims that one civilization developed entirely in isolation from another.

Use specific examples from science, philosophy, law, architecture, commerce or education and identify the period in which the exchange took place.'''),
          AcademyLessonSection('2. Challenges facing Muslim societies', '''Contemporary challenges may include governance, education, economic inequality, political conflict, technology, demographic pressures, corruption, weak institutions and external intervention. These challenges differ across countries. Muslim societies should not be treated as a single political or economic unit.

A strong answer connects diagnosis with institutional causes and realistic policy options. It distinguishes religious principles from the actions of particular governments or organisations.'''),
          AcademyLessonSection('3. Extremism and response', '''Extremism should be analysed through ideology, mobilisation, political conditions, social exclusion, conflict and the role of institutions. Avoid equating an entire religion or population with violent movements. Effective responses can include lawful security measures, education, prevention of recruitment, protection of vulnerable communities, credible justice and opportunities for peaceful participation.

A policy response must respect rights and the rule of law. Unlawful or indiscriminate measures can deepen grievance and undermine public trust.'''),
        ], keyTerms: ['Intellectual exchange', 'Governance', 'Pluralism', 'Extremism', 'Prevention', 'Rule of law'], examQuestion: 'Discuss the contemporary challenges of the Muslim world and assess institutional responses to extremism.', practiceTask: 'Write a cause-and-response matrix for one contemporary challenge, separating structural causes from immediate triggers.'),
      ]),
      AcademyChapter(number: '06', title: 'Public administration and governance in Islam', syllabusLink: 'Good governance; Shura; legislation; Khilafat; responsibilities of civil servants; accountability and hisbah', lessons: [
        AcademyLesson(title: 'Public authority, consultation and accountability', objectives: 'Relate Islamic ethical principles to public administration and responsible government.', sections: [
          AcademyLessonSection('1. Good governance', '''Good governance concerns the lawful, ethical and effective exercise of public authority. The syllabus asks candidates to examine Quranic guidance and the application of governance principles through the Quran, Sunnah and Fiqh. Relevant themes include justice, trust, consultation, fulfilment of responsibilities, protection of rights and accountability.

Explain each principle in a public-administration context. For example, amanah can be related to responsible handling of public resources, while justice can be connected to impartial service delivery.'''),
          AcademyLessonSection('2. Shura, legislation and historical practice', '''Shura refers to consultation in decision-making. Study its ethical significance and the ways consultation appeared in early Muslim governance. The period of the Pious Caliphate provides historical material on leadership, public responsibility and administrative practice. Letters and instructions attributed to Hazrat Umar (RA) and Hazrat Ali (RA) should be used only after checking reliable editions and context.

Do not assume that a historical institution maps directly onto a modern constitutional structure. Explain the principle and then discuss the limits of comparison.'''),
          AcademyLessonSection('3. Civil servants and accountability', '''Civil servants exercise delegated public power and should be guided by competence, impartiality, honesty, lawful conduct and service to the public. Hisbah is associated with accountability and the promotion of public welfare and ethical conduct. Its historical and legal meanings should be explained carefully rather than reduced to a single modern enforcement mechanism.

A CSS answer should connect values to institutional safeguards: transparent procedures, audit, complaint mechanisms, judicial review, clear responsibility and protection against arbitrary action.'''),
        ], keyTerms: ['Shura', 'Amanah', 'Hisbah', 'Accountability', 'Public service', 'Justice'], examQuestion: 'Explain the principles of good governance in Islam and their relevance to the responsibilities of civil servants.', practiceTask: 'Choose three governance principles and show how each can be translated into a practical administrative rule.'),
      ]),
      AcademyChapter(number: '07', title: 'Islamic code of life and legal reasoning', syllabusLink: 'Social, political, economic, judicial and administrative systems; Ijma and Ijtihad', lessons: [
        AcademyLesson(title: 'Institutions, law and changing circumstances', objectives: 'Describe the major dimensions of the Islamic code of life and explain Ijma and Ijtihad.', sections: [
          AcademyLessonSection('1. Social, political and economic systems', '''The Islamic code of life is studied through interconnected social, political, economic, judicial and administrative dimensions. Social principles concern family, mutual responsibility, welfare and justice. Political principles concern consultation, lawful authority and accountability. Economic principles include fair dealing, prohibition of exploitation, social responsibility and the circulation of wealth.

Avoid presenting each system as a disconnected list. Explain how justice and accountability connect them.'''),
          AcademyLessonSection('2. Judicial and administrative principles', '''A judicial system requires fair procedure, evidence, impartial adjudication and protection against arbitrary decisions. Administration requires competence, clarity of responsibility, proper records and responsible use of public resources. Historical examples can illustrate these principles, but their context must be explained.

When comparing historical and modern institutions, identify similarities in purpose as well as differences in legal structure and social conditions.'''),
          AcademyLessonSection('3. Ijma and Ijtihad', '''Ijma is commonly understood as scholarly consensus within Islamic legal theory, though definitions and the conditions for establishing it differ among schools and scholars. Ijtihad is disciplined reasoning by qualified scholars to derive rulings or address questions where interpretation is required. It is not unrestricted personal opinion.

Explain the role of legal sources, qualifications, methodology and scholarly disagreement. Avoid claiming that every new issue has one universally accepted answer.'''),
        ], keyTerms: ['Social system', 'Economic justice', 'Judicial procedure', 'Ijma', 'Ijtihad', 'Fiqh'], examQuestion: 'Discuss the role of Ijma and Ijtihad in addressing new questions while maintaining continuity in Islamic legal thought.', practiceTask: 'Prepare a comparison of Ijma and Ijtihad: meaning, function, conditions, limits and one contemporary application.',
      )]),
    ],
  ),
];
