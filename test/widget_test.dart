import 'package:flutter_test/flutter_test.dart';
import 'package:bureaucrats/app.dart';

void main() {
  testWidgets('app renders the preparation home screen', (tester) async {
    await tester.pumpWidget(const BureaucratsApp());
    expect(find.text('Bureaucrats'), findsOneWidget);
    expect(find.text('Essay Examiner'), findsOneWidget);
    expect(find.text('Pakistan Affairs'), findsOneWidget);
  });
}
