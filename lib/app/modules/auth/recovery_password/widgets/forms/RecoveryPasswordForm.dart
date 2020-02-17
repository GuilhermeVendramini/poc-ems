import 'package:ems/app/modules/auth/recovery_password/recovery_password_controller.dart';
import 'package:ems/app/shared/utils/i18n/i18n_config.dart';
import 'package:ems/app/shared/utils/snackbar/default_snackbar.dart';
import 'package:ems/app/shared/utils/validators/default_validator.dart';
import 'package:ems/app/shared/widgets/buttons/default_raised_button.dart';
import 'package:ems/app/shared/widgets/fields/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecoveryPasswordForm extends StatefulWidget {
  @override
  _RecoveryPasswordFormState createState() => _RecoveryPasswordFormState();
}

class _RecoveryPasswordFormState extends State<RecoveryPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  RecoveryPasswordController _recoveryPasswordController;

  void _formSubmit() async {
    await _recoveryPasswordController.recoveryPassword();
    DefaultSnackBar.BuildSnackBar(
      context: context,
      content: _recoveryPasswordController.messageStatus,
    );
  }

  @override
  Widget build(BuildContext context) {
    _recoveryPasswordController = Modular.get<RecoveryPasswordController>();
    _recoveryPasswordController.formKey = _formKey;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          DefaultTextFormField(
            textInputType: TextInputType.emailAddress,
            hintText: i18nDefault.email.i18n,
            icon: Icons.email,
            validator: DefaultValidator.isEmail,
            onChanged: _recoveryPasswordController.onChangeEmail,
          ),
          SizedBox(
            height: 10.0,
          ),
          Observer(builder: (_) {
            if (_recoveryPasswordController.recoveryPasswordStatus ==
                RecoveryPasswordStatus.LOADING) {
              return CircularProgressIndicator();
            } else {
              return DefaultRaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                text: i18nDefault.submit.i18n,
                onPressed: _recoveryPasswordController.emailValidated
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
