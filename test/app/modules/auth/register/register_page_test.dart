import 'package:ems/app/modules/auth/register/register_page.dart';
import 'package:ems/app/shared/utils/i18n/i18n_config.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('RegisterPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(RegisterPage()));
    final titleFinder = find.text(i18nDefault.register);
    expect(titleFinder, findsOneWidget);
  });
}
