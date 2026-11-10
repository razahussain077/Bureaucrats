import 'package:flutter_test/flutter_test.dart';
import 'package:bureaucrats/app.dart';

void main() {
  testWidgets('app explains Supabase setup when project credentials are absent', (tester) async {
    await tester.pumpWidget(const BureaucratsApp());
    expect(find.text('Bureaucrats'), findsOneWidget);
    expect(find.textContaining('Connect your Supabase project'), findsOneWidget);
  });
}
