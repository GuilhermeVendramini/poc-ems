import 'package:ems/app/core/themes/core_theme.dart';
import 'package:ems/app/core/widgets/pages/not_found/core_not_found_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ems',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', "US"),
        const Locale('pt', "BR"),
      ],
      theme: CoreTheme.themeData,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      onUnknownRoute: (RouteSettings setting) {
        return MaterialPageRoute(
          builder: (context) => CoreNotFoundPage(),
        );
      },
      navigatorKey: Modular.navigatorKey,
    );
  }
}
