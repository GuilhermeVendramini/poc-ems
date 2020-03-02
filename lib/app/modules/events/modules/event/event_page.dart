import 'package:ems/app/modules/events/modules/event/event_controller.dart';
import 'package:ems/app/modules/events/modules/event/widgets/blocks/event_main_block.dart';
import 'package:ems/app/shared/models/event_model.dart';
import 'package:ems/app/shared/utils/handle_tab_selection/defaultHandleTabSelection.dart';
import 'package:ems/app/shared/widgets/buttons/default_raised_button.dart';
import 'package:ems/app/shared/widgets/drawer/default_drawer.dart';
import 'package:ems/app/shared/widgets/tabbar/default_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EventPage extends StatefulWidget {
  final String id;

  EventPage({@required this.id});

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  EventController _eventController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _eventController = Modular.get<EventController>();
    _eventController.loadEventById(widget.id);
    _tabController = TabController(vsync: this, length: 5, initialIndex: 4);
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    defaultHandleTabSelection(
      scaffoldKey: _scaffoldKey,
      tabController: _tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DefaultDrawer(),
      body: Observer(
        builder: (_) {
          switch (_eventController.eventStatus) {
            case EventStatus.LOADING:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case EventStatus.ERROR:
              return Center(
                child: Text('Erro ao carregar evento'),
              );
              break;
            case EventStatus.DONE:
              EventModel _event = _eventController.event;
              return _event != null
                  ? SingleChildScrollView(
                      child: EventMainBlock(
                        event: _event,
                      ),
                    )
                  : Container();
              break;
            case EventStatus.IDLE:
            default:
              return Container();
              break;
          }
        },
      ),
      floatingActionButton: DefaultRaisedButton(
        buttonColor: Colors.blueAccent,
        textColor: Colors.white,
        text: 'Tenho interesse',
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: DefaultTabBar(
        scaffoldKey: _scaffoldKey,
        tabController: _tabController,
      ),
    );
  }
}
