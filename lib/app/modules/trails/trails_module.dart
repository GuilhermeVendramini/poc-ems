import 'package:ems/app/modules/trails/trails_controller.dart';
import 'package:ems/app/modules/trails/trails_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TrailsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TrailsController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => TrailsPage()),
      ];

  static Inject get to => Inject<TrailsModule>.of();
}
