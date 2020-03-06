import 'package:ems/app/modules/benefit/benefit_controller.dart';
import 'package:ems/app/modules/benefit/benefit_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BenefitModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BenefitController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/:id',
          child: (_, args) => BenefitPage(
            id: int.tryParse(args.params['id']),
          ),
        ),
      ];

  static Inject get to => Inject<BenefitModule>.of();
}
