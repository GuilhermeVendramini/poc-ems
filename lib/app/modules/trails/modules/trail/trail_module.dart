import 'package:ems/app/modules/trails/modules/trail/trail_controller.dart';
import 'package:ems/app/modules/trails/modules/trail/trail_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';

class TrailModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TrailController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/:id/:trailId',
          child: (_, args) => I18n(
            child: TrailPage(
              id: int.tryParse(args.params['id']),
              trailId: int.tryParse(args.params['trailId']),
            ),
          ),
        ),
      ];

  static Inject get to => Inject<TrailModule>.of();
}
