import 'package:ems/app/shared/utils/i18n/i18n_translate.dart';
import 'package:ems/app/shared/utils/i18n/locales/en-US.dart' as enUS;
import 'package:ems/app/shared/utils/i18n/locales/pt-BR.dart' as ptBR;
import 'package:i18n_extension/i18n_extension.dart';

final I18nTranslate _i18nEnUS = enUS.I18nStrings();
final I18nTranslate _i18nPtBR = ptBR.I18nStrings();
final I18nTranslate i18nDefault = _i18nEnUS;

extension Localization on String {
  static var t = Translations("en_us") +
      {
        "en_us": _i18nEnUS.appName,
        "pt_br": _i18nPtBR.appName,
      } +
      {
        "en_us": _i18nEnUS.home,
        "pt_br": _i18nPtBR.home,
      } +
      {
        "en_us": _i18nEnUS.valIsNotEmpty,
        "pt_br": _i18nPtBR.valIsNotEmpty,
      } +
      {
        "en_us": _i18nEnUS.valMinLength,
        "pt_br": _i18nPtBR.valMinLength,
      } +
      {
        "en_us": _i18nEnUS.valPasswordNotConfirm,
        "pt_br": _i18nPtBR.valPasswordNotConfirm,
      } +
      {
        "en_us": _i18nEnUS.valEmail,
        "pt_br": _i18nPtBR.valEmail,
      } +
      {
        "en_us": _i18nEnUS.login,
        "pt_br": _i18nPtBR.login,
      } +
      {
        "en_us": _i18nEnUS.register,
        "pt_br": _i18nPtBR.register,
      } +
      {
        "en_us": _i18nEnUS.email,
        "pt_br": _i18nPtBR.email,
      } +
      {
        "en_us": _i18nEnUS.password,
        "pt_br": _i18nPtBR.password,
      } +
      {
        "en_us": _i18nEnUS.loginForgotPassword,
        "pt_br": _i18nPtBR.loginForgotPassword,
      } +
      {
        "en_us": _i18nEnUS.loginSignUp,
        "pt_br": _i18nPtBR.loginSignUp,
      } +
      {
        "en_us": _i18nEnUS.name,
        "pt_br": _i18nPtBR.name,
      } +
      {
        "en_us": _i18nEnUS.registerConfirmPassword,
        "pt_br": _i18nPtBR.registerConfirmPassword,
      } +
      {
        "en_us": _i18nEnUS.registerNewAccount,
        "pt_br": _i18nPtBR.registerNewAccount,
      } +
      {
        "en_us": _i18nEnUS.recovery,
        "pt_br": _i18nPtBR.recovery,
      } +
      {
        "en_us": _i18nEnUS.submit,
        "pt_br": _i18nPtBR.submit,
      } +
      {
        "en_us": _i18nEnUS.recoverySentEmailMessage,
        "pt_br": _i18nPtBR.recoverySentEmailMessage,
      } +
      {
        "en_us": _i18nEnUS.registerPasswordConfirmHelperText,
        "pt_br": _i18nPtBR.registerPasswordConfirmHelperText,
      } +
      {
        "en_us": _i18nEnUS.registerPasswordHelperText,
        "pt_br": _i18nPtBR.registerPasswordHelperText,
      } +
      {
        "en_us": _i18nEnUS.welcomeMessage,
        "pt_br": _i18nPtBR.welcomeMessage,
      } +
      {
        "en_us": _i18nEnUS.notFoundPage,
        "pt_br": _i18nPtBR.notFoundPage,
      } +
      {
        "en_us": _i18nEnUS.notFoundMessage,
        "pt_br": _i18nPtBR.notFoundMessage,
      };

  String get i18n => localize(this, t);
}
