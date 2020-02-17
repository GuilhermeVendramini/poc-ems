import 'package:ems/app/core/core_module.dart';
import 'package:ems/app/core/core_widget.dart';
import 'package:ems/app/shared/utils/i18n/i18n_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    Modular.init(CoreModule());
  });

  group("[GROUP]: CoreWidget", () {
    testWidgets('SplashPage', (WidgetTester tester) async {
      Finder titleFinder;
      await tester.pumpWidget(
        buildTestableWidget(CoreWidget()),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(Duration(seconds: 3));
      titleFinder = find.text(i18nDefault.appName.i18n);
      expect(titleFinder, findsOneWidget);
    });
  });
}
