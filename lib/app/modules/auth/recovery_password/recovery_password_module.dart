import 'package:ems/app/modules/auth/recovery_password/recovery_password_controller.dart';
import 'package:ems/app/modules/auth/recovery_password/recovery_password_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';

class RecoveryPasswordModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RecoveryPasswordController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (_, args) => I18n(
            child: RecoveryPasswordPage(),
          ),
        ),
      ];

  static Inject get to => Inject<RecoveryPasswordModule>.of();
}
