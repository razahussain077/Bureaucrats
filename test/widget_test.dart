import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bureaucrats/core/config.dart';
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
    tester.view.physicalSize = const Size(1200, 2600);
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
    expect(find.textContaining('4 chapters'), findsOneWidget);
  });

  testWidgets('optional subjects and official papers are discoverable', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen(initialTabIndex: 2)));
    await tester.pumpAndSettle();

    expect(find.text('Choose strategically. Study systematically.'), findsOneWidget);
    expect(find.text('Group I'), findsOneWidget);
    await tester.tap(find.text('Group I'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Political Science'), findsOneWidget);

    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen()));
    await tester.pumpAndSettle();
    final tabController = DefaultTabController.of(tester.element(find.byType(TabBarView)));
    tabController.animateTo(5);
    await tester.pumpAndSettle();
    expect(find.text('Official CSS past papers'), findsOneWidget);
    expect(find.text('Previous Question Papers — CSS'), findsOneWidget);
    expect(find.text('OPEN FPSC ARCHIVE'), findsOneWidget);
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
    tester.view.physicalSize = const Size(1200, 2600);
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

  testWidgets('optional academy subjects open their detailed lessons', (tester) async {
    tester.view.physicalSize = const Size(1200, 2600);
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
    expect(find.textContaining('4 chapters'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Computer Science').last);
    await tester.pumpAndSettle();
    expect(find.text('Computer Science'.toUpperCase()), findsOneWidget);
    expect(find.textContaining('4 chapters'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Public Administration').last);
    await tester.pumpAndSettle();
    expect(find.text('PUBLIC ADMINISTRATION'), findsOneWidget);
    expect(find.textContaining('4 chapters'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Gender Studies').last);
    await tester.pumpAndSettle();
    expect(find.text('GENDER STUDIES'), findsOneWidget);
    expect(find.textContaining('4 chapters'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sociology').last);
    await tester.pumpAndSettle();
    expect(find.text('SOCIOLOGY'), findsOneWidget);
    expect(find.textContaining('3 chapters'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Criminology').last);
    await tester.pumpAndSettle();
    expect(find.text('CRIMINOLOGY'), findsOneWidget);
    expect(find.textContaining('3 chapters'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Environmental Sciences').last);
    await tester.pumpAndSettle();
    expect(find.text('ENVIRONMENTAL SCIENCES'), findsOneWidget);
    expect(find.textContaining('3 chapters'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Business Administration').last);
    await tester.pumpAndSettle();
    expect(find.text('BUSINESS ADMINISTRATION'), findsOneWidget);
    expect(find.textContaining('3 chapters'), findsOneWidget);
  });


  testWidgets('expanded optional academy courses open detailed lessons', (tester) async {
    tester.view.physicalSize = const Size(1200, 2600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen(initialTabIndex: 7)));
    await tester.pumpAndSettle();

    const courses = <(String, String)>[
      ('Accountancy & Auditing', '4 chapters'),
      ('Agriculture & Forestry', '3 chapters'),
      ('Anthropology', '3 chapters'),
      ('Applied Mathematics', '4 chapters'),
      ('Physics', '4 chapters'),
      ('Chemistry', '4 chapters'),
      ('Constitutional Law', '4 chapters'),
      ('British History', '4 chapters'),
      ('Governance & Public Policies', '3 chapters'),
      ('Town Planning & Urban Management', '3 chapters'),
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


  testWidgets('Pakistan Affairs classroom covers all expanded syllabus chapters', (tester) async {
    tester.view.physicalSize = const Size(1200, 2600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen(initialTabIndex: 7)));
    await tester.pumpAndSettle();

    expect(find.text('ACADEMY CLASSROOM'), findsOneWidget);
    expect(find.text('Pakistan Affairs'.toUpperCase()), findsOneWidget);
    expect(find.textContaining('29 chapters • 36 lessons'), findsOneWidget);

    await tester.ensureVisible(find.text('The reformers and educational institutions: a comparative study'));
    expect(find.text('The reformers and educational institutions: a comparative study'), findsOneWidget);

    final lastChapter = find.text('Prevailing social problems: poverty, education, health and sanitation');
    await tester.ensureVisible(lastChapter);
    await tester.tap(lastChapter);
    await tester.pumpAndSettle();

    expect(find.text('Human development, inequality and social policy'), findsOneWidget);
    expect(find.text('CSS EXAM QUESTION'), findsWidgets);
    expect(find.text('CLASSWORK'), findsWidgets);
    expect(find.textContaining('The Pakistan Economic Survey 2025–26'), findsOneWidget);
  });

  testWidgets('Pakistan Affairs MCQ bank has expanded to sixty explained questions', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen()));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('MCQ Practice'));
    await tester.tap(find.text('MCQ Practice'));
    await tester.pumpAndSettle();

    expect(find.text('1 / 60'), findsOneWidget);
    expect(find.text('The Simla Deputation took place in:'), findsOneWidget);
  });

}
