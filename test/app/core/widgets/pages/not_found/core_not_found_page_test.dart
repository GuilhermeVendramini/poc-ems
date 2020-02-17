import 'package:ems/app/core/widgets/pages/not_found/core_not_found_page.dart';
import 'package:ems/app/shared/utils/i18n/i18n_config.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('Core NotFoundPage', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(CoreNotFoundPage()));
    final titleFinder = find.text(i18nDefault.notFoundPage.i18n);
    final messageFinder = find.text(i18nDefault.notFoundMessage.i18n);
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
