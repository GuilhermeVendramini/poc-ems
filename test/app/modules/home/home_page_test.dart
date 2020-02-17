import 'package:ems/app/modules/home/home_page.dart';
import 'package:ems/app/shared/utils/i18n/i18n_config.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("[GROUP]: Home Page", () {
    testWidgets('HomePage has title', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(HomePage()));
      final titleFinder = find.text(i18nDefault.home.i18n);
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('HomePage has message', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(HomePage()));
      final messageFinder = find.text(i18nDefault.welcomeMessage.i18n);
      expect(messageFinder, findsOneWidget);
    });
  });
}
