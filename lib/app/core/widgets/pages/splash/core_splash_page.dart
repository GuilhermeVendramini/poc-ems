import 'package:ems/app/core/core_controller.dart';
import 'package:ems/app/core/core_initial_controller.dart';
import 'package:ems/app/shared/widgets/components/logo/default_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';

class CoreSplashPage extends StatefulWidget {
  @override
  _CoreSplashPageState createState() => _CoreSplashPageState();
}

class _CoreSplashPageState extends State<CoreSplashPage> {
  CoreController _coreController;
  CoreInitialController _coreInitialController;

  @override
  void initState() {
    _coreController = Modular.get<CoreController>();
    _coreInitialController = Modular.get<CoreInitialController>();
    _coreController.loadCurrentUser().then((_) {
      if (_coreController.currentUser != null) {
        _coreInitialController.loadContents();
        Modular.to.pushReplacementNamed('/home');
      } else {
        Modular.to.pushReplacementNamed('/intro');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return I18n(
      child: Scaffold(
        body: Center(
          child: Observer(
            builder: (_) {
              switch (_coreController.userLoadStatus) {
                case UserLoadStatus.LOADING:
                  return CircularProgressIndicator();
                  break;
                case UserLoadStatus.ERROR:
                  return Text(_coreController.messageStatus);
                  break;
                case UserLoadStatus.DONE:
                case UserLoadStatus.IDLE:
                default:
                  return DefaultLogo();
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}
