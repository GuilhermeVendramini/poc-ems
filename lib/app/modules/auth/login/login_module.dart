import 'package:ems/app/modules/auth/login/login_controller.dart';
import 'package:ems/app/modules/auth/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (_, args) => I18n(
            child: LoginPage(),
          ),
        ),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
