import 'package:ems/app/modules/trails/modules/module/module_controller.dart';
import 'package:ems/app/modules/trails/modules/module/widgets/blocks/module_main_block.dart';
import 'package:ems/app/shared/models/module_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModulePage extends StatefulWidget {
  final int id;

  ModulePage({@required this.id});

  @override
  _ModulePageState createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  ModuleController _moduleController;

  @override
  void initState() {
    _moduleController = Modular.get<ModuleController>();
    _moduleController.loadModuleById(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          switch (_moduleController.moduleStatus) {
            case ModuleStatus.LOADING:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ModuleStatus.ERROR:
              return Center(
                child: Text('Erro ao carregar módulo'),
              );
              break;
            case ModuleStatus.DONE:
              ModuleModel _module = _moduleController.module;
              return _module != null
                  ? ModuleMainBlock(
                      module: _module,
                    )
                  : Container();
              break;
            case ModuleStatus.IDLE:
            default:
              return Container();
              break;
          }
        },
      ),
    );
  }
}
