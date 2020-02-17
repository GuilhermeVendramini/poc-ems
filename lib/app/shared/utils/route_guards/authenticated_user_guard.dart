import 'package:ems/app/core/core_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenticatedUserGuard implements RouteGuard {
  CoreController _coreController = Modular.get<CoreController>();

  @override
  bool canActivate(String url) {
    if (_coreController.currentUser != null) {
      return true;
    }

    return false;
  }
}
