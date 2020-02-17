import 'package:ems/app/shared/utils/i18n/i18n_config.dart';
import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';

class CoreNotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return I18n(
      child: Scaffold(
        appBar: AppBar(
          title: Text(i18nDefault.notFoundPage.i18n),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              i18nDefault.notFoundMessage.i18n,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
