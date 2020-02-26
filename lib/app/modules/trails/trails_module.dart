import 'package:ems/app/modules/trails/trails_controller.dart';
import 'package:ems/app/modules/trails/trails_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';

class TrailsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TrailsController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => I18n(
          child: TrailsPage(),
        )),
      ];

  static Inject get to => Inject<TrailsModule>.of();
}
