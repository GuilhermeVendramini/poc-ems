import 'package:ems/app/modules/trails/modules/trail/trail_controller.dart';
import 'package:ems/app/modules/trails/modules/trail/widgets/cards/trail_module_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TrailModulesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TrailController _trailController = Modular.get<TrailController>();
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _trailController.modules.length,
      itemBuilder: (_, int index) {
        return TrailModuleCard(
          module: _trailController.modules[index],
        );
      },
    );
  }
}
