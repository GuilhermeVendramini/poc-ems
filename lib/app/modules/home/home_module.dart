import 'package:ems/app/modules/home/home_controller.dart';
import 'package:ems/app/modules/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (_, args) => I18n(
            child: HomePage(),
          ),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
