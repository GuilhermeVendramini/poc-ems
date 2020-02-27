import 'package:ems/app/core/core_initial_controller.dart';
import 'package:ems/app/shared/widgets/buttons/default_see_more_button.dart';
import 'package:ems/app/shared/widgets/components/titles/default_block_title.dart';
import 'package:ems/app/shared/widgets/lists/events/horizontal_pageview_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeNextEventsBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CoreInitialController _coreInitialController =
        Modular.get<CoreInitialController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            DefaultBlockTitle(
              text: 'Próximos eventos',
            ),
            Observer(
              builder: (_) {
                if (_coreInitialController.events != null &&
                    _coreInitialController.events.length > 4) {
                  return DefaultSeeMoreButton(
                    text: 'Ver mais >',
                    onPressed: () {},
                  );
                }
                return Container();
              },
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Observer(
          builder: (_) {
            switch (_coreInitialController.eventsStatus) {
              case EventsStatus.IDLE:
              case EventsStatus.LOADING:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case EventsStatus.ERROR:
                return Container();
                break;
              case EventsStatus.DONE:
              default:
                if (_coreInitialController.events != null &&
                    _coreInitialController.events.length > 0) {
                  return Container(
                    height: 320.0,
                    child: HorizontalPageViewEvents(
                      events: _coreInitialController.events,
                    ),
                  );
                }
                return Text('Nenhum evento no momento');
                break;
            }
          },
        ),
      ],
    );
  }
}
