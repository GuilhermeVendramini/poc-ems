import 'package:ems/app/modules/auth/register/register_controller.dart';
import 'package:ems/app/modules/auth/register/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (_, args) => I18n(
            child: RegisterPage(),
          ),
        ),
      ];

  static Inject get to => Inject<RegisterModule>.of();
}
