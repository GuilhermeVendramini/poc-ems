import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

defaultHandleTabSelection({
  @required TabController tabController,
  @required GlobalKey<ScaffoldState> scaffoldKey,
}) {
  switch (tabController.index) {
    case 4:
      scaffoldKey.currentState.openEndDrawer();
      break;
    case 0:
      Modular.to.pushReplacementNamed('/home');
      break;
  }
}
