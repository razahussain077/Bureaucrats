import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bureaucrats/core/config.dart';
import 'package:bureaucrats/features/study/study_hub_screen.dart';
import 'package:bureaucrats/features/exams/exam_hub_screen.dart';
import 'package:bureaucrats/features/essay/essay_screen.dart';

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
    expect(find.text('Core Papers'), findsOneWidget);
    expect(find.text('Current Affairs'), findsWidgets);
    expect(find.text('MCQ Practice'), findsOneWidget);
    expect(find.text('CSS Syllabus'), findsOneWidget);

    await tester.tap(find.text('Core Papers'));
    await tester.pumpAndSettle();
    expect(find.text('English Essay'), findsOneWidget);
    expect(find.text('General Science & Ability'), findsOneWidget);
    expect(find.text('Islamic Studies / Comparative Study of Major Religions'), findsOneWidget);
  });

  testWidgets('MCQ practice checks an answer and explains it', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen()));
    await tester.pumpAndSettle();

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

    expect(find.text('Self-review checklist'), findsOneWidget);
    expect(find.text('Decode the prompt'), findsOneWidget);
    expect(find.text('0 words'), findsOneWidget);
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
