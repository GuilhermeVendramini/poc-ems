import 'package:ems/app/modules/events/modules/event/event_controller.dart';
import 'package:ems/app/modules/events/modules/event/event_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';

class EventModule extends ChildModule {

  @override
  List<Bind> get binds => [
    Bind((i) => EventController()),
  ];

  @override
  List<Router> get routers => [
    Router(
      '/:id',
      child: (_, args) => I18n(
        child: EventPage(
          id: args.params['id'],
        ),
      ),
    ),
  ];

  static Inject get to => Inject<EventModule>.of();
}