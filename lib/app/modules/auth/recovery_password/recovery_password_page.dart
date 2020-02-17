import 'package:ems/app/modules/auth/recovery_password/widgets/blocks/RecoveryPasswordBlock.dart';
import 'package:ems/app/shared/utils/i18n/i18n_config.dart';
import 'package:flutter/material.dart';

class RecoveryPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18nDefault.recovery.i18n),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: RecoveryPasswordBlock(),
        ),
      ),
    );
  }
}
