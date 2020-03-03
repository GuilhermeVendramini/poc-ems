import 'package:ems/app/modules/trails/modules/module/module_controller.dart';
import 'package:ems/app/modules/trails/modules/module/module_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';

class ModuleModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ModuleController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/:id',
          child: (_, args) => I18n(
            child: ModulePage(
              id: int.tryParse(args.params['id']),
            ),
          ),
        ),
      ];

  static Inject get to => Inject<ModuleModule>.of();
}
