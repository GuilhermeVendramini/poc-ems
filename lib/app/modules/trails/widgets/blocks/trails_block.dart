import 'package:ems/app/modules/trails/trails_controller.dart';
import 'package:ems/app/modules/trails/widgets/lists/trails_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TrailsBlock extends StatefulWidget {
  final int category;

  TrailsBlock({@required this.category});

  @override
  _TrailsBlockState createState() => _TrailsBlockState();
}

class _TrailsBlockState extends State<TrailsBlock> {
  TrailsController _trailsController;

  @override
  void initState() {
    _trailsController = Modular.get<TrailsController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        switch (_trailsController.trailsStatus) {
          case TrailsStatus.LOADING:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case TrailsStatus.ERROR:
            return Text('Erro ao carregar as trilhas');
            break;
          case TrailsStatus.DONE:
            return TrailsList(
              trails: _trailsController.getTrailsByCategory(widget.category),
            );
            break;
          case TrailsStatus.IDLE:
          default:
            return Container();
            break;
        }
      },
    );
  }
}
