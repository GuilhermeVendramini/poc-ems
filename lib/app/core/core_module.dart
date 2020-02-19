import 'package:ems/app/core/core_controller.dart';
import 'package:ems/app/core/core_initial_controller.dart';
import 'package:ems/app/core/core_widget.dart';
import 'package:ems/app/core/widgets/pages/intro/core_intro.dart';
import 'package:ems/app/core/widgets/pages/splash/core_splash_page.dart';
import 'package:ems/app/modules/auth/login/login_module.dart';
import 'package:ems/app/modules/auth/recovery_password/recovery_password_module.dart';
import 'package:ems/app/modules/auth/register/register_module.dart';
import 'package:ems/app/modules/events/events_module.dart';
import 'package:ems/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CoreController()),
        Bind((i) => CoreInitialController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CoreSplashPage()),
        Router('/intro', child: (_, args) => CoreIntro()),
        Router('/home', module: HomeModule()),
        Router('/login', module: LoginModule()),
        Router('/register', module: RegisterModule()),
        Router('/recovery', module: RecoveryPasswordModule()),
        Router('/events', module: EventsModule()),
      ];

  static Inject get to => Inject<CoreModule>.of();

  @override
  Widget get bootstrap => CoreWidget();
}
