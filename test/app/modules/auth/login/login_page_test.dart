import 'package:ems/app/modules/auth/login/login_page.dart';
import 'package:ems/app/shared/utils/i18n/i18n_config.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('LoginPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(LoginPage()));
    final titleFinder = find.text(i18nDefault.login);
    expect(titleFinder, findsOneWidget);
  });
}
