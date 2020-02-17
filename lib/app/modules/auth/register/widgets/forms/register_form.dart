import 'package:ems/app/modules/auth/register/register_controller.dart';
import 'package:ems/app/shared/models/user_model.dart';
import 'package:ems/app/shared/utils/i18n/i18n_config.dart';
import 'package:ems/app/shared/utils/snackbar/default_snackbar.dart';
import 'package:ems/app/shared/utils/validators/default_validator.dart';
import 'package:ems/app/shared/widgets/buttons/default_raised_button.dart';
import 'package:ems/app/shared/widgets/fields/default_password_form_field.dart';
import 'package:ems/app/shared/widgets/fields/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  RegisterController _registerController;

  void _formSubmit() async {
    UserModel user = await _registerController.registerWithEmailPassword();
    if (user != null) {
      Modular.to.pushReplacementNamed('/home');
    } else {
      if (_registerController.messageStatus.isNotEmpty) {
        DefaultSnackBar.BuildSnackBar(
          context: context,
          content: _registerController.messageStatus,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _registerController = Modular.get<RegisterController>();
    _registerController.formKey = _formKey;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          DefaultTextFormField(
            textInputType: TextInputType.emailAddress,
            hintText: i18nDefault.email.i18n,
            icon: Icons.email,
            onChanged: _registerController.onChangeEmail,
            validator: DefaultValidator.isEmail,
          ),
          DefaultPasswordFormField(
            hintText: i18nDefault.password.i18n,
            icon: Icons.lock,
            onChanged: _registerController.onChangePassword,
            validator: DefaultValidator.password,
            helperText: i18nDefault.registerPasswordHelperText.i18n,
          ),
          DefaultPasswordFormField(
            hintText: i18nDefault.registerConfirmPassword.i18n,
            icon: Icons.lock,
            onChanged: _registerController.onChangeConfirmPassword,
            validator: (value) {
              return DefaultValidator.confirmPassword(
                  value, _registerController.password);
            },
            helperText: i18nDefault.registerPasswordConfirmHelperText.i18n,
          ),
          SizedBox(
            height: 10.0,
          ),
          Observer(builder: (_) {
            if (_registerController.registerUserStatus ==
                RegisterUserStatus.LOADING) {
              return CircularProgressIndicator();
            } else {
              return DefaultRaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                text: i18nDefault.registerNewAccount.i18n,
                onPressed: _registerController.emailPasswordValidated
                    ? _formSubmit
                    : null,
              );
            }
          }),
        ],
      ),
    );
  }
}
