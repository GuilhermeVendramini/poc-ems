import 'package:ems/app/modules/trails/modules/trail/trail_controller.dart';
import 'package:ems/app/modules/trails/modules/trail/widgets/blocks/trail_main_block.dart';
import 'package:ems/app/shared/models/trail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TrailPage extends StatefulWidget {
  final int id;
  final int trailId;

  TrailPage({
    @required this.id,
    @required this.trailId,
  });

  @override
  _TrailPageState createState() => _TrailPageState();
}

class _TrailPageState extends State<TrailPage> {
  TrailController _trailController;

  @override
  void initState() {
    _trailController = Modular.get<TrailController>();
    _trailController.loadTrailById(id: widget.id, trailId: widget.trailId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Observer(builder: (_) {
        switch (_trailController.trailStatus) {
          case TrailStatus.LOADING:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case TrailStatus.ERROR:
            return Center(
              child: Text('Erro ao carregar trilha'),
            );
            break;
          case TrailStatus.DONE:
            TrailModel _trail = _trailController.trail;
            return _trail != null
                ? SingleChildScrollView(
                    child: TrailMainBlock(
                      trail: _trail,
                    ),
                  )
                : Container();
            break;
          case TrailStatus.IDLE:
          default:
            return Container();
            break;
        }
      }),
    );
  }
}
