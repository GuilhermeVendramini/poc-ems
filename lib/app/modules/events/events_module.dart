import 'package:ems/app/modules/events/events_controller.dart';
import 'package:ems/app/modules/events/events_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';

class EventsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => EventsController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (_, args) => I18n(
            child: EventsPage(),
          ),
        ),
      ];

  static Inject get to => Inject<EventsModule>.of();
}
