import 'package:ems/app/modules/trails/modules/trail/trail_controller.dart';
import 'package:ems/app/modules/trails/modules/trail/widgets/blocks/trail_header_block.dart';
import 'package:ems/app/modules/trails/modules/trail/widgets/blocks/trail_modules_block.dart';
import 'package:ems/app/modules/trails/modules/trail/widgets/components/containers/trail_default_container.dart';
import 'package:ems/app/shared/models/module_model.dart';
import 'package:ems/app/shared/models/trail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TrailMainBlock extends StatelessWidget {
  final TrailModel trail;

  TrailMainBlock({@required this.trail});

  @override
  Widget build(BuildContext context) {
    TrailController _trailController = Modular.get<TrailController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TrailHeaderBlock(
          trail: trail,
        ),
        Observer(builder: (_) {
          switch (_trailController.modulesStatus) {
            case ModulesStatus.LOADING:
              return TrailDefaultContainer(
                widget: CircularProgressIndicator(),
              );
              break;
            case ModulesStatus.ERROR:
              return TrailDefaultContainer(
                widget: Text(
                  'Erro ao carregar os módulos',
                ),
              );
              break;
            case ModulesStatus.DONE:
              List<ModuleModel> _modules = _trailController.modules;
              return _modules != null
                  ? TrailModulesBlock()
                  : TrailDefaultContainer(
                      widget: Text(
                        'Essa trilha ainda não possui módulos',
                      ),
                    );
              break;
            case ModulesStatus.IDLE:
            default:
              return Container();
              break;
          }
        }),
      ],
    );
  }
}
