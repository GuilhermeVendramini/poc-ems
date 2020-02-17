import 'package:ems/app/modules/auth/login/widgets/forms/login_form.dart';
import 'package:ems/app/shared/utils/i18n/i18n_config.dart';
import 'package:ems/app/shared/widgets/buttons/default_flat_button.dart';
import 'package:ems/app/shared/widgets/buttons/default_outline_button.dart';
import 'package:ems/app/shared/widgets/components/logo/default_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          DefaultLogo(),
          SizedBox(
            height: 40.0,
          ),
          LoginForm(),
          SizedBox(
            height: 40.0,
          ),
          DefaultFlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            text: i18nDefault.loginForgotPassword.i18n,
            buttonWidth: 160.0,
            onPressed: () {
              Modular.to.pushNamed('/recovery');
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          DefaultOutlineButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            text: i18nDefault.loginSignUp.i18n,
            onPressed: () {
              Modular.to.pushNamed('/register');
            },
          ),
        ],
      ),
    );
  }
}
