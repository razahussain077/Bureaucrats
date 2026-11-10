import 'package:flutter_test/flutter_test.dart';
import 'package:bureaucrats/app.dart';
import 'package:bureaucrats/features/study/study_hub_screen.dart';

void main() {
  testWidgets('app explains Supabase setup when project credentials are absent', (tester) async {
    await tester.pumpWidget(const BureaucratsApp());
    expect(find.text('Bureaucrats'), findsOneWidget);
    expect(find.textContaining('Connect your Supabase project'), findsOneWidget);
  });

  testWidgets('study centre exposes the four preparation areas', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: StudyHubScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Pakistan Affairs'), findsWidgets);
    expect(find.text('Current Affairs'), findsWidgets);
    expect(find.text('MCQ Practice'), findsOneWidget);
    expect(find.text('CSS Syllabus'), findsOneWidget);
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
}
