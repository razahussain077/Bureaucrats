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
          AcademyLesson(
            title: 'The reformers and educational institutions: a comparative study',
            objectives: 'Compare the aims, methods and historical contexts of Shaikh Ahmad Sirhindi, Shah Waliullah, Sayyid Ahmad Shaheed and major Muslim educational movements.',
            sections: [
              AcademyLessonSection('1. Shaikh Ahmad Sirhindi and Shah Waliullah', '''Shaikh Ahmad Sirhindi (1564–1624), associated with the Naqshbandi tradition, argued for the renewal of Muslim religious and intellectual life during the Mughal period. His letters criticised practices he considered inconsistent with Islamic teaching and stressed the distinction between religious authority and imperial expediency. Study him in the context of Akbar and Jahangir’s courts, not as a modern nationalist operating with twentieth-century political concepts.

Shah Waliullah (1703–1762) responded to a different setting: weakening Mughal authority, political fragmentation and intellectual debate. He worked on Quranic translation, hadith, jurisprudence and the moral foundations of society. His thought sought reconciliation among Muslim intellectual traditions and reform of social and political life. His approach was scholarly and reformist; it should not be confused with the later armed movement of his descendants and followers.'''),
              AcademyLessonSection('2. Sayyid Ahmad Shaheed and nineteenth-century reform', '''Sayyid Ahmad Barelvi, commonly known as Sayyid Ahmad Shaheed (1786–1831), led a movement that combined religious reform with armed struggle in the north-western frontier region. His movement drew on a network of followers and was shaped by local political conditions, conflict with Sikh rule and the limitations of establishing authority across diverse tribal and regional communities. Balakot in 1831 became the decisive site of his defeat and death.

For an analytical answer, separate the movement’s religious aims, political objectives, social base, military methods and historical consequences. Do not reduce the movement to a single slogan or assume that all Muslim reformers shared its strategy.'''),
              AcademyLessonSection('3. Aligarh, Deoband and Nadwatul Ulama', '''The Aligarh movement, led by Sir Syed Ahmad Khan, emphasised modern scientific education, English-language learning and engagement with colonial institutions. The Muhammadan Anglo-Oriental College, founded in 1875, later developed into Aligarh Muslim University. Its graduates and networks helped shape a modern Muslim public sphere, although the movement was criticised for its political accommodation and social elitism.

Darul Uloom Deoband, founded in 1866, prioritised traditional Islamic scholarship and the preservation of religious learning under colonial rule. Nadwatul Ulama, established in Lucknow in 1894, sought curricular renewal and dialogue between inherited scholarship and contemporary educational needs. These institutions were not identical: compare their curricula, sources of authority, social constituencies and political responses.'''),
              AcademyLessonSection('4. Sindh Madressatul Islam, Islamia College Peshawar and educational change', '''Sindh Madressatul Islam was founded in Karachi in 1885 under the leadership of Hassan Ali Effendi. It contributed to modern Muslim education in Sindh and is associated with the educational background of Muhammad Ali Jinnah. Islamia College Peshawar, established in 1913 through the efforts of regional Muslim leaders including Sahibzada Abdul Qayyum, became an important centre of modern education in the then North-West Frontier region.

Education expanded political participation by creating new professional groups, institutions and networks. A balanced comparison should recognise regional diversity: Muslim educational reform was not confined to Aligarh, and the impact of institutions varied according to access, language, finance and local political conditions.'''),
            ],
            keyTerms: ['Mujaddid Alf Sani', 'Shah Waliullah', 'Sayyid Ahmad Shaheed', 'Aligarh movement', 'Deoband', 'Nadwatul Ulama', 'Sindh Madressatul Islam', 'Islamia College Peshawar'],
            examQuestion: 'Compare the objectives and methods of the Aligarh, Deoband and Nadwa movements. How did Muslim educational reform shape political consciousness in South Asia?',
            practiceTask: 'Prepare a comparison matrix for all seven reformers and institutions named in the FPSC syllabus: historical context, central objective, method, institution or movement, and political influence.'
          ),
          AcademyLesson(
            title: 'Ideology of Pakistan in the thought of Iqbal and Jinnah',
            objectives: 'Interpret Iqbal’s political ideas and Jinnah’s constitutional statements through primary-source context rather than slogans.',
            sections: [
              AcademyLessonSection('1. Iqbal’s political and philosophical ideas', '''Allama Muhammad Iqbal’s political thought connects spiritual selfhood (khudi), ethical agency, community and intellectual renewal. In his 1930 presidential address at Allahabad, he argued for the consolidation of Muslim-majority provinces in north-western India. The address is essential to the history of Muslim constitutional thought, but it should not be presented as a fully drafted constitution for Pakistan as it emerged in 1947.

Iqbal’s lectures on the reconstruction of religious thought also matter because they discuss the relationship between inherited authority, interpretation and modern social conditions. When using Iqbal in an answer, distinguish philosophical argument, constitutional proposal and later political interpretation.'''),
              AcademyLessonSection('2. Jinnah’s constitutional politics and the Lahore Resolution', '''Muhammad Ali Jinnah’s political career included constitutional advocacy, legislative negotiation and leadership of the Muslim League. His position changed through the political disputes of the 1920s and 1930s, including the Nehru Report, the Fourteen Points, the failure of constitutional negotiations and the experience of provincial politics after 1937. The Lahore Resolution of 1940 was adopted in this changing environment; it should be interpreted through its actual text and the context of Muslim-majority regions.

Jinnah’s speeches and statements repeatedly addressed political safeguards, representation, constitutionalism, minority rights and the character of the state. The speech of 11 August 1947 is especially important for debates on citizenship and religious freedom. Quote it accurately and explain the constitutional question it raises; do not treat one speech as a substitute for the entire constitutional record.'''),
              AcademyLessonSection('3. How to use primary statements in a CSS answer', '''A primary-source answer identifies the date, audience, political setting and exact proposition advanced by the speaker. It then compares that proposition with constitutional developments and political practice. A quotation is not evidence of every later interpretation attached to it. For Iqbal, distinguish the Allahabad Address from his wider philosophical works; for Jinnah, compare his constitutional negotiations, statements before independence and the 11 August address.

A strong conclusion recognises that the ideology of Pakistan has been interpreted through historical, constitutional, religious, democratic and citizenship debates. Candidates should demonstrate knowledge of disagreement and change rather than presenting ideology as a fixed slogan.'''),
            ],
            keyTerms: ['Khudi', 'Allahabad Address', 'Lahore Resolution', 'Constitutional safeguards', 'Citizenship', '11 August 1947 address', 'Primary source', 'Historical interpretation'],
            examQuestion: 'Critically examine the contribution of Allama Iqbal and Quaid-e-Azam Muhammad Ali Jinnah to the ideological and constitutional development of Pakistan.',
            practiceTask: 'Write a 600-word answer using at least two dated primary statements. Explain their context, central argument and later constitutional significance.'
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
              AcademyLessonSection('3. Iqbal’s Allahabad Address', '''Allama Muhammad Iqbal's presidential address at Allahabad in 1930 is important to debates about Muslim political identity and the constitutional future of north-western Muslim-majority regions. Iqbal discussed the political consolidation of Muslim-majority provinces. His address should be read in its own context rather than treated as a fully drafted state constitution.

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
          AcademyLesson(
            title: 'Pakistan’s physical regions, climate and strategic geography',
            objectives: 'Explain the physical geography of Pakistan and connect location, landforms, climate and natural hazards to development.',
            sections: [
              AcademyLessonSection('1. Location, borders and physical regions', '''Pakistan is located at the junction of South Asia, Central Asia, the Middle East and the Arabian Sea. Its strategic geography is shaped by borders with India, Afghanistan, Iran and China, as well as access to the Arabian Sea through ports and coastal routes. The main physical regions include the northern and north-western mountains, the Indus plain, the Balochistan plateau, the Potohar plateau, desert areas and the coastal belt.

Each region has distinct settlement, transport, water and economic patterns. Mountain valleys face landslide, glacier and access constraints; the Indus plain supports dense settlement and irrigated agriculture; arid Balochistan faces water scarcity and sparse settlement; coastal areas depend on fisheries, ports and protection from erosion and sea-level risks.'''),
              AcademyLessonSection('2. Climate, rivers and natural hazards', '''Pakistan’s climate varies from alpine and cold-arid conditions in the north to arid and semi-arid conditions across much of the country, with monsoon rainfall affecting large parts of the east and north. The Indus River system is central to settlement and agriculture. Snowmelt, glacier melt, rainfall, groundwater and reservoir operations interact to shape seasonal water availability.

Major hazards include riverine and flash floods, drought, heatwaves, glacial lake outburst floods, landslides, earthquakes and coastal storms. Risk is produced by the interaction of hazard, exposure and vulnerability. Land-use planning, early warning, resilient infrastructure, watershed management and local preparedness reduce disaster losses more effectively than relief alone.'''),
              AcademyLessonSection('3. Maps as evidence in examination answers', '''A map can demonstrate location, spatial relationships and regional variation more efficiently than a paragraph. Practise locating the Indus and its tributaries, major dams, mountain ranges, passes, deserts, ports, provinces, neighbouring countries and important trade corridors. Use a legend, north arrow and clear labels; avoid crowding the map with information unrelated to the question.

Maps should support an argument. For example, a question on water security can use the Indus basin and irrigation network; a question on trade can show ports and border crossings; a question on climate vulnerability can indicate floodplains, arid zones and mountain hazards.'''),
            ],
            keyTerms: ['Indus basin', 'Indus plain', 'Balochistan plateau', 'Monsoon', 'Glacial lake outburst flood', 'Arid climate', 'Exposure', 'Vulnerability'],
            examQuestion: 'How does Pakistan’s physical geography create both strategic opportunities and development constraints?',
            practiceTask: 'Draw a labelled outline map of Pakistan showing physical regions, major rivers, dams, ports, mountain ranges and neighbouring states. Add a 250-word geographical explanation.'
          ),
          AcademyLesson(
            title: 'Population, society, resources, agriculture, industry and education',
            objectives: 'Analyse the land-and-people component of the syllabus through demographic, social and sectoral indicators.',
            sections: [
              AcademyLessonSection('1. Population and social structure', '''Population analysis should distinguish size, growth, density, age structure, urbanisation, migration, literacy and labour-force participation. A large young population can become a demographic dividend only when education, health, skills and productive employment expand together. Without these investments, rapid population growth can intensify pressure on housing, schools, hospitals, water and urban transport.

Pakistan is socially diverse across language, region, ethnicity, class, rural and urban settlement, and religious communities. Social cohesion is strengthened by equal citizenship, fair public services, local participation and protection of cultural rights. Avoid treating the population as culturally uniform or using stereotypes as explanations for policy outcomes.'''),
              AcademyLessonSection('2. Natural resources and agriculture', '''Natural resources include water, arable land, forests, rangelands, minerals, energy resources, fisheries and biodiversity. Their value depends on sustainable management, infrastructure, technology and governance. Agriculture includes crops, livestock, horticulture, fisheries and associated value chains. Important constraints include water productivity, seed quality, soil degradation, farm size, storage, extension, market access and climate variability.

Agricultural performance should be assessed through yields, farm income, nutrition, water use, rural employment and resilience—not only total output. Sustainable policy links irrigation reform, agricultural research, climate-smart practices, land records, rural credit, storage and fair market access.'''),
              AcademyLessonSection('3. Industry and education', '''Industry covers large-scale manufacturing, small and medium enterprises, mining, construction and modern services linked to production. Industrial competitiveness depends on reliable energy, logistics, skills, technology, finance, predictable regulation, product standards and access to markets. A narrow export base and weak value addition make an economy vulnerable to external shocks. Industrial policy should be evaluated by productivity, export diversification, innovation, jobs and fiscal cost.

Education is both a social right and an economic capability. Analyse access, enrolment, completion, learning outcomes, teacher quality, curriculum, technical and vocational training, higher education, digital access and gender gaps. Spending alone does not guarantee learning: governance, teacher support, assessment and accountability determine whether resources translate into educational outcomes.'''),
              AcademyLessonSection('4. Evidence and sector comparisons', '''Use the Pakistan Economic Survey to compare agriculture, manufacturing and mining, fiscal development, education, health, labour, energy, transport, information technology and climate indicators. State the year and whether a figure is provisional, revised or estimated. Compare trends across several years and identify the policy mechanism behind a change. Do not quote a statistic without its source, time period, unit and definition.'''),
            ],
            keyTerms: ['Demographic dividend', 'Urbanisation', 'Human capital', 'Water productivity', 'Value addition', 'Manufacturing', 'Learning outcomes', 'Economic Survey'],
            examQuestion: 'Evaluate the relationship between human development, natural-resource management and productivity in Pakistan.',
            practiceTask: 'Choose three chapters from the latest Economic Survey and prepare a sector comparison using one trend, two constraints, one policy response and one measurable outcome for each.'
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
          AcademyLesson(
            title: 'Pakistan’s macroeconomic structure, public finance and external account',
            objectives: 'Explain Pakistan’s recurring macroeconomic pressures and interpret the fiscal, monetary and external-sector indicators used in the Economic Survey.',
            sections: [
              AcademyLessonSection('1. Growth, productivity and structural constraints', '''Economic growth is an increase in real output, while development also concerns living standards, opportunity, distribution and resilience. Pakistan’s recurring constraints include low productivity, a narrow tax base, low domestic savings, inconsistent investment, low export sophistication, import dependence in key inputs, energy costs, skills gaps and policy uncertainty. These constraints reinforce one another: weak productivity limits exports and tax revenue; fiscal pressure reduces room for human development and infrastructure; external shortages can interrupt production.

A high-quality answer separates cyclical shocks from structural weaknesses. Floods, energy-price shocks and global financial tightening may worsen an existing imbalance, but they do not by themselves explain low productivity or weak export diversification.'''),
              AcademyLessonSection('2. Fiscal, monetary and external-sector linkages', '''The fiscal account compares government revenue and expenditure. A persistent deficit adds to financing needs and may increase debt and interest costs. The primary balance excludes interest payments and indicates the balance before debt servicing. Monetary policy influences inflation and credit conditions; exchange-rate movements affect import prices, external competitiveness and debt valued in foreign currency. The current account records trade in goods and services, primary income and transfers, including remittances.

These accounts interact. Higher energy imports can worsen the trade balance; currency depreciation may raise the domestic cost of imported inputs; weak tax collection can force borrowing; and high interest costs can crowd out development spending. Explain the transmission mechanism instead of listing indicators.'''),
              AcademyLessonSection('3. Debt, taxation and programme conditionality', '''Public debt should be assessed through its size, currency composition, maturity, interest cost, creditor profile and the government’s capacity to generate revenue and foreign exchange. Debt sustainability is not determined by one ratio alone. Tax reform should consider fairness, simplicity, documentation, compliance, exemptions and the balance between direct and indirect taxation. Broadening the base and improving administration are different from repeatedly increasing rates on already documented taxpayers.

IMF programmes can provide financing and a policy framework, but they also involve conditionality and distributional choices. Evaluate programme outcomes through stabilisation, growth, employment, social protection, fiscal capacity and resilience rather than treating an agreement as proof of success or failure.'''),
              AcademyLessonSection('4. Using the latest official data', '''For CSS CE-2027 preparation, the current official reference set includes the Pakistan Economic Survey 2025–26 and Federal Budget 2026–27. The Finance Division’s survey portal separates growth, agriculture, manufacturing and mining, fiscal development, money and credit, inflation, trade and payments, public debt, education, health, energy, IT, social protection and climate change. The federal budget portal provides the Finance Minister’s speech, Budget in Brief, Annual Budget Statement, receipts, expenditure and development documents.

The IMF’s 7 October 2026 statement reported an estimated 3.6 percent FY26 growth rate and a 2.0 percent of GDP underlying primary-surplus anchor for the FY27 budget; these are estimates and programme targets, not final audited outcomes. Always label the institution, publication date, fiscal year and status of every figure. Official update portals: finance.gov.pk/survey_2026.html and finance.gov.pk/fb_2026_27.html; cross-check programme context at imf.org.'''),
            ],
            keyTerms: ['Real GDP', 'Productivity', 'Fiscal deficit', 'Primary balance', 'Current account', 'Public debt', 'Tax base', 'IMF conditionality'],
            examQuestion: 'Why does macroeconomic stabilisation fail to guarantee inclusive growth? Discuss Pakistan’s fiscal, external and productivity constraints.',
            practiceTask: 'From the Economic Survey 2025–26 and Budget 2026–27, build a one-page data sheet containing growth, inflation, fiscal balance, debt, exports, remittances, agriculture, industry, energy and social-sector indicators. Label each figure by fiscal year and status.'
          ),
          AcademyLesson(
            title: 'Pakistan’s energy system, circular debt and transition choices',
            objectives: 'Explain the structure of the energy sector and evaluate reforms for affordability, reliability, investment and sustainability.',
            sections: [
              AcademyLessonSection('1. Energy supply and demand', '''Pakistan’s energy system includes electricity and fuels used by households, industry, transport, agriculture and public services. Electricity generation draws on a changing mix of hydropower, natural gas, imported fuels, coal, nuclear power and renewable sources such as solar and wind. The mix must be assessed through cost, reliability, domestic availability, foreign-exchange exposure, emissions and seasonal variation. Energy security also includes fuel storage, transmission networks, distribution infrastructure and the ability to withstand supply shocks.'''),
              AcademyLessonSection('2. Circular debt and sector governance', '''Circular debt is a chain of payment arrears across the power sector. It can arise when distribution companies collect less than billed, losses and theft remain high, tariffs do not recover costs, subsidies are delayed, public entities fail to pay bills or capacity and fuel costs exceed recoveries. The problem is not solved permanently by one-off government payments if underlying incentives and operational weaknesses remain unchanged.

Reforms require better metering and billing, lower technical and commercial losses, targeted rather than broad subsidies, timely subsidy payments, transparent procurement, efficient generation, reliable transmission, improved distribution management and credible regulation. Any reform must consider affordability for low-income households and competitiveness for industry.'''),
              AcademyLessonSection('3. Renewable energy, efficiency and transition', '''Solar, wind and hydropower can diversify supply and reduce exposure to imported fuels, but variable generation requires grid flexibility, storage, forecasting and system planning. Distributed solar can reduce daytime demand on the grid while creating new questions about network costs, tariffs and cross-subsidies. Energy efficiency in buildings, appliances, industry, transport and irrigation often reduces demand at lower cost than building new supply.

A just transition considers workers, consumers, regions, public finances and environmental impacts. Compare options using lifecycle cost, reliability, emissions, water use, land requirements, foreign exchange and distributional effects.'''),
            ],
            keyTerms: ['Energy security', 'Generation mix', 'Circular debt', 'Transmission losses', 'Targeted subsidy', 'Grid flexibility', 'Net metering', 'Energy efficiency'],
            examQuestion: 'Is Pakistan’s energy crisis primarily a generation problem or a governance and distribution problem? Critically evaluate.',
            practiceTask: 'Draw a flow diagram from fuel procurement to consumer billing. Mark where technical losses, theft, delayed subsidies, capacity payments and non-payment can create financial arrears.'
          ),
          AcademyLesson(
            title: 'Hydro-politics, the Indus system and water governance',
            objectives: 'Analyse water as a domestic development issue and a transboundary strategic question.',
            sections: [
              AcademyLessonSection('1. The Indus basin and the 1991 Water Apportionment Accord', '''Pakistan’s water security depends on the Indus River and its tributaries, seasonal flows, snow and glacier melt, monsoon rainfall, reservoirs, canals and groundwater. The Water Apportionment Accord of 1991 provides the inter-provincial framework for sharing river waters. The Indus River System Authority (IRSA) coordinates allocations and monitoring under the relevant institutional framework. Water disputes are shaped by hydrology, infrastructure, data, trust and provincial perceptions of equity.

The debate is not only about building dams. It includes irrigation efficiency, crop choices, canal maintenance, groundwater extraction, urban leakage, drainage, water quality, storage, flood management and environmental flows. Explain the difference between water availability, access, allocation and productive use.'''),
              AcademyLessonSection('2. The Indus Waters Treaty and international law', '''The Indus Waters Treaty was signed in 1960 by India and Pakistan with the World Bank’s facilitation. It allocated the eastern rivers—Ravi, Beas and Sutlej—to India and the western rivers—Indus, Jhelum and Chenab—to Pakistan, subject to the treaty’s detailed provisions governing specified uses, projects and procedures. The treaty created a Permanent Indus Commission and mechanisms for resolving differences, questions and disputes.

The treaty has faced serious strain. In 2025 India announced that it was holding the treaty in abeyance; Pakistan rejected the unilateral action. International proceedings continued, including a Court of Arbitration award on treaty status and interim measures dated 31 August 2026. In an exam answer, distinguish treaty text, each state’s official position and the findings or procedural orders of the relevant arbitral forum. Do not state a contested legal position as an uncontested fact.'''),
              AcademyLessonSection('3. Climate, groundwater and water diplomacy', '''Climate change affects snow and glacier dynamics, rainfall timing, flood intensity, drought risk and the reliability of historical flow assumptions. Groundwater has become a vital buffer in many agricultural and urban areas, but unregulated extraction can lower water tables, increase pumping costs and worsen salinity or quality problems. Water diplomacy therefore needs transparent data, technical cooperation, dispute procedures and practical adaptation.

The Ministry of Water Resources, IRSA, provincial irrigation departments, WAPDA, the Permanent Indus Commission and international legal forums have different responsibilities. A strong answer identifies which institution can act, what evidence is needed and how local reforms complement diplomacy.'''),
            ],
            keyTerms: ['Indus basin', 'Water Apportionment Accord 1991', 'IRSA', 'Indus Waters Treaty', 'Permanent Indus Commission', 'Groundwater depletion', 'Hydro-politics', 'Environmental flow'],
            examQuestion: 'Assess the domestic and international dimensions of Pakistan’s water security, with reference to inter-provincial allocation, the Indus Waters Treaty and climate change.',
            practiceTask: 'Prepare a basin map showing the Indus and major tributaries, reservoirs and provincial irrigation zones. Then write a 500-word policy brief on one domestic and one transboundary water reform.'
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

      AcademyChapter(number: '13', title: 'Political evolution of Pakistan since 1971', syllabusLink: 'FPSC topic XII: Political Evolution Since 1971', lessons: [
        AcademyLesson(title: 'From the 1971 rupture to the contemporary constitutional order', objectives: 'Explain the political, constitutional and institutional changes that shaped Pakistan after 1971.', sections: [
          AcademyLessonSection('1. The 1971 crisis and the post-war settlement', '''The separation of East Pakistan in 1971 was the outcome of interacting political, constitutional, economic and military factors. The refusal to transfer power after the 1970 election, competing nationalisms, centralised decision-making, civil conflict, military repression, India’s intervention and the war produced a profound state crisis. A rigorous answer avoids a single-cause explanation and distinguishes the political grievances of East Pakistan from the sequence of decisions that escalated the crisis.

The 1972 Simla Agreement shaped the post-war relationship with India and the treatment of the Line of Control. Domestically, the new state leadership faced the tasks of reconstruction, prisoner repatriation, diplomatic recognition, constitutional settlement and economic recovery. The 1973 Constitution represented an important attempt to restore parliamentary federal government through political consensus.'''),
          AcademyLessonSection('2. Authoritarian periods and democratic transitions', '''The 1977 military takeover suspended the constitutional process and introduced a prolonged period of military rule. The 1985 non-party elections and Eighth Amendment altered the balance between president and prime minister. Following the restoration of party-based elections in 1988, elected governments alternated during the 1990s amid dismissals, political conflict, weak parliamentary continuity and civil-military tensions. These developments exposed the vulnerability of democratic institutions where rules and conventions lacked stable acceptance.

The 1999 military takeover again interrupted constitutional government. The 2002 electoral arrangement and subsequent constitutional changes reshaped the executive and legislative order. The 2008 transition restored elected civilian rule, followed by the 2010 Eighteenth Amendment, which strengthened parliamentary government and provincial autonomy. The first transfer of power between elected civilian governments in 2013 was a significant institutional milestone, although democratic consolidation remained contested.'''),
          AcademyLessonSection('3. The post-2018 period and institutional resilience', '''The 2018 general election, the 2022 change of prime minister through a parliamentary no-confidence vote and the 2024 general election illustrate the continuing centrality of electoral competition, parliamentary procedure and disputes over institutional neutrality. The 2024 election cycle also generated debates about electoral transparency, political inclusion, party rights, coalition government and the credibility of public institutions. Such debates should be studied through official election records, court decisions and multiple credible accounts rather than partisan summaries.

Since 1971, Pakistan’s political evolution has repeatedly raised five questions: who controls executive power, how governments are held accountable, how provinces participate in national decisions, how security institutions relate to elected authorities, and whether political competition takes place under accepted constitutional rules. These questions provide a stronger analytical framework than a list of prime ministers alone.'''),
        ], keyTerms: ['1971 crisis', 'Simla Agreement', 'Military rule', 'Eighth Amendment', 'Civilian transition', 'Eighteenth Amendment', 'Vote of no confidence', 'Democratic consolidation'], examQuestion: 'Assess the major turning points in Pakistan’s political evolution since 1971. Has the country developed durable democratic institutions?', practiceTask: 'Prepare a dated timeline from 1971 to 2024. For each turning point, identify the constitutional change, political actor, institutional consequence and democratic impact.')
      ]),
      AcademyChapter(number: '14', title: 'Evolution of the democratic system', syllabusLink: 'FPSC topic XV: Evolution of Democratic System in Pakistan; elections, parties, parliamentary accountability and local government', lessons: [
        AcademyLesson(title: 'Elections, representation and democratic accountability', objectives: 'Evaluate the institutions and practices required for representative and accountable democratic government.', sections: [
          AcademyLessonSection('1. Representative institutions and constitutional design', '''Pakistan’s constitutional design is parliamentary and federal. The National Assembly represents population, while the Senate gives provinces equal representation. The prime minister and cabinet are politically responsible to the National Assembly; the president performs constitutional functions as head of state. Provincial assemblies and governments exercise authority within the constitutional distribution of powers. Democratic performance depends not only on formal design but also on legislative scrutiny, committee work, party discipline and access to information.'''),
          AcademyLessonSection('2. Elections and the Election Commission', '''Credible elections require accurate electoral rolls, fair delimitation, transparent candidate procedures, neutral administration, secure polling, accessible voting, independent observation, timely adjudication and public confidence in results. The Election Commission of Pakistan has constitutional responsibilities, but electoral credibility also depends on cooperation by political parties, caretaker arrangements, courts, security agencies and the media. A CSS answer should distinguish legal compliance from public perception and examine evidence before making claims about an election.'''),
          AcademyLessonSection('3. Parties, local government and inclusion', '''Political parties connect citizens to the state by aggregating interests, selecting candidates, developing policies and organising parliamentary competition. Weak internal democracy, personalisation and patronage can reduce policy continuity. Local government is important because many service-delivery decisions are local; however, its effectiveness depends on clear legal powers, predictable finance, trained staff and continuity across election cycles.

Women, youth, minorities and marginalised regions need meaningful representation and participation. Reserved seats may improve numerical inclusion, but substantive participation also requires access to leadership, committees, party decision-making and policy processes.'''),
          AcademyLessonSection('4. Standards for judging democratic quality', '''Democratic quality can be assessed through electoral competitiveness, civil liberties, rule of law, peaceful transfers of power, legislative independence, media freedom, judicial independence, local participation and civilian control of public institutions. No single indicator is sufficient. Stable democracy requires political actors to accept constitutional rules even when they lose, and institutions to exercise authority within their legal mandates.'''),
        ], keyTerms: ['Parliamentary government', 'Electoral integrity', 'Election Commission', 'Political party', 'Local government', 'Reserved seats', 'Civil liberties', 'Accountability'], examQuestion: 'Why do regular elections not automatically guarantee democratic consolidation in Pakistan?', practiceTask: 'Assess one general election using five criteria: legal framework, inclusiveness, competition, administration and post-election dispute resolution.')
      ]),
      AcademyChapter(number: '15', title: 'Ethnic issues and national integration', syllabusLink: 'FPSC topic XVI: Ethnic Issues and National Integration; federalism, language, regional grievances and citizenship', lessons: [
        AcademyLesson(title: 'Managing diversity through constitutional federalism', objectives: 'Analyse ethnic and regional diversity without stereotyping communities and propose institutional approaches to national integration.', sections: [
          AcademyLessonSection('1. Diversity, identity and state formation', '''Pakistan is a multilingual and multi-ethnic society. Language, region, kinship, economic position, historical memory and political experience can shape identity. Ethnicity is not inherently a threat to national unity; conflict becomes more likely when communities perceive unequal access to power, resources, representation, security or recognition. The experience of East Pakistan demonstrates the dangers of denying political representation and linguistic-cultural identity within a centralised state.

The state can create shared citizenship without requiring cultural uniformity. A civic framework recognises equal constitutional status while respecting regional languages, traditions and local histories.'''),
          AcademyLessonSection('2. Federalism, provincial autonomy and resource distribution', '''Federalism manages territorial diversity by constitutionally distributing powers between the federation and provinces. The Eighteenth Amendment expanded provincial responsibilities and abolished the Concurrent Legislative List, while the National Finance Commission framework addresses revenue distribution. The Council of Common Interests provides a forum for coordination on shared subjects. These institutions can reduce conflict when they operate transparently and predictably.

Resource disputes often concern royalties, natural resources, water, infrastructure, employment and fiscal transfers. A fair settlement requires reliable data, constitutional procedures, local benefit-sharing and grievance mechanisms. Devolution without administrative capacity or sufficient finance can create new frustration rather than solve old problems.'''),
          AcademyLessonSection('3. Regional grievances and integration policy', '''Regional grievances have different histories and should not be collapsed into one explanation. Balochistan debates include questions of political representation, security, resource control, missing persons allegations, development and provincial autonomy. Khyber Pakhtunkhwa’s experience includes conflict, displacement, border insecurity and the constitutional integration of former FATA through the Twenty-fifth Amendment. Sindh debates include language, urban-rural representation, water and resource distribution; Gilgit-Baltistan and Azad Jammu and Kashmir raise distinct constitutional and representation questions.

An effective integration policy combines political dialogue, rule of law, inclusive development, local government, education, language recognition, fair revenue arrangements and protection of citizens. Security responses alone cannot resolve political or economic grievances.'''),
        ], keyTerms: ['Ethnicity', 'National integration', 'Civic nationalism', 'Federalism', 'Eighteenth Amendment', 'NFC Award', 'Council of Common Interests', 'Provincial autonomy'], examQuestion: 'Can federalism provide a durable framework for national integration in Pakistan? Critically evaluate with regional examples.', practiceTask: 'Prepare a province-wise matrix of major integration concerns, their historical roots, constitutional mechanisms and practical policy responses. Avoid stereotypes and identify evidence gaps.')
      ]),
      AcademyChapter(number: '16', title: 'Nuclear programme, safety and international concerns', syllabusLink: 'FPSC topic IV: Nuclear Program of Pakistan, its Safety and Security; International Concerns', lessons: [
        AcademyLesson(title: 'Deterrence, command and control, safety and diplomacy', objectives: 'Explain the strategic logic and institutional architecture of Pakistan’s nuclear programme and assess international concerns responsibly.', sections: [
          AcademyLessonSection('1. Historical development and strategic rationale', '''Pakistan’s nuclear programme developed in the context of regional security competition, the 1971 war and India’s 1974 nuclear test. Pakistan conducted nuclear tests at Chagai on 28 May 1998 after India’s tests earlier that month. The programme is generally explained by reference to deterrence and the desire to prevent coercion or large-scale conventional conflict. A sound answer should distinguish the historical reasons advanced by policymakers from the wider debate about whether nuclear weapons improve or worsen regional security.'''),
          AcademyLessonSection('2. Command, control, safety and regulation', '''Nuclear safety concerns preventing accidents and protecting people and the environment from radiation. Nuclear security concerns preventing theft, sabotage, unauthorised access and other malicious acts. Command and control concerns lawful political authority, reliable communications, authorisation procedures and protection against unauthorised use. These are distinct but related functions.

Pakistan established the National Command Authority framework and enacted the National Command Authority Act 2010. The Pakistan Nuclear Regulatory Authority, established under the PNRA Ordinance 2001, regulates safety of nuclear installations and radiation-related activities within its legal remit. In an examination answer, identify the institution and its statutory function; avoid operational details that are not public.'''),
          AcademyLessonSection('3. International regimes and concerns', '''Pakistan is not a party to the Nuclear Non-Proliferation Treaty. International concerns include regional arms competition, fissile-material production, export controls, nuclear security, terrorism, crisis stability and the absence of a comprehensive arms-control settlement in South Asia. Pakistan points to its strategic requirements, export-control framework and participation in nuclear security initiatives, while other states debate the standards and membership criteria of global regimes.

The Nuclear Suppliers Group, Comprehensive Nuclear-Test-Ban Treaty and proposed Fissile Material Cut-off Treaty are relevant to this debate. Explain each regime’s purpose and distinguish legal obligations from political expectations. Do not claim that Pakistan has accepted a treaty unless it has formally done so.'''),
          AcademyLessonSection('4. Deterrence and risk reduction', '''Nuclear deterrence relies on the belief that the costs of aggression would be unacceptable. Its credibility depends on survivable capabilities, communication, doctrine and rational decision-making, but it also creates risks of misperception, escalation, accidents and unauthorised action. Crisis-management measures can include hotlines, military-to-military communication, advance notification of certain activities, restraint in public signalling and diplomatic channels.

A balanced CSS conclusion recognises that deterrence may inhibit full-scale war while simultaneously making crises more dangerous. Risk reduction, conventional confidence-building, dialogue and regional arms-control mechanisms remain important.'''),
        ], keyTerms: ['Nuclear deterrence', 'Chagai tests 1998', 'National Command Authority', 'NCA Act 2010', 'PNRA', 'NPT', 'NSG', 'Crisis stability'], examQuestion: 'Discuss the rationale of Pakistan’s nuclear deterrent and evaluate the challenges of safety, security and strategic stability in South Asia.', practiceTask: 'Prepare a table distinguishing nuclear safety, nuclear security and command-and-control. Add the relevant Pakistani institutions and international regimes.')
      ]),
      AcademyChapter(number: '17', title: 'Pakistan and the changing regional apparatus', syllabusLink: 'FPSC topic III: Pakistan and Changing Regional Apparatus; regional and global strategic realignment', lessons: [
        AcademyLesson(title: 'Geopolitical change, connectivity and strategic choices', objectives: 'Evaluate how changes in global and regional power affect Pakistan’s diplomatic, economic and security choices.', sections: [
          AcademyLessonSection('1. From unipolarity to competitive multipolarity', '''The post-Cold War international system initially gave the United States unmatched influence, but China’s economic and strategic rise, Russia’s renewed geopolitical role and the increasing influence of regional powers have made global politics more competitive. This is not a simple transfer from one hegemon to another. Different powers have different strengths in finance, technology, military capability, energy, trade and institutions.

For Pakistan, the challenge is to avoid treating every regional issue as a binary choice between major powers. A prudent foreign policy protects core interests while maintaining workable relations with China, the United States, Gulf states, Iran, Central Asia, Russia and multilateral institutions.'''),
          AcademyLessonSection('2. South Asia, the Indo-Pacific and continental connectivity', '''South Asia’s security environment is shaped by India-Pakistan rivalry, Afghanistan’s instability, the China-India relationship, nuclear deterrence and unresolved borders. The Indo-Pacific concept links maritime security, trade routes, technology and strategic competition across the Indian and Pacific Oceans. Pakistan’s Arabian Sea coastline and ports connect it to the Gulf, East Africa and wider maritime trade.

Continental connectivity involves roads, rail, energy pipelines, border infrastructure and customs arrangements with Central Asia and western China. Projects such as CPEC should be assessed through commercial viability, debt and financing terms, local employment, security, environmental impact and regional connectivity—not through slogans.'''),
          AcademyLessonSection('3. Strategic autonomy and policy trade-offs', '''Strategic autonomy means retaining the ability to make decisions in the national interest rather than allowing external partners to dictate all choices. It does not mean neutrality in every dispute or equal distance from every power. It requires diversified trade, credible institutions, diplomatic capacity, internal economic resilience and clarity about national priorities.

Pakistan faces trade-offs between security spending and social investment, strategic partnerships and economic diversification, regional competition and connectivity, and external financing and policy independence. A strong answer identifies the trade-off, the options available and the likely long-term consequences.'''),
        ], keyTerms: ['Multipolarity', 'Strategic autonomy', 'Indo-Pacific', 'Connectivity', 'CPEC', 'Maritime security', 'Geo-economics', 'Regional order'], examQuestion: 'How should Pakistan adapt its foreign policy to great-power competition and changing regional alignments?', practiceTask: 'Create a strategic options matrix comparing Pakistan’s interests in relations with China, the United States, Gulf states, Iran, Afghanistan and Central Asia.')
      ]),
      AcademyChapter(number: '18', title: 'Regional cooperation organisations and Pakistan', syllabusLink: 'FPSC topic V: Regional Cooperation Organizations (SAARC, ECO, SCO) and the Role of Pakistan; relevant OIC and UN engagement', lessons: [
        AcademyLesson(title: 'Regional institutions: mandates, achievements and constraints', objectives: 'Compare the mandates and effectiveness of major regional organisations and evaluate Pakistan’s role.', sections: [
          AcademyLessonSection('1. SAARC and South Asian cooperation', '''The South Asian Association for Regional Cooperation was established in 1985 to promote welfare, economic growth and regional cooperation among South Asian states. Its work includes development, health, education, poverty reduction and technical cooperation. The South Asian Free Trade Area framework sought to expand trade, but political tensions—especially India-Pakistan rivalry—have constrained regional integration and high-level activity.

Pakistan’s role should be examined through its participation, proposals, trade interests and bilateral political constraints. Regional cooperation is most useful where technical initiatives can continue despite diplomatic disagreement.'''),
          AcademyLessonSection('2. ECO and the connectivity agenda', '''The Economic Cooperation Organization traces its institutional roots to the Regional Cooperation for Development arrangement and was reconstituted in 1985 by Pakistan, Iran and Türkiye. Its expanded membership links South Asia, the Middle East and Central Asia. The organisation’s agenda includes transport, trade, energy, agriculture and communications. The challenge is to convert geographic potential into lower trade costs through functioning border procedures, finance, standards, infrastructure and political stability.'''),
          AcademyLessonSection('3. SCO and security-economic cooperation', '''The Shanghai Cooperation Organisation developed from the Shanghai Five and was established in 2001. Its agenda includes regional security, counterterrorism cooperation, political dialogue and economic connectivity. Pakistan became a full member in 2017. SCO membership offers diplomatic engagement with China, Russia and Central Asian states, but it does not create a collective defence guarantee or remove bilateral disputes among members.

A balanced answer assesses the organisation’s practical capacity, consensus rules, competing interests and limits. Participation is an opportunity for diplomacy, not an automatic solution to economic or security problems.'''),
          AcademyLessonSection('4. OIC, United Nations and multilateral diplomacy', '''The Organisation of Islamic Cooperation provides a platform for cooperation among Muslim-majority states and for raising issues including Palestine, Islamophobia, development and humanitarian crises. The United Nations provides universal multilateral forums, legal frameworks, peace and security institutions and specialised agencies. Pakistan’s diplomatic strategy combines bilateral engagement with coalition-building, peacekeeping participation and advocacy on issues of national and international concern.

Evaluate multilateral diplomacy by outcomes: agenda-setting, coalition support, resolutions, humanitarian access, trade and development cooperation, and implementation. A speech at a summit is not itself evidence of policy success.'''),
        ], keyTerms: ['SAARC', 'SAFTA', 'ECO', 'SCO', 'OIC', 'United Nations', 'Regional integration', 'Consensus diplomacy'], examQuestion: 'Why has regional cooperation in South Asia remained limited despite geographic and economic interdependence? Discuss Pakistan’s role in SAARC, ECO and SCO.', practiceTask: 'Prepare a comparative table for SAARC, ECO, SCO, OIC and the UN: founding context, membership, mandate, Pakistan’s role, achievements and constraints.')
      ]),
      AcademyChapter(number: '19', title: 'Pakistan’s relations with neighbours excluding India', syllabusLink: 'FPSC topic XXI: Pakistan’s Relations with Neighbors excluding India; China, Afghanistan, Iran and regional partners', lessons: [
        AcademyLesson(title: 'China, Afghanistan, Iran and extended neighbourhood', objectives: 'Assess Pakistan’s principal neighbouring relationships through security, trade, connectivity and diplomatic interests.', sections: [
          AcademyLessonSection('1. China: strategic partnership and economic cooperation', '''Pakistan-China relations developed from diplomatic recognition in 1951 into a close strategic partnership. Cooperation includes defence, diplomacy, infrastructure, energy, trade and multilateral coordination. The Karakoram Highway and the China-Pakistan Economic Corridor are central symbols of connectivity. CPEC’s long-term value depends on commercially sustainable projects, industrial productivity, reliable energy, local participation, security and transparent financing.

The relationship is strong but not free of policy challenges. Pakistan must improve its domestic investment climate, protect projects and workers, develop export capacity and ensure that infrastructure generates broad economic returns.'''),
          AcademyLessonSection('2. Afghanistan: border, security, refugees and trade', '''Pakistan and Afghanistan share historical, ethnic, commercial and security links, but relations have been strained by border demarcation disputes, militancy, refugee movements, political mistrust and competing regional interests. The Durand Line remains a source of political disagreement in Afghan discourse, while Pakistan regards it as the recognised international border. Cross-border armed groups and the security of border communities complicate relations.

Following the Taliban takeover in 2021, Pakistan expected improved border security, but that expectation did not resolve concerns about the Tehreek-e-Taliban Pakistan and other militant networks. Independent reporting in 2026 continued to describe serious tensions, border clashes and trade disruption. Candidates should separate official claims by each government from independently corroborated developments and humanitarian impacts.'''),
          AcademyLessonSection('3. Iran, Gulf states and the wider neighbourhood', '''Pakistan and Iran share a border, religious and cultural links, energy interests and overlapping security concerns. Their relationship requires border coordination, legal trade, regional diplomacy and careful management of external sanctions and strategic competition. Relations with Saudi Arabia, the United Arab Emirates, Qatar and other Gulf states involve remittances, energy, investment, employment and security cooperation.

Central Asian states offer opportunities in trade, energy and transit, but connectivity depends on Afghanistan’s stability, customs efficiency, infrastructure and predictable policy. Russia’s regional role has also grown in energy and diplomatic discussions. Pakistan should pursue diversified ties without assuming that every partner’s strategic interests align fully with its own.'''),
        ], keyTerms: ['China-Pakistan partnership', 'CPEC', 'Durand Line', 'TTP', 'Iran-Pakistan border', 'Gulf cooperation', 'Central Asia', 'Regional connectivity'], examQuestion: 'Evaluate Pakistan’s relations with China, Afghanistan and Iran. Which bilateral relationship presents the most complex mix of opportunities and risks?', practiceTask: 'Prepare three country briefs, each with historical context, present interests, key disputes, economic links and five realistic policy recommendations.')
      ]),
      AcademyChapter(number: '20', title: 'Pakistan and India relations since 1947', syllabusLink: 'FPSC topic XXII: Pakistan and India Relations Since 1947', lessons: [
        AcademyLesson(title: 'Conflict, diplomacy, trade and crisis management', objectives: 'Trace the main phases of bilateral relations and evaluate why recurrent crises have resisted settlement.', sections: [
          AcademyLessonSection('1. Partition, early disputes and wars', '''Partition in 1947 produced two independent states but left major disputes over princely states, assets, refugees, river waters and security. The first Kashmir war led to a UN-mediated ceasefire and the establishment of a ceasefire line in 1949. The 1965 war ended with the Tashkent Declaration in January 1966. The 1971 war resulted in the separation of East Pakistan and was followed by the Simla Agreement in July 1972, which established the Line of Control framework and committed both sides to peaceful settlement through agreed means.

These wars shaped military planning, threat perceptions and domestic politics. An analytical answer links battlefield outcomes with diplomatic settlements and the issues that remained unresolved.'''),
          AcademyLessonSection('2. Nuclearisation and peace initiatives', '''India’s 1974 nuclear test and the 1998 tests by both states changed the strategic environment. The Lahore Declaration of 1999 sought confidence-building and dialogue, but the Kargil conflict later that year damaged trust. Subsequent crises included the 2001–02 military standoff and the aftermath of the 2008 Mumbai attacks. Dialogue initiatives, composite dialogue and trade arrangements repeatedly struggled against security incidents and domestic political opposition.

Nuclear weapons can raise the cost of full-scale war, but they do not prevent limited conflict, terrorism, miscalculation or coercive signalling. Crisis communication and military restraint are therefore essential.'''),
          AcademyLessonSection('3. The 2019 and 2025 crises and the diplomatic record', '''In 2019, India revoked the special constitutional status of Jammu and Kashmir under Article 370 and reorganised the former state into union territories. Pakistan rejected the move and downgraded diplomatic engagement. In April and May 2025, a major crisis followed an attack in Indian-administered Kashmir and escalated into military strikes and cross-border hostilities. A ceasefire understanding was announced on 10 May 2025. India and Pakistan presented differing accounts of the events and responsibility; candidates should identify claims as claims and compare independent reporting with official statements.

By mid-2026, independent country reporting described relations as adversarial, with formal dialogue largely suspended and trade and visa restrictions remaining important features. The Indus Waters Treaty dispute further intensified bilateral tensions. A current answer should date its evidence and avoid treating a temporary ceasefire as a comprehensive peace settlement.'''),
          AcademyLessonSection('4. A framework for future relations', '''A durable relationship requires crisis communication, restraint, protection of civilians, restoration of diplomatic channels, trade and travel mechanisms, and credible processes to address long-standing disputes. Kashmir remains central to Pakistan’s stated position, while India emphasises security and its constitutional position. A sound analysis recognises that the two states have different legal and political narratives and that neither narrative alone describes the full diplomatic record.

Recommend confidence-building measures that are verifiable, reciprocal and resilient during crises. Economic and humanitarian links can reduce the costs of confrontation, but they cannot substitute for political agreement on core disputes.'''),
        ], keyTerms: ['Partition 1947', 'Tashkent Declaration', 'Simla Agreement', 'Lahore Declaration', 'Kargil', 'Nuclearisation', 'Article 370', 'Ceasefire 10 May 2025'], examQuestion: 'Analyse the recurring pattern of conflict and dialogue in Pakistan-India relations since 1947. What practical measures could reduce the risk of another crisis?', practiceTask: 'Construct a timeline of 1947, 1949, 1965–66, 1971–72, 1998–99, 2001–02, 2008, 2019 and 2025. For each, note trigger, military/diplomatic response and unresolved issue.')
      ]),
      AcademyChapter(number: '21', title: 'The Kashmir issue', syllabusLink: 'FPSC topic XXIII: The Kashmir Issue; historical, legal, diplomatic and human dimensions', lessons: [
        AcademyLesson(title: 'Origins, international framework and contemporary developments', objectives: 'Explain the origins of the Kashmir dispute and evaluate its international and human dimensions.', sections: [
          AcademyLessonSection('1. Accession and the first conflict', '''The princely state of Jammu and Kashmir had a Muslim-majority population and a Hindu ruler at the time of Partition. The ruler’s accession to India in October 1947 occurred amid armed conflict and competing claims. India and Pakistan then fought a war, and the issue reached the United Nations. The 1948–49 UN resolutions called for a ceasefire, withdrawal and a process for determining the state’s future, subject to specified conditions. Their implementation became contested and did not produce the proposed plebiscite.

A CSS answer should distinguish the accession question, the UN framework, the positions of India and Pakistan, and the political aspirations and rights of people living across the divided region.'''),
          AcademyLessonSection('2. UN resolutions, Simla Agreement and Line of Control', '''The UN Security Council resolutions of 1948 and 1949 established a framework involving ceasefire, demilitarisation and a plebiscite under conditions that the parties interpreted differently. The 1972 Simla Agreement committed India and Pakistan to resolving differences peacefully through bilateral negotiations or other mutually agreed peaceful means and redesignated the ceasefire line as the Line of Control. The 1999 Lahore Declaration and later confidence-building measures attempted to reduce tensions, but recurrent crises undermined progress.

In legal analysis, identify the instrument, its parties, operative language and subsequent practice. Do not claim that a resolution or agreement automatically settled all legal questions.'''),
          AcademyLessonSection('3. Post-2019 constitutional change and rights concerns', '''On 5 August 2019, India revoked the special constitutional status previously associated with Article 370 and reorganised Jammu and Kashmir into union territories. Pakistan rejected the measure and raised concerns internationally. The region has continued to experience political restrictions, security operations, human-rights allegations and competing claims over democratic representation. An evidence-based answer should attribute allegations to their sources, distinguish verified facts from disputed claims and recognise the experiences of civilians across the region.

The dispute is also connected to water, trade, military escalation and the nuclear security environment. The 2025 India-Pakistan crisis demonstrated how quickly events in Kashmir can trigger a broader bilateral confrontation.'''),
          AcademyLessonSection('4. Diplomatic options and a just peace', '''Options commonly discussed include sustained bilateral dialogue, confidence-building, cross-Line of Control arrangements, protection of civilian rights, accountability for abuses, humanitarian access and meaningful participation of affected communities. Any settlement would require political consent, credible implementation and guarantees against renewed violence. Pakistan’s diplomatic position should be explained accurately, while a scholarly answer should assess feasibility, reciprocal concerns and the limits of external mediation.

A balanced conclusion connects self-determination debates, security, human rights and regional stability rather than treating Kashmir only as a military or territorial question.'''),
        ], keyTerms: ['Princely state', 'Accession', 'UN Security Council', 'UN resolutions 1948–49', 'Simla Agreement', 'Line of Control', 'Article 370', 'Self-determination'], examQuestion: 'Critically examine the Kashmir dispute through its historical origins, UN framework, bilateral agreements and post-2019 developments.', practiceTask: 'Prepare a legal-diplomatic timeline and a one-page map of the divided region. Separate the positions of Pakistan, India, the UN framework and affected populations.')
      ]),
      AcademyChapter(number: '22', title: 'The Palestine issue', syllabusLink: 'FPSC topic X: The Palestine Issue; historical background, international law, diplomacy and Pakistan’s position', lessons: [
        AcademyLesson(title: 'Partition, occupation, self-determination and humanitarian law', objectives: 'Analyse the Palestine issue through historical milestones, international law and humanitarian consequences.', sections: [
          AcademyLessonSection('1. Historical background and the United Nations', '''The modern Palestine question developed under Ottoman rule, the British Mandate and competing national movements. The 1947 UN General Assembly Partition Plan proposed separate Arab and Jewish states with a special international status for Jerusalem. The 1948 war produced the establishment of Israel and the mass displacement of Palestinians known as the Nakba. The 1967 war brought the West Bank, East Jerusalem and Gaza under Israeli occupation, creating the central territorial and legal questions of the contemporary conflict.

A careful answer distinguishes the 1947 plan, subsequent wars, occupation, settlement expansion, refugee status and the positions of the parties. It should not collapse the history into a single event.'''),
          AcademyLessonSection('2. International law and diplomatic frameworks', '''Relevant international law includes the UN Charter, international humanitarian law, human-rights treaties and Security Council and General Assembly resolutions. The 1967 lines, the status of Jerusalem, settlements, borders, security, refugees and recognition remain central to negotiations. The Oslo process created interim arrangements and mutual recognition between Israel and the Palestine Liberation Organization, but it did not resolve final-status issues.

The International Court of Justice and other international bodies have addressed questions concerning occupation, obligations of states and humanitarian conditions. In exam writing, distinguish advisory opinions from binding contentious judgments, and separate legal findings from political statements.'''),
          AcademyLessonSection('3. Pakistan’s position and policy options', '''Pakistan has consistently supported Palestinian self-determination and a negotiated settlement consistent with relevant UN resolutions, commonly framed in terms of an independent Palestinian state with East Jerusalem as its capital. Pakistan’s position is expressed through diplomatic statements, multilateral forums and support for humanitarian relief. The wider OIC and UN processes provide platforms for coordination, although diplomatic resolutions do not by themselves end violence or occupation.

A strong answer considers humanitarian access, protection of civilians, accountability, reconstruction, political representation and the feasibility of a negotiated settlement. It should avoid dehumanising language and distinguish civilians from armed groups or governments.'''),
        ], keyTerms: ['British Mandate', 'UNGA Resolution 181', 'Nakba', '1967 war', 'Occupation', 'Oslo Accords', 'International humanitarian law', 'Two-state solution'], examQuestion: 'Discuss the Palestine issue as a question of self-determination, occupation and international law. Evaluate Pakistan’s diplomatic role.', practiceTask: 'Prepare a timeline from 1947 to the present and a short legal note distinguishing UN resolutions, ICJ proceedings and diplomatic proposals.')
      ]),
      AcademyChapter(number: '23', title: 'The war in Afghanistan since 1979 and its impact on Pakistan', syllabusLink: 'FPSC topic XXIV: The war in Afghanistan since 1979 and its impact on, and challenges to Pakistan in the post-2014 era', lessons: [
        AcademyLesson(title: 'Four decades of conflict and regional consequences', objectives: 'Trace the main phases of Afghanistan’s conflict and assess its effects on Pakistan’s security, economy and society.', sections: [
          AcademyLessonSection('1. Soviet intervention and the 1980s', '''The Soviet military intervention in Afghanistan began in December 1979. Afghan resistance groups fought the Soviet-backed government with assistance from several external actors, including the United States, Saudi Arabia and Pakistan. Pakistan became a frontline state, hosting millions of Afghan refugees and supporting the resistance. The conflict militarised parts of the border region, expanded weapons circulation and altered Pakistan’s strategic relationship with major powers.

A historical answer should distinguish Afghan political actors from outside sponsors and explain how the Cold War shaped decisions. The withdrawal of Soviet forces in 1989 did not bring peace; civil war and fragmentation followed.'''),
          AcademyLessonSection('2. Civil war, Taliban rule and the post-2001 intervention', '''After the Soviet withdrawal and the collapse of the Najibullah government, rival Afghan factions fought for power. The Taliban emerged in the 1990s and captured Kabul in 1996. Following the attacks of 11 September 2001, a US-led intervention removed the Taliban government and began a long international military and state-building effort. Pakistan became a major partner in the post-9/11 campaign while facing serious internal security consequences and cross-border militancy.

The period involved refugee flows, military operations, drone strikes, militant recruitment, economic disruption and contentious relations with Washington and Kabul. Avoid simplifying the conflict as a single war with one Afghan actor.'''),
          AcademyLessonSection('3. Withdrawal, 2021 transition and post-2014 challenges', '''NATO’s combat mission ended in 2014, but the Afghan conflict continued. The 2020 Doha Agreement set out a framework for the withdrawal of US forces and Taliban commitments; the Afghan government was not a party to the agreement in the same way as the United States and Taliban. The Taliban returned to power in August 2021 after the collapse of the former government and withdrawal of foreign forces.

Pakistan’s challenges include the TTP threat, border management, refugee protection, trade disruption, recognition questions, humanitarian conditions and regional competition. Independent reporting in October 2026 described repeated border tensions and disruption; candidates should check current developments through multiple reliable sources and identify whether claims are official, independent or disputed.'''),
          AcademyLessonSection('4. Policy lessons for Pakistan', '''A durable Afghan policy requires an understanding of Afghan sovereignty, political diversity, border communities, trade, counterterrorism, refugee rights and regional diplomacy. Military tools may address immediate threats but cannot substitute for political arrangements and economic opportunity. Pakistan should coordinate border security with legal trade, dialogue, intelligence cooperation, refugee management and regional engagement. A balanced answer evaluates past policy choices and acknowledges unintended consequences.'''),
        ], keyTerms: ['Soviet intervention 1979', 'Afghan resistance', 'Afghan refugees', 'Taliban', '9/11', 'NATO mission 2014', 'Doha Agreement', 'TTP'], examQuestion: 'Evaluate the impact of the Afghan war since 1979 on Pakistan. What lessons should guide Pakistan’s policy after 2014 and the 2021 political transition?', practiceTask: 'Prepare a four-period timeline: 1979–1989, 1989–2001, 2001–2014, 2014–present. For each period, assess security, refugees, economy, diplomacy and border management.')
      ]),
      AcademyChapter(number: '24', title: 'Pakistan, the United States and the War on Terror', syllabusLink: 'FPSC topic XIII: Pakistan and US War on Terror; topic XIV: Foreign Policy of Pakistan Post 9/11', lessons: [
        AcademyLesson(title: 'Alliance, counterterrorism and strategic divergence after 2001', objectives: 'Evaluate Pakistan-US cooperation and tensions in the post-9/11 period and assess the domestic consequences of counterterrorism policy.', sections: [
          AcademyLessonSection('1. The post-9/11 strategic shift', '''After the attacks of 11 September 2001, the United States launched military operations in Afghanistan and sought international cooperation against al-Qaeda and the Taliban. Pakistan became a frontline partner and provided logistical, intelligence and security cooperation. The relationship produced diplomatic and economic support but also pressure, mistrust and competing expectations about Afghanistan and militant networks.

The alliance was transactional as well as strategic. US priorities focused on defeating terrorist networks and stabilising Afghanistan; Pakistan also considered border security, India, refugees, domestic political stability and its own strategic autonomy. These priorities sometimes converged and sometimes conflicted.'''),
          AcademyLessonSection('2. Domestic costs and the evolution of counterterrorism', '''Pakistan experienced militant attacks, suicide bombings, displacement, military operations, damage to infrastructure, losses among civilians and security personnel, and pressure on investment and public confidence. The former tribal areas became central to counterterrorism operations and debates about state authority, local rights and political representation. The National Action Plan adopted in 2014 set out a wide-ranging framework against terrorism and extremism, but implementation varied across institutions and policy areas.

A sound assessment recognises both the security rationale for lawful operations and the need for due process, civilian protection, rehabilitation, reconstruction and accountability.'''),
          AcademyLessonSection('3. Drone strikes, strategic trust and withdrawal', '''US drone strikes in Pakistan’s border regions became a major source of legal, political and public controversy. Supporters described them as counterterrorism tools; critics raised questions about sovereignty, civilian casualties, transparency and the long-term effects of remote strikes. The US decision to withdraw from Afghanistan in 2021 changed the basis of bilateral cooperation and reduced the centrality of the Afghan campaign, while issues such as counterterrorism, nuclear security, trade, technology and regional stability remained.

Avoid describing the relationship as either a permanent alliance or permanent hostility. It has repeatedly shifted with regional priorities and domestic politics.'''),
          AcademyLessonSection('4. Post-9/11 foreign policy: interests and diversification', '''Pakistan’s post-9/11 foreign policy has involved balancing security cooperation with sovereignty, maintaining ties with China and Gulf partners, managing relations with Afghanistan and Iran, and engaging multilateral institutions. A foreign policy strategy should define national interests, assess capabilities, identify risks and choose instruments—diplomacy, trade, defence cooperation, legal processes and public communication.

The lesson for future policy is to avoid overdependence on a single external partner and to strengthen domestic economic resilience. A diversified relationship with the United States can include education, investment, technology, climate and trade as well as security dialogue.'''),
        ], keyTerms: ['9/11', 'War on Terror', 'Frontline state', 'Drone strikes', 'National Action Plan', 'Sovereignty', 'Strategic divergence', 'Foreign-policy diversification'], examQuestion: 'Was Pakistan’s partnership with the United States after 9/11 a strategic necessity or a source of long-term instability? Present a balanced analysis.', practiceTask: 'Write a policy evaluation with four headings: security gains, domestic costs, sovereignty concerns and future bilateral options. Support each heading with dated evidence.')
      ]),
      AcademyChapter(number: '25', title: 'Non-state actors, non-traditional security and proxy wars', syllabusLink: 'FPSC topic VIII: Non-Traditional Security Threats in Pakistan: Role of Non-State Actors; topic XXV: Proxy Wars: Role of External Elements', lessons: [
        AcademyLesson(title: 'Militancy, terrorism, hybrid threats and regional competition', objectives: 'Distinguish non-state actors and proxy conflict and evaluate a rights-respecting response to non-traditional security threats.', sections: [
          AcademyLessonSection('1. Non-state actors and threat categories', '''Non-state actors include armed organisations, criminal networks, private groups, charities, firms, civil-society organisations and digital communities. They are not all security threats. A threat arises when an actor uses violence, coercion, illicit finance, intimidation or unlawful interference to undermine public safety or constitutional authority. Non-traditional security also includes cyberattacks, disinformation, organised crime, trafficking, climate disasters, pandemics and resource insecurity.

A precise answer identifies the actor, capability, target, motive, financing and relationship with state institutions. Avoid treating an entire ethnic, religious or regional community as responsible for the conduct of an armed organisation.'''),
          AcademyLessonSection('2. Proxy conflict and external involvement', '''A proxy conflict occurs when external powers support local actors to influence a conflict while avoiding or limiting direct confrontation. Support can include finance, weapons, training, intelligence, sanctuary, political backing or media assistance. Proxy relationships vary in control: a sponsor may influence an actor without commanding every decision. Local causes and agency remain important, so it is inaccurate to explain every insurgency solely through foreign sponsorship.

In Pakistan’s regional environment, allegations of external support for militant or separatist groups are politically sensitive and often disputed. Candidates must identify who makes an allegation, what evidence is publicly available, what has been independently verified and what remains contested. State attribution under international law requires careful analysis.'''),
          AcademyLessonSection('3. Drivers of recruitment and resilience', '''Recruitment into armed networks may be facilitated by conflict, grievance, exclusion, coercion, criminal opportunity, ideological mobilisation, weak governance, online propaganda and cross-border sanctuary. No single factor explains every group. Prevention combines lawful policing, intelligence, financial investigation, education, local services, rehabilitation, community trust and protection of vulnerable populations.

Resilience also depends on secure digital systems, reliable public information, disaster preparedness, energy and water security, and functioning local institutions. A narrow security response may suppress symptoms while leaving structural vulnerabilities unchanged.'''),
          AcademyLessonSection('4. Legal and institutional response', '''Counterterrorism should be lawful, evidence-led and subject to oversight. Relevant tools include criminal investigation, prosecution, financial controls, border management, intelligence cooperation, protection of witnesses, judicial review and parliamentary scrutiny. Human rights and due process are not obstacles to security; they improve legitimacy and reduce the risk of arbitrary action or wrongful detention.

A balanced CSS conclusion proposes a whole-of-government response while distinguishing terrorism, insurgency, organised crime, peaceful protest and legitimate political dissent.'''),
        ], keyTerms: ['Non-state actor', 'Proxy conflict', 'State attribution', 'Hybrid threat', 'Disinformation', 'Illicit finance', 'Radicalisation', 'Due process'], examQuestion: 'Critically assess the role of non-state actors and external elements in Pakistan’s security environment. How can the state respond without undermining constitutional rights?', practiceTask: 'Build a threat-assessment table separating actor, threat type, evidence, affected population, lawful response and prevention measure.')
      ]),
      AcademyChapter(number: '26', title: 'Pakistan’s national interest and challenges to sovereignty', syllabusLink: 'FPSC topic XVIII: Pakistan’s National Interest; topic XIX: Challenges to Sovereignty', lessons: [
        AcademyLesson(title: 'Defining national interest in an interdependent world', objectives: 'Use a clear analytical framework to distinguish core national interests, instruments of state power and contemporary sovereignty challenges.', sections: [
          AcademyLessonSection('1. National interest: meaning and hierarchy', '''National interest refers to the objectives a state seeks to protect or advance. Core interests commonly include territorial integrity, political independence, public safety, constitutional order and economic viability. Other interests include prosperity, access to markets and resources, international reputation, technological capability and protection of citizens abroad. Interests may conflict, so policymakers must prioritise them and explain the costs of choices.

The concept should not be used as a slogan that automatically justifies any policy. A defensible analysis specifies whose security is being protected, what evidence supports the threat assessment, which legal limits apply and what alternatives exist.'''),
          AcademyLessonSection('2. Sovereignty: legal authority and practical capacity', '''Sovereignty has an internal dimension—the state’s authority over its territory and institutions—and an external dimension—its independence and legal equality in international relations. In practice, sovereignty is affected by treaties, international law, global finance, supply chains, technology platforms, climate change and cross-border risks. Interdependence does not automatically eliminate sovereignty, but weak domestic capacity can reduce the range of available choices.

Distinguish territorial violation, coercive diplomacy, treaty obligations, economic dependence and voluntary international cooperation. Each raises different legal and policy questions.'''),
          AcademyLessonSection('3. Contemporary challenges', '''Challenges may include border insecurity, terrorism, cyberattacks, foreign disinformation, debt vulnerability, external financing conditions, sanctions exposure, water stress, climate disasters, energy dependence and transnational crime. Digital sovereignty involves control of sensitive data, cyber infrastructure, secure networks and the ability to regulate technology while protecting rights and innovation.

A practical sovereignty strategy strengthens domestic institutions, revenue capacity, technological skills, energy security, export competitiveness, disaster resilience and lawful diplomacy. Self-reliance should mean greater productive capability, not isolation from trade or cooperation.'''),
        ], keyTerms: ['National interest', 'Territorial integrity', 'Internal sovereignty', 'External sovereignty', 'Interdependence', 'Economic security', 'Digital sovereignty', 'Strategic autonomy'], examQuestion: 'How has global interdependence changed the meaning of sovereignty for Pakistan? Discuss economic, technological, security and environmental dimensions.', practiceTask: 'Rank five national interests and explain one policy trade-off for each. Then identify a sovereignty risk and a capability-building response.')
      ]),
      AcademyChapter(number: '27', title: 'Economic conditions, Economic Survey and federal budgets', syllabusLink: 'FPSC topic XXVI: Economic Conditions of Pakistan, the Most Recent Economic Survey, Previous and Current Budgets, and Problems and Performance of Major Sectors', lessons: [
        AcademyLesson(title: 'Reading Pakistan’s economy through official evidence', objectives: 'Interpret the Economic Survey and federal budget and evaluate the performance of major economic sectors without confusing targets, estimates and outcomes.', sections: [
          AcademyLessonSection('1. How to read the Economic Survey', '''The Pakistan Economic Survey is an official annual review of the economy. It typically reports growth and investment, agriculture, manufacturing and mining, fiscal development, money and credit, capital markets, inflation, trade and payments, public debt, education, health, labour and employment, transport, energy, information technology, social protection and climate change. Candidates should read the overview and then compare sector chapters with the statistical supplement.

For each figure, record the fiscal year, unit, source, whether it is provisional or revised, and the comparison period. A growth rate may be nominal or real; a budget estimate is not an audited result; a percentage of GDP cannot be compared directly with a currency amount. Explain what the indicator measures before drawing conclusions.'''),
          AcademyLessonSection('2. How to read the federal budget', '''The budget sets out expected revenue, expenditure, borrowing and development priorities. The Budget in Brief summarises the fiscal framework; the Annual Budget Statement records the government’s estimated receipts and expenditure; demands for grants provide functional and ministry-level detail. The budget speech explains policy intentions, while the Finance Bill proposes tax and legal changes that must be read with enacted legislation.

Compare budget estimates with revised estimates and actual outcomes. Examine tax revenue, non-tax revenue, provincial transfers, interest payments, defence, subsidies, social spending and the Public Sector Development Programme. A headline allocation does not prove that funds were released, spent efficiently or translated into service outcomes.'''),
          AcademyLessonSection('3. Major sectors and structural performance', '''Agriculture should be assessed through crop and livestock output, productivity, water use, input costs, research and rural incomes. Manufacturing and mining should be assessed through capacity utilisation, value addition, energy costs, technology, exports and employment. Services include finance, trade, transport, communications and public services; their productivity and formalisation matter for growth. External-sector performance includes exports, imports, remittances, foreign investment, reserves and the current account.

Use multiple years to identify whether a change is structural or temporary. A single strong harvest or commodity-price movement should not be mistaken for a permanent productivity gain.'''),
          AcademyLessonSection('4. Current official reference set for CE-2027', '''For the current preparation cycle, the Finance Division has published the Pakistan Economic Survey 2025–26 and the Federal Budget 2026–27. Its official survey portal provides chapters on growth, agriculture, manufacturing and mining, fiscal development, money and credit, inflation, trade and payments, public debt, education, health, energy, IT, social protection and climate change. The budget portal includes the Finance Minister’s speech, Budget in Brief and Annual Budget Statement.

The IMF statement dated 7 October 2026 reported an estimated 3.6 percent real GDP growth for FY26 and described the FY27 budget as anchored by an underlying primary surplus of 2.0 percent of GDP. The same statement discussed fiscal, energy and social-spending reforms. Treat these as IMF estimates and programme benchmarks, not independently audited final results. Recheck all figures before the examination using finance.gov.pk/survey_2026.html, finance.gov.pk/fb_2026_27.html and the relevant IMF country documents.'''),
        ], keyTerms: ['Economic Survey', 'Budget in Brief', 'Annual Budget Statement', 'Fiscal deficit', 'Primary surplus', 'Revised estimate', 'Sectoral productivity', 'Current account'], examQuestion: 'How should Pakistan balance macroeconomic stabilisation with growth, employment and human development? Use the latest Economic Survey and Budget as evidence.', practiceTask: 'Prepare a 1,000-word economic brief from official FY2025–26 and FY2026–27 documents. Include a data table, three structural constraints, a sector comparison and five measurable policy proposals.')
      ]),
      AcademyChapter(number: '28', title: 'Recent constitutional and legal debates and the role of higher courts', syllabusLink: 'FPSC topic XXVII: Recent Constitutional and Legal Debates, Latest Constitutional Amendments, Important Legislations, Legal Cases and Role of Higher Courts', lessons: [
        AcademyLesson(title: 'Constitutional supremacy, judicial review and recent amendments', objectives: 'Understand Pakistan’s constitutional institutions and analyse major amendments and legal debates using the enacted text.', sections: [
          AcademyLessonSection('1. Constitutional structure and judicial review', '''The Constitution is the supreme legal framework governing the federation, Parliament, executive, courts, provinces and fundamental rights. The superior judiciary interprets the Constitution, reviews public action within its jurisdiction and resolves legal disputes. Judicial independence, transparent appointments, fair procedure, institutional accountability and compliance with judgments are all central to the rule of law.

A legal answer must distinguish constitutional text, ordinary legislation, executive action, judicial interpretation and political convention. It should identify the relevant article and explain the legal issue rather than relying on general claims about courts or governments.'''),
          AcademyLessonSection('2. Twenty-sixth Amendment 2024', '''The Constitution (Twenty-sixth Amendment) Act 2024 introduced important changes concerning constitutional benches, judicial appointments and the process for appointing the Chief Justice of Pakistan, among other provisions. It altered the composition and role of the Judicial Commission and provided for constitutional benches within the superior courts. The reform generated debate about judicial independence, democratic accountability, separation of powers and the balance between Parliament and the judiciary.

Candidates should read the Gazette text, identify the exact articles amended and distinguish the enacted provisions from arguments made for or against the amendment. Avoid reducing a complex amendment to a single political interpretation.'''),
          AcademyLessonSection('3. Twenty-seventh Amendment 2025 and the Federal Constitutional Court', '''The Constitution (Twenty-seventh Amendment) Act 2025 received presidential assent on 13 November 2025 and came into force at once. It inserted a new constitutional chapter establishing the Federal Constitutional Court of Pakistan and provided for its composition, appointments, jurisdiction and judicial administration. The Gazette text provides for equal numbers of judges from each province and at least one judge from the Islamabad High Court. It assigns the Federal Constitutional Court important original and appellate constitutional jurisdiction, including specified inter-governmental disputes and constitutional interpretation matters.

The amendment also changed provisions concerning the Judicial Commission and the relationship between the new court and the Supreme Court. Its institutional implications should be explained through the Gazette text, not through social-media summaries. The constitutional debate concerns access to constitutional justice, judicial independence, federal representation, separation of powers and continuity of pending cases.'''),
          AcademyLessonSection('4. How to analyse a legal case or amendment', '''For a constitutional amendment, identify the date, Act number, articles changed, new institution or procedure, transition provisions and practical effect. For a court case, identify material facts, issue, legal rule, reasoning, holding and remedy. Separate the ratio decidendi from obiter observations. Explain whether a judgment interprets a statute, reviews executive action, enforces a fundamental right or settles a federal dispute.

Primary references include the Gazette of Pakistan for the Twenty-seventh Amendment, the official text of the Twenty-sixth Amendment, National Assembly and Senate legislation records, and published judgments of the Supreme Court, Federal Constitutional Court and High Courts. Update case law immediately before the examination because constitutional litigation and legislation continue to develop.'''),
        ], keyTerms: ['Constitutional supremacy', 'Judicial review', 'Twenty-sixth Amendment', 'Twenty-seventh Amendment', 'Federal Constitutional Court', 'Judicial Commission', 'Ratio decidendi', 'Separation of powers'], examQuestion: 'Critically evaluate the institutional impact of the Twenty-sixth and Twenty-seventh Constitutional Amendments on judicial structure and constitutional adjudication in Pakistan.', practiceTask: 'Make a provision-by-provision summary of the Twenty-seventh Amendment from the official Gazette. Compare the original text, amended provision, institutional effect and major constitutional debate.')
      ]),
      AcademyChapter(number: '29', title: 'Prevailing social problems: poverty, education, health and sanitation', syllabusLink: 'FPSC topic XXVIII: Prevailing Social Problems of Pakistan and Strategies to Deal with Them; Poverty, Education, Health and Sanitation', lessons: [
        AcademyLesson(title: 'Human development, inequality and social policy', objectives: 'Diagnose major social challenges and evaluate strategies through evidence, institutions and measurable outcomes.', sections: [
          AcademyLessonSection('1. Poverty, inequality and social protection', '''Poverty is multidimensional. Income poverty concerns inadequate command over resources, while multidimensional poverty also includes deprivation in education, health, housing, nutrition, water and living standards. Inequality can be horizontal—between regions or groups—as well as vertical across income levels. Inflation, unemployment, low productivity, insecure work, climate shocks and weak public services can reinforce poverty.

Effective policy combines productive employment, quality education, primary healthcare, targeted cash transfers, nutrition, affordable housing, social insurance and local economic development. Cash assistance can protect consumption, but it cannot replace jobs, public services or long-term capability building. Evaluate programmes through targeting accuracy, coverage, adequacy, administrative cost and measurable effects on household welfare.'''),
          AcademyLessonSection('2. Education access and learning quality', '''Pakistan’s education challenges include out-of-school children, uneven enrolment and completion, gender and rural-urban gaps, inadequate facilities, teacher deployment, learning outcomes, language of instruction, technical skills and access to higher education. Enrolment is not the same as learning. A child may attend school but fail to acquire literacy, numeracy and problem-solving skills.

Solutions require reliable school data, early childhood education, teacher training and support, safe facilities, relevant curricula, assessment reform, technical and vocational pathways, inclusion of children with disabilities and predictable funding. Federal and provincial responsibilities should be mapped clearly after devolution, while national coordination remains important for standards and data.'''),
          AcademyLessonSection('3. Health, nutrition and population', '''Health outcomes depend on primary care, immunisation, maternal and child health, nutrition, disease surveillance, clean water, sanitation, trained staff and affordable medicines. Preventive services usually deliver wider population benefits than a system focused only on expensive tertiary hospitals. Public health planning must consider urban crowding, rural access, non-communicable diseases, infectious disease outbreaks and climate-related health risks.

Population growth and rapid urbanisation increase demand for schools, jobs, housing and health services. Reproductive health, women’s education, child nutrition and voluntary access to family-planning services can improve household wellbeing and human capital. Policy must respect dignity, access and informed choice.'''),
          AcademyLessonSection('4. Water, sanitation and local service delivery', '''Unsafe drinking water and inadequate sanitation contribute to diarrhoeal disease, environmental contamination and lost educational and economic opportunity. Effective sanitation requires the full service chain: safe toilets, containment, emptying, transport, treatment and disposal or reuse. Water supply requires source protection, treatment, reliable distribution, testing and maintenance. Infrastructure without operations and accountability soon deteriorates.

Local governments, provincial departments, utilities, schools and health facilities must coordinate. Performance indicators should include access, reliability, water quality, safely managed sanitation, disease incidence, learning outcomes and equity across income and geographic groups.'''),
          AcademyLessonSection('5. Turning social diagnosis into policy', '''A useful policy proposal begins with a clearly defined problem and baseline evidence. It identifies the target population, responsible institutions, budget source, delivery mechanism, risks and time-bound outcomes. Equity analysis asks who benefits and who may be excluded. Monitoring tracks implementation; evaluation tests whether the intervention caused improvement. Disaggregate indicators by province, district, sex, age, disability and income where reliable data exist.

The Pakistan Economic Survey 2025–26 includes separate chapters on education, health and nutrition, population and labour, social protection and related indicators. Use those official tables for updated figures and state the year and definition of every statistic.'''),
        ], keyTerms: ['Multidimensional poverty', 'Horizontal inequality', 'Social protection', 'Out-of-school children', 'Learning outcomes', 'Primary healthcare', 'WASH', 'Policy evaluation'], examQuestion: 'Why have improvements in economic growth not automatically translated into adequate human development in Pakistan? Discuss education, health, poverty and sanitation together.', practiceTask: 'Prepare a district-level social development plan with four outcomes: poverty reduction, learning, primary healthcare and safe sanitation. Specify baseline indicators, agencies, budget logic and evaluation methods.')
      ]),

      AcademyChapter(number: '30', title: 'Past-paper integration and examiner-standard answer writing', syllabusLink: 'Supplementary academy workshop: use authentic FPSC papers, connect questions to the syllabus and write analytical, evidence-led answers', lessons: [
        AcademyLesson(title: 'How to decode a Pakistan Affairs question', objectives: 'Identify the demand, time period, scope and command word in a question before planning an answer.', sections: [
          AcademyLessonSection('1. Command words and question demand', '''The command word tells you what the examiner expects. “Explain” requires a clear account of how or why something happened. “Discuss” requires a structured examination of major arguments and evidence. “Critically examine” requires analysis, limitations, counterarguments and a reasoned judgement. “Evaluate” requires criteria and a conclusion about relative importance or effectiveness. “Compare” requires explicit similarities and differences, not two disconnected descriptions.

Underline the topic, time period, geographical scope and command word. A question about political evolution since 1971 should not become a general history of the entire Pakistan Movement. A question about the Indus Waters Treaty requires treaty provisions and water governance, not only a list of dams.'''),
          AcademyLessonSection('2. Build a thesis before writing', '''A thesis is the central judgement that answers the question. It should be specific enough to guide the essay and balanced enough to accommodate evidence. For example: “Pakistan’s water insecurity is produced by both transboundary uncertainty and domestic weaknesses in allocation, storage, irrigation efficiency and groundwater governance.” This is stronger than saying “water is a major problem.”

Use a logical structure: define the issue; establish the historical or constitutional context; identify causes and institutions; analyse evidence; examine counterarguments; evaluate policy options; and conclude with a judgement. Every heading should help answer the question, not merely display information.'''),
          AcademyLessonSection('3. Evidence, maps and chronology', '''Evidence can include constitutional articles, enacted laws, dates of agreements, official statistics, historical documents, court judgments, maps and credible research. State the source and year of a statistic. Distinguish an estimate from a final outcome and a government claim from independently verified evidence. Never invent quotations, percentages or legal holdings.

Use maps for geography, rivers, ports, borders and regional connectivity. Use timelines for constitutional development, wars, agreements and political transitions. Visual material should be labelled and directly relevant to the question; a map without analytical explanation earns little value.'''),
          AcademyLessonSection('4. A disciplined conclusion', '''The conclusion should answer the question directly and follow from the evidence already presented. It should not introduce a new topic or repeat the introduction. State which factors were most important, why proposed reforms are feasible and what trade-offs remain. Avoid absolute language where evidence is contested or incomplete.'''),
        ], keyTerms: ['Command word', 'Thesis', 'Causal analysis', 'Counterargument', 'Primary source', 'Evidence hierarchy', 'Chronology', 'Evaluative conclusion'], examQuestion: 'Why do descriptive answers often fail to secure high marks in Pakistan Affairs? Explain how analysis, evidence and judgement improve answer quality.', practiceTask: 'Take any one Pakistan Affairs past-paper question. Mark its command word, scope and time period; write a one-sentence thesis; prepare six analytical headings and a two-sentence conclusion.')
      ]),
      AcademyChapter(number: '31', title: 'Model answer frameworks for recurring Pakistan Affairs themes', syllabusLink: 'Supplementary academy workshop: model outlines for constitutional, economic, foreign-policy and security questions', lessons: [
        AcademyLesson(title: 'Three worked answer plans and a marking checklist', objectives: 'Convert broad Pakistan Affairs topics into coherent arguments supported by legal, historical and economic evidence.', sections: [
          AcademyLessonSection('1. Model plan: federalism and national integration', '''Question: “Can federalism strengthen national integration in Pakistan?”

Thesis: Federalism can accommodate diversity and improve legitimacy, but its success depends on meaningful provincial authority, predictable finance, effective local government and protection of equal citizenship.

Suggested structure:
1. Define federalism and national integration.
2. Briefly trace the constitutional evolution from the 1956 and 1962 systems to the 1973 Constitution.
3. Explain provincial representation through the Senate and intergovernmental coordination through the Council of Common Interests.
4. Analyse the Eighteenth Amendment and the National Finance Commission framework.
5. Discuss implementation challenges: administrative capacity, fiscal autonomy, resource disputes and regional grievances.
6. Evaluate local government, political dialogue and rights protection as complementary mechanisms.
7. Conclude that federalism is a framework, not an automatic solution; institutional performance determines its integrative effect.

Evidence to verify: Articles 153 and 160; Eighteenth Amendment text; Twenty-fifth Amendment; current provincial fiscal and service-delivery data.'''),
          AcademyLessonSection('2. Model plan: economic stabilisation and inclusive growth', '''Question: “Why has macroeconomic stabilisation not automatically delivered inclusive growth in Pakistan?”

Thesis: Stabilisation can reduce immediate external and fiscal pressures, but durable welfare gains require productivity growth, export diversification, fair taxation, investment, human development and reliable energy.

Suggested structure:
1. Define stabilisation and inclusive growth.
2. Explain the fiscal, external and inflationary pressures that drive repeated adjustment.
3. Analyse low productivity, narrow exports, tax exemptions, energy costs and public debt servicing.
4. Compare the performance of agriculture, manufacturing, services and IT using the latest Economic Survey.
5. Assess the FY2026–27 budget priorities and the IMF programme’s stated targets, clearly labelling estimates and conditions.
6. Examine distributional effects on households, firms, employment and public services.
7. Propose measurable reforms in tax administration, skills, competition, energy efficiency, social protection and export capability.

Evidence to verify: Pakistan Economic Survey 2025–26; Federal Budget 2026–27; IMF statement of 7 October 2026; SBP and PBS releases. Do not use an old GDP, inflation or debt figure without its fiscal year.'''),
          AcademyLessonSection('3. Model plan: India, Kashmir and regional stability', '''Question: “How does the Kashmir dispute shape Pakistan-India relations and regional security?”

Thesis: Kashmir remains a central dispute, but bilateral instability also reflects competing security perceptions, limited dialogue, terrorism allegations, water tensions, domestic politics and the risks of military escalation between nuclear-armed states.

Suggested structure:
1. Explain the 1947 origins and the UN framework.
2. Analyse the 1965 and 1971 wars, Tashkent and the Simla Agreement.
3. Discuss nuclearisation, Lahore 1999, Kargil and later crisis cycles.
4. Explain the 2019 constitutional changes in Indian-administered Jammu and Kashmir and the competing legal-political positions.
5. Analyse the 2025 military crisis and the 10 May ceasefire; distinguish each government’s account from independent reporting.
6. Link the Indus Waters Treaty dispute to wider trust and security concerns.
7. Evaluate crisis hotlines, restraint, rights protection, trade and sustained diplomacy as risk-reduction measures.

Evidence to verify: UN resolutions; Simla Agreement; official statements from both states; independent reporting; Permanent Court of Arbitration records on the Indus Waters Treaty.'''),
          AcademyLessonSection('4. Examiner’s self-assessment checklist', '''Before submitting an answer, check: Did I answer the exact question? Is my thesis visible in the introduction? Does every heading advance the argument? Have I used accurate dates, laws and data? Have I distinguished fact from claim? Have I included at least one counterargument or limitation? Are recommendations feasible and linked to diagnosed causes? Does the conclusion make a clear judgement?

A high-quality answer is relevant, accurate, analytical, balanced and readable. More facts do not compensate for a weak argument, and decorative quotations do not replace evidence.'''),
        ], keyTerms: ['Model outline', 'Federalism', 'Inclusive growth', 'Stabilisation', 'Kashmir dispute', 'Crisis management', 'Source verification', 'Examiner checklist'], examQuestion: 'Using one of the model themes, write a balanced answer that contains a thesis, evidence, counterargument, policy recommendations and a reasoned conclusion.', practiceTask: 'Write one full timed answer from the three frameworks. Then annotate it against the eight-point examiner checklist and rewrite the weakest paragraph.')
      ]),

      AcademyChapter(number: '32', title: 'Official past-paper map: CSS CE-2023 Pakistan Affairs', syllabusLink: 'Source: Federal Public Service Commission, Competitive Examination 2023, General Knowledge-III (Pakistan Affairs)', lessons: [
        AcademyLesson(title: 'Understand the paper and connect every question to the course', objectives: 'Use an authentic FPSC paper to identify the examination format, syllabus coverage and the analytical work required by each question.', sections: [
          AcademyLessonSection('1. Official paper structure', '''The FPSC CE-2023 Pakistan Affairs paper allowed three hours. Part I contained objective MCQs worth 20 marks, with a maximum of 30 minutes. Part II carried 80 marks. Candidates were instructed to attempt only four questions from Part II; all carried equal marks of 20. The paper therefore tested breadth through the objective section and depth through four selected analytical answers.

Before attempting any official paper, read its instructions carefully. The number of questions, marks, time and permitted attempts can differ between papers or examination cycles. Do not assume the structure remains unchanged without checking the paper itself.

Official source: https://www.fpsc.gov.pk/assets/media/2024-06-13-GK3-%28Pakistan-Affairs%29.pdf'''),
          AcademyLessonSection('2. CE-2023 question themes and course mapping', '''Q2 — Jinnah’s leadership during the 1937–1947 decade. Course linkage: Chapter 01 (Iqbal and Jinnah), Chapter 02 (Simla Deputation and Muslim League), Chapter 03 (constitutional negotiations) and Chapter 04 (1935–1947). Answer approach: explain the change in political strategy, party organisation, constitutional negotiation, provincial politics, wartime diplomacy and the interaction between leadership and mass mobilisation.

Q3 — causes of agricultural decline and food imports. Course linkage: Chapter 07 (land, people, agriculture and natural resources), Chapter 08 (economic and water constraints) and the additional lesson on population, resources and agricultural productivity. Answer approach: distinguish land and water constraints from productivity, input, research, storage, market and policy failures.

Q4 — obstacles to industrial development. Course linkage: Chapter 07 (industry and resources), Chapter 08 (macroeconomic and energy constraints) and Chapter 27 (economic conditions and sector performance). Answer approach: connect energy reliability, cost of finance, technology, skills, logistics, taxation, competition, export sophistication and policy predictability.

Q5 — evolution of democracy in Pakistan. Course linkage: Chapter 13 (political evolution since 1971) and Chapter 14 (democratic system). Answer approach: compare constitutional periods, military interventions, elections, parliamentary continuity, judicial and electoral institutions, local government and civilian accountability.

Q6 — short- and long-term effects of joining the US-led War on Terror. Course linkage: Chapter 23 (Afghanistan since 1979), Chapter 24 (Pakistan-US relations and War on Terror) and Chapter 25 (non-state actors and security threats). Answer approach: assess security cooperation, internal militancy, displacement, economic cost, sovereignty debates, civilian harm, diplomacy and the post-2021 security environment.

Q7 — Pakistan’s crossroads location, geostrategic importance and challenges. Course linkage: Chapter 07 (physical geography), Chapter 17 (changing regional apparatus), Chapter 18 (regional organisations) and Chapter 19 (neighbours excluding India). Answer approach: explain access to the Arabian Sea, proximity to the Gulf and Central Asia, China connectivity, regional trade routes, border insecurity and the difference between geographic potential and realised economic benefit.

Q8 — youth bulge and sustainable economic development. Course linkage: Chapter 07 (population, society and education), Chapter 27 (growth and sector performance) and Chapter 29 (poverty, education, health and sanitation). Answer approach: connect demographic structure to foundational learning, technical skills, women’s participation, productive jobs, entrepreneurship, health, urban planning and export competitiveness.'''),
          AcademyLessonSection('3. What this paper tells a candidate about preparation', '''The seven subjective themes span political leadership, agriculture, industry, democracy, foreign policy and security, geography and demography. This is a useful demonstration of why Pakistan Affairs cannot be prepared as a narrow chronology of the Pakistan Movement. Strong candidates connect history to contemporary public policy and support arguments with evidence.

For each theme, prepare a two-page topic sheet: definition and context; key dates or constitutional provisions; causes and consequences; a Pakistan-specific example; one counterargument; three feasible recommendations; and a balanced conclusion. Practise writing four answers in the time available, not merely reading model notes.'''),
          AcademyLessonSection('4. CE-2024, CE-2025 and CE-2026 papers', '''FPSC’s Previous Question Papers — CSS archive lists the Pakistan Affairs paper under the General Knowledge-III / GK3 (Pakistan Affairs) label for multiple examination years, including CE-2023, CE-2024, CE-2025 and CE-2026. The app links to the official archive rather than reproducing third-party transcriptions. Open the relevant examination year, select GK3 / Pakistan Affairs, download the original paper and record its exact question wording before attempting it.

Archive: https://www.fpsc.gov.pk/Schedule?section=Previous+Question+Papers%2FCSS

This course currently provides a verified theme map for CE-2023. It does not claim to have transcribed or categorised every question from the CE-2024, CE-2025 or CE-2026 papers. Add those mappings only after checking each original FPSC PDF.'''),
        ], keyTerms: ['FPSC CE-2023', 'GK-III Pakistan Affairs', 'Question selection', 'Question mapping', 'Jinnah 1937–1947', 'Agricultural productivity', 'Industrialisation', 'Demographic dividend'], examQuestion: 'Using the CE-2023 paper, explain how Pakistan Affairs questions connect historical foundations with contemporary economic, political and security challenges.', practiceTask: 'Open the official CE-2023 paper. Choose any four of Q2–Q8, prepare a 10-minute outline for each and then attempt all four under the original examination time and word-discipline conditions.')
      ]),
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
