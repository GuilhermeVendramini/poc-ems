import 'package:ems/app/core/core_controller.dart';
import 'package:ems/app/core/core_module.dart';
import 'package:ems/app/core/widgets/pages/splash/core_splash_page.dart';
import 'package:ems/app/shared/utils/i18n/i18n_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  CoreController coreController;

  setUpAll(() {
    Modular.init(CoreModule());
    coreController = CoreModule.to.get<CoreController>();
    coreController.messageStatus = 'Default error message';
  });

  group("[GROUP]: Core Splash Page", () {
    testWidgets('Find Page Title', (WidgetTester tester) async {
      await tester.pumpWidget(MainTestWidget());
      final titleFinder = find.text(i18nDefault.appName.i18n);
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('Find CircularProgressIndicator', (WidgetTester tester) async {
      await tester.pumpWidget(MainTestWidget());
      coreController.userLoadStatus = UserLoadStatus.LOADING;
      final circularProgressFinder = find.byType(CircularProgressIndicator);
      expect(circularProgressFinder, findsOneWidget);
    });

    testWidgets('Find error message', (WidgetTester tester) async {
      await tester.pumpWidget(MainTestWidget());

      coreController.userLoadStatus = UserLoadStatus.ERROR;
      await tester.pump();
      final errorFinder = find.text(coreController.messageStatus);
      expect(errorFinder, findsOneWidget);
    });
  });
}

class MainTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter test',
      home: CoreSplashPage(),
    );
  }
}
