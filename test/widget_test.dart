import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bureaucrats/core/config.dart';
import 'package:bureaucrats/features/study/academy_course_data.dart';
import 'package:bureaucrats/features/study/optional_academy_courses.dart';
import 'package:bureaucrats/features/study/study_hub_screen.dart';
import 'package:bureaucrats/features/exams/exam_hub_screen.dart';
import 'package:bureaucrats/features/essay/essay_screen.dart';
import 'package:bureaucrats/features/home/home_screen.dart';

void main() {
  test('app is configured for the deployed Bureaucrats backend', () {
    expect(AppConfig.hasSupabase, isTrue);
    expect(AppConfig.supabaseUrl, 'https://kqwdlktvuggxyaubcukj.supabase.co');
    expect(AppConfig.supabasePublishableKey, startsWith('sb_publishable_'));
  });

  testWidgets('study centre exposes all five preparation areas', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Pakistan Affairs'), findsWidgets);
    await tester.tap(find.text('Historical foundations of Muslim political identity'));
    await tester.pumpAndSettle();
    expect(find.text('CLASS NOTES'), findsOneWidget);
    expect(find.textContaining('The events of 1857 marked a decisive rupture'), findsOneWidget);
    expect(find.text('ANSWER-WRITING TASK'), findsOneWidget);
    expect(find.text('Compulsory Papers'), findsOneWidget);
    expect(find.text('Current Affairs'), findsWidgets);
    expect(find.text('MCQ Practice'), findsOneWidget);
    expect(find.text('CSS Syllabus'), findsOneWidget);

    await tester.ensureVisible(find.text('Compulsory Papers'));
    await tester.tap(find.text('Compulsory Papers'));
    await tester.pumpAndSettle();
    expect(find.text('English Essay'), findsOneWidget);
    expect(find.text('General Science & Ability'), findsOneWidget);
    await tester.tap(find.text('English Essay'));
    await tester.pumpAndSettle();
    expect(find.text('TEACHING NOTES'), findsOneWidget);
    expect(find.textContaining('A CSS essay is an argument'), findsOneWidget);
    expect(find.text('PRACTICE TASK'), findsOneWidget);
  });

  testWidgets('academy classroom opens detailed chapter lessons', (tester) async {
    tester.view.physicalSize = const Size(1200, 5200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen(initialTabIndex: 7)));
    await tester.pumpAndSettle();

    expect(find.text('ACADEMY CLASSROOM'), findsOneWidget);
    expect(find.text('Pakistan Affairs'), findsWidgets);
    await tester.ensureVisible(find.text('How Muslim political thought developed in South Asia'));
    await tester.tap(find.text('How Muslim political thought developed in South Asia'));
    await tester.pumpAndSettle();

    expect(find.text('1. The historical setting'), findsOneWidget);
    expect(find.textContaining('The political history of Muslims in South Asia'), findsOneWidget);
    expect(find.text('CSS EXAM QUESTION'), findsOneWidget);
    expect(find.text('CLASSWORK'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('English Essay').last);
    await tester.pumpAndSettle();

    expect(find.text('English Essay'.toUpperCase()), findsOneWidget);
    expect(find.textContaining('6 chapters'), findsOneWidget);
  });

  testWidgets('optional subjects and official papers are discoverable', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen(initialTabIndex: 2)));
    await tester.pumpAndSettle();

    expect(find.text('Choose strategically. Study systematically.'), findsOneWidget);
    expect(find.text('Group I'), findsOneWidget);
    await tester.tap(find.text('Group I'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Political Science'), findsOneWidget);

    tester.view.physicalSize = const Size(1200, 1800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen()));
    await tester.pumpAndSettle();
    final tabController = DefaultTabController.of(tester.element(find.byType(TabBarView)));
    tabController.animateTo(5);
    await tester.pumpAndSettle();
    expect(find.text('Official CSS past papers'), findsOneWidget);
    expect(find.text('Previous Question Papers — CSS'), findsOneWidget);
    expect(find.text('Pakistan Affairs — Official CE-2023 Paper'), findsOneWidget);
    expect(find.text('Pakistan Economic Survey 2025–26'), findsOneWidget);
    expect(find.text('Federal Budget 2026–27'), findsOneWidget);
    expect(find.text('Constitution of Pakistan — amended up to the 27th Amendment'), findsOneWidget);
    expect(find.text('Indus Waters Treaty — PCA case record'), findsOneWidget);
    expect(find.text('IMF Pakistan — 7 October 2026 review'), findsOneWidget);
    expect(find.text('OPEN FPSC ARCHIVE'), findsOneWidget);

    tabController.animateTo(6);
    await tester.pumpAndSettle();
    final pakistanTracker = find.text('Pakistan Affairs — 28 official syllabus areas');
    await tester.ensureVisible(pakistanTracker);
    await tester.tap(pakistanTracker);
    await tester.pumpAndSettle();
    final finalClause = find.textContaining('XXVIII. Social problems: poverty, education, health and sanitation');
    await tester.ensureVisible(finalClause);
    expect(finalClause, findsOneWidget);
  });

  testWidgets('dashboard presents Bureaucrats academy identity and resources', (tester) async {
    tester.view.physicalSize = const Size(1200, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    await tester.pumpAndSettle();

    expect(find.text('BUREAUCRATS  /  CSS ACADEMY'), findsOneWidget);
    expect(find.text('The academic workspace'), findsOneWidget);
    expect(find.text('Optional Subjects'), findsOneWidget);
    expect(find.text('Past Papers'), findsOneWidget);

    await tester.ensureVisible(find.text('Optional Subjects'));
    await tester.tap(find.text('Optional Subjects'));
    await tester.pumpAndSettle();
    expect(find.text('Choose strategically. Study systematically.'), findsOneWidget);

  });

  testWidgets('MCQ practice checks an answer and explains it', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen()));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('MCQ Practice'));
    await tester.tap(find.text('MCQ Practice'));
    await tester.pumpAndSettle();

    expect(find.text('The Simla Deputation took place in:'), findsOneWidget);
    await tester.tap(find.text('1906').first);
    await tester.pumpAndSettle();

    expect(find.textContaining('Correct.'), findsOneWidget);
    expect(find.textContaining('met Lord Minto in October 1906'), findsOneWidget);
  });

  testWidgets('essay workspace shows planning and self-review tools', (tester) async {
    tester.view.physicalSize = const Size(1200, 5200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(home: EssayScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Decode the prompt'), findsOneWidget);
    expect(find.text('Self-review checklist'), findsOneWidget);
    await tester.ensureVisible(find.text('My thesis is clear, specific and arguable.'));
    expect(find.text('Self-review checklist'), findsOneWidget);
    await tester.tap(find.text('My thesis is clear, specific and arguable.'));
    await tester.pumpAndSettle();
    expect(find.text('1 of 8 checks completed'), findsOneWidget);
  });

  testWidgets('timed practice test starts and presents a question', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ExamHubScreen()));
    await tester.pump();

    expect(find.text('Start a practice test'), findsOneWidget);
    await tester.tap(find.text('Begin timed test'));
    await tester.pump();

    expect(find.text('QUESTION 1 OF 12'), findsOneWidget);
    expect(find.text('The Simla Deputation met Lord Minto in:'), findsOneWidget);
    expect(find.text('Next question'), findsOneWidget);
  });

  
  testWidgets('mixed optional mock exam exposes forty explained questions', (tester) async {
    tester.view.physicalSize = const Size(1200, 2600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(home: ExamHubScreen()));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(DropdownButtonFormField<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Mixed optional subjects').last);
    await tester.pumpAndSettle();
    expect(find.text('40 questions'), findsOneWidget);

    await tester.tap(find.text('Begin timed test'));
    await tester.pump();
    expect(find.text('QUESTION 1 OF 40'), findsOneWidget);
    expect(find.text('POLITICAL SCIENCE'), findsOneWidget);
  });

  testWidgets('optional academy subjects open their detailed lessons', (tester) async {
    tester.view.physicalSize = const Size(1200, 5200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen(initialTabIndex: 7)));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Economics').last);
    await tester.pumpAndSettle();
    expect(find.text('Economics'.toUpperCase()), findsOneWidget);
    expect(find.textContaining('5 chapters'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Computer Science').last);
    await tester.pumpAndSettle();
    expect(find.text('Computer Science'.toUpperCase()), findsOneWidget);
    expect(find.textContaining('5 chapters'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Public Administration').last);
    await tester.pumpAndSettle();
    expect(find.text('PUBLIC ADMINISTRATION'), findsOneWidget);
    expect(find.textContaining('5 chapters'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Gender Studies').last);
    await tester.pumpAndSettle();
    expect(find.text('GENDER STUDIES'), findsOneWidget);
    expect(find.textContaining('5 chapters'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sociology').last);
    await tester.pumpAndSettle();
    expect(find.text('SOCIOLOGY'), findsOneWidget);
    expect(find.textContaining('4 chapters'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Criminology').last);
    await tester.pumpAndSettle();
    expect(find.text('CRIMINOLOGY'), findsOneWidget);
    expect(find.textContaining('4 chapters'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Environmental Sciences').last);
    await tester.pumpAndSettle();
    expect(find.text('ENVIRONMENTAL SCIENCES'), findsOneWidget);
    expect(find.textContaining('4 chapters'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Business Administration').last);
    await tester.pumpAndSettle();
    expect(find.text('BUSINESS ADMINISTRATION'), findsOneWidget);
    expect(find.textContaining('4 chapters'), findsOneWidget);
  });


  test('ten expanded optional courses contain structured teaching content', () {
    const expected = <String, int>{
      'Political Science': 7,
      'International Relations': 7,
      'Economics': 5,
      'Computer Science': 5,
      'Public Administration': 5,
      'Gender Studies': 5,
      'Sociology': 4,
      'Criminology': 4,
      'Environmental Sciences': 4,
      'Business Administration': 4,
    };
    final expandedCourses = optionalAcademyCourses
        .where((course) => expected.containsKey(course.title))
        .toList();
    expect(expandedCourses, hasLength(10));
    for (final course in expandedCourses) {
      expect(expected[course.title], course.chapters.length);
      expect(
        course.chapters.map((chapter) => chapter.number).toSet(),
        hasLength(course.chapters.length),
      );
      final lessons = course.chapters.expand((chapter) => chapter.lessons);
      expect(lessons.length, greaterThanOrEqualTo(5));
      for (final lesson in lessons) {
        expect(lesson.title.trim(), isNotEmpty);
        expect(lesson.objectives.trim(), isNotEmpty);
        expect(lesson.sections.length, greaterThanOrEqualTo(3));
        expect(lesson.keyTerms.length, greaterThanOrEqualTo(5));
        expect(lesson.examQuestion.trim(), isNotEmpty);
        expect(lesson.practiceTask.trim(), isNotEmpty);
        for (final section in lesson.sections) {
          expect(section.content.trim().length, greaterThan(250));
        }
      }
    }
  });

  test('the other ten optional courses also contain structured lessons', () {
    const expected = <String, int>{
      'Accountancy & Auditing': 5,
      'Agriculture & Forestry': 4,
      'Anthropology': 4,
      'Applied Mathematics': 5,
      'Physics': 5,
      'Chemistry': 5,
      'Constitutional Law': 5,
      'British History': 5,
      'Governance & Public Policies': 4,
      'Town Planning & Urban Management': 4,
    };
    for (final course in optionalAcademyCourses.where(
      (item) => expected.containsKey(item.title),
    )) {
      expect(course.chapters, hasLength(expected[course.title]));
      final lessons = course.chapters.expand((chapter) => chapter.lessons);
      expect(lessons.length, greaterThanOrEqualTo(5));
      for (final lesson in lessons) {
        expect(lesson.objectives.trim(), isNotEmpty);
        expect(lesson.sections.length, greaterThanOrEqualTo(3));
        expect(lesson.keyTerms.length, greaterThanOrEqualTo(5));
        expect(lesson.examQuestion.trim(), isNotEmpty);
        expect(lesson.practiceTask.trim(), isNotEmpty);
      }
    }
  });

  testWidgets('expanded optional academy courses open detailed lessons', (tester) async {
    tester.view.physicalSize = const Size(1200, 2600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen(initialTabIndex: 7)));
    await tester.pumpAndSettle();

    const courses = <(String, String)>[
      ('Accountancy & Auditing', '5 chapters'),
      ('Agriculture & Forestry', '4 chapters'),
      ('Anthropology', '4 chapters'),
      ('Applied Mathematics', '5 chapters'),
      ('Physics', '5 chapters'),
      ('Chemistry', '5 chapters'),
      ('Constitutional Law', '5 chapters'),
      ('British History', '5 chapters'),
      ('Governance & Public Policies', '4 chapters'),
      ('Town Planning & Urban Management', '4 chapters'),
    ];

    for (final course in courses) {
      await tester.tap(find.byType(DropdownButtonFormField<int>));
      await tester.pumpAndSettle();
      await tester.tap(find.text(course.$1).last);
      await tester.pumpAndSettle();
      expect(find.text(course.$1.toUpperCase()), findsOneWidget);
      expect(find.textContaining(course.$2), findsOneWidget);
    }
  });


  test('Pakistan Affairs curriculum covers the official syllabus and CE-2023 themes', () {
    final course = compulsoryAcademyCourses.firstWhere(
      (item) => item.title == 'Pakistan Affairs',
    );
    final lessons = course.chapters.expand((chapter) => chapter.lessons).toList();
    final lessonTitles = lessons.map((lesson) => lesson.title).toSet();

    expect(course.marks, '100 marks');
    expect(course.chapters, hasLength(32));
    expect(course.chapters.map((chapter) => chapter.number).toSet(), hasLength(32));
    expect(lessons, hasLength(87));

    for (final lesson in lessons) {
      expect(
        lesson.sections.length,
        greaterThanOrEqualTo(2),
        reason: 'Lesson has too few teaching sections: ${lesson.title}',
      );
      expect(lesson.objectives.trim(), isNotEmpty, reason: lesson.title);
      expect(lesson.keyTerms, isNotEmpty, reason: lesson.title);
      expect(lesson.examQuestion.trim(), isNotEmpty, reason: lesson.title);
      expect(lesson.practiceTask.trim(), isNotEmpty, reason: lesson.title);
    }

    expect(
      lessonTitles,
      containsAll(<String>[
        'The reformers and educational institutions: a comparative study',
        'Ideology of Pakistan in the thought of Iqbal and Jinnah',
        'The 1857 uprising, colonial restructuring and Muslim social change',
        'Round Table Conferences, Communal Award and constitutional deadlock',
        'The 1937 elections, Lahore Resolution and transfer of power',
        'Constitution-making, early political crises and constitutional experiments',
        'Federalism, the Eighteenth Amendment and local government',
        'Pakistan’s physical regions, climate and strategic geography',
        'Pakistan’s macroeconomic structure, public finance and external account',
        'Pakistan’s energy system, circular debt and transition choices',
        'Hydro-politics, the Indus system and water governance',
        'Complete model answer: Jinnah’s leadership during 1937–1947',
        'Complete model answer: agricultural decline and food insecurity',
        'Complete model answer: barriers to industrial development',
        'Complete model answer: democratic evolution and institutional consolidation',
        'Complete model answer: youth bulge and sustainable economic development',
        'Complete model answer: Pakistan and the US-led War on Terror',
        'Complete model answer: Pakistan’s geo-strategic location and its challenges',
        'CE-2024 official paper map: political stability, reform and integration',
        'CE-2025 official paper map: water, history, CPEC and media',
        'CE-2026 official paper map: Iqbal-Jinnah, Afghanistan, 27th Amendment and human development',
        'Climate change, disaster resilience and a green economic model',
        'Dynastic politics, patronage and barriers to democratic competition',
        'Media, public opinion and political change in Pakistan',
        'CPEC: geo-economics, implementation and regional connectivity',
        'The UN Security Council and the Kashmir dispute',
        'Health and education after the Eighteenth Amendment',
        'Bhutto-era nationalisation: objectives, outcomes and economic lessons',
        'CE-2024 Q2 model answer: political instability and a fractured polity',
        'CE-2024 Q3 model answer: Shaikh Ahmad Sirhindi and Muslim intellectual renewal',
        'CE-2024 Q4 model answer: dynastic politics, feudal influence and democracy',
        'CE-2024 Q5 model answer: climate change and a green economic model',
        'CE-2024 Q6 model answer: equitable resource distribution and regional grievances',
        'CE-2024 Q7 model answer: pragmatic civil-military relations and South Asian security',
        'CE-2024 Q8 model answer: provincial autonomy, devolution and national integration',
        'CE-2025 Q2 model answer: the Indus Waters Treaty and bilateral relations',
        'CE-2025 Q3 model answer: the separation of East Pakistan in 1971',
        'CE-2025 Q4 model answer: CPEC and Pakistan’s economic development',
        'CE-2025 Q5 model answer: demographic and cultural diversity and national integration',
        'CE-2025 Q6 model answer: Bhutto-era nationalisation and economic performance',
        'CE-2025 Q7 model answer: Pakistan’s Kashmir policy and options for a solution',
        'CE-2025 Q8 model answer: media, public opinion and political change',
        'CE-2026 Q2 model answer: Iqbal’s philosophy and Jinnah’s political interpretation',
        'CE-2026 Q3 model answer: Afghanistan’s instability and Pakistan’s security',
        'CE-2026 Q4 model answer: the Twenty-seventh Amendment and constitutionalism',
        'CE-2026 Q5 model answer: youth, digital activism and civil-military relations',
        'CE-2026 Q6 model answer: Pakistan’s economic challenges and IMF conditionality',
        'CE-2026 Q7 model answer: the UN Security Council and Kashmir',
        'CE-2026 Q8 model answer: health and education after the Eighteenth Amendment',
        'Timed-answer clinic: a non-official 20-mark self-assessment rubric',
      ]),
    );

    final chapterTitleSet = course.chapters
        .map((chapter) => chapter.title)
        .toSet();
    expect(
      chapterTitleSet,
      containsAll(<String>[
        'Official past-paper map: CSS CE-2023 Pakistan Affairs',
        'Model answer frameworks for recurring Pakistan Affairs themes',
      ]),
    );

    final chapterLinks = course.chapters
        .map((chapter) => chapter.syllabusLink)
        .join(' ');
    final chapterTitles = course.chapters
        .map((chapter) => chapter.title)
        .join(' ');
    final coverageText = '$chapterLinks $chapterTitles';
    for (final clause in <String>[
      'Ideology of Pakistan',
      'Land and people',
      'changing regional apparatus',
      'Nuclear Program',
      'Regional Cooperation Organizations',
      'Civil-military relations',
      'Economic challenges',
      'Non-Traditional Security Threats',
      'Palestine Issue',
      'National Security',
      'Political Evolution Since 1971',
      'War on Terror',
      'Foreign Policy',
      'Democratic System',
      'Ethnic Issues',
      'Hydro-politics',
      'National Interest',
      'Sovereignty',
      'Energy Problems',
      'Relations with Neighbors',
      'India Relations',
      'Kashmir Issue',
      'war in Afghanistan',
      'Proxy Wars',
      'Economic Conditions',
      'Constitutional and Legal Debates',
      'Social Problems',
    ]) {
      expect(coverageText.toLowerCase(), contains(clause.toLowerCase()));
    }
  });

  testWidgets('Pakistan Affairs classroom tracks completed lessons', (tester) async {
    tester.view.physicalSize = const Size(1200, 2000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(home: StudyHubScreen(initialTabIndex: 7)),
    );
    await tester.pumpAndSettle();

    expect(find.text('Pakistan Affairs'.toUpperCase()), findsOneWidget);
    expect(find.textContaining('32 chapters • 87 lessons'), findsOneWidget);
    expect(find.text('Mark lesson complete'), findsNothing);

    final firstLesson = find.byKey(
      const PageStorageKey<String>(
        'lesson-How Muslim political thought developed in South Asia',
      ),
    );
    await tester.ensureVisible(firstLesson);
    await tester.tap(firstLesson);
    await tester.pumpAndSettle();

    expect(find.text('Mark lesson complete'), findsOneWidget);
    expect(find.text('1. The historical setting'), findsOneWidget);
    await tester.tap(find.text('Mark lesson complete'));
    await tester.pumpAndSettle();
    expect(find.text('1 / 87 lessons completed'), findsOneWidget);
  });

  testWidgets('Pakistan Affairs MCQ bank has expanded to one hundred and twenty explained questions', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen()));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('MCQ Practice'));
    await tester.tap(find.text('MCQ Practice'));
    await tester.pumpAndSettle();

    expect(find.text('1 / 120'), findsOneWidget);
    expect(find.text('The Simla Deputation took place in:'), findsOneWidget);
  });

}
