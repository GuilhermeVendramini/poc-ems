import 'package:ems/app/core/core_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TrailsProfileName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CoreController _coreController = Modular.get<CoreController>();

    return Text(
      _coreController.currentUser.name,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
