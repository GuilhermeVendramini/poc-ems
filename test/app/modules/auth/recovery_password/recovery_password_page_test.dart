import 'package:ems/app/modules/auth/recovery_password/recovery_password_page.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('RecoveryPasswordPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(RecoveryPasswordPage()));
    final titleFinder = find.text('Recovery');
    expect(titleFinder, findsOneWidget);
  });
}
