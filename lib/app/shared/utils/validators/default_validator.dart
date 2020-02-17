import 'package:ems/app/shared/utils/i18n/i18n_config.dart';

class DefaultValidator {
  DefaultValidator._();

  static String isNotEmpty(String value) {
    if (value.isEmpty) {
      return i18nDefault.valIsNotEmpty.i18n;
    }

    return null;
  }

  static String isEmail(String value) {
    String valueValidate = isNotEmpty(value);

    if (valueValidate != null) {
      return valueValidate;
    }

    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) == false) {
      return i18nDefault.valEmail.i18n;
    }

    return null;
  }

  static String password(String value) {
    String valueValidate = isNotEmpty(value);

    if (valueValidate != null) {
      return valueValidate;
    }

    if (value.length < 8) {
      return i18nDefault.valMinLength.i18n;
    }

    return null;
  }

  static String confirmPassword(String value, String firstValue) {
    String passwordValidate = password(value);

    if (passwordValidate != null) {
      return passwordValidate;
    }

    if (value != firstValue) {
      return i18nDefault.valPasswordNotConfirm.i18n;
    }

    return null;
  }
}
