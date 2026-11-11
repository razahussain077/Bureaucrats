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

  testWidgets('optional subjects and official papers are discoverable', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen(initialTabIndex: 2)));
    await tester.pumpAndSettle();

    expect(find.text('Choose strategically. Study systematically.'), findsOneWidget);
    expect(find.text('Group I'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Political Science'),
      280,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.tap(find.text('Political Science'));
    await tester.pumpAndSettle();
    expect(find.text('CORE TOPIC MAP'), findsOneWidget);
    expect(find.textContaining('Political theory'), findsOneWidget);

    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen(initialTabIndex: 5)));
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
    await tester.pumpWidget(const MaterialApp(home: EssayScreen()));
    await tester.pumpAndSettle();

    expect(find.text('0 words'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Self-review checklist'), 260);
    expect(find.text('Self-review checklist'), findsOneWidget);
    expect(find.text('Decode the prompt'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('My thesis is clear, specific and arguable.'), 220);
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
}
