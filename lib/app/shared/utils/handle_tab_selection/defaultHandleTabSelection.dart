import 'package:ems/app/core/core_initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

defaultHandleTabSelection({
  @required TabController tabController,
  @required GlobalKey<ScaffoldState> scaffoldKey,
}) {
  CoreInitialController _coreInitialController =
      Modular.get<CoreInitialController>();
  switch (tabController.index) {
    case 3:
      _coreInitialController.initialIndexTab = 3;
      Modular.to.pushReplacementNamed('/home');
      break;
    case 4:
      scaffoldKey.currentState.openEndDrawer();
      break;
    case 0:
      _coreInitialController.initialIndexTab = 0;
      Modular.to.pushReplacementNamed('/home');
      break;
  }
}
