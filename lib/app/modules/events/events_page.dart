import 'package:ems/app/modules/events/events_controller.dart';
import 'package:ems/app/modules/events/widgets/blocks/events_main_block.dart';
import 'package:ems/app/shared/utils/handle_tab_selection/defaultHandleTabSelection.dart';
import 'package:ems/app/shared/widgets/drawer/default_drawer.dart';
import 'package:ems/app/shared/widgets/tabbar/default_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  EventsController _eventsController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _eventsController = Modular.get<EventsController>();
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: DefaultDrawer(),
        body: Observer(
          builder: (_) {
            switch (_eventsController.eventsStatus) {
              case EventsStatus.LOADING:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case EventsStatus.ERROR:
                return Center(
                  child: Text('Erro ao carregar os eventos'),
                );
                break;
              case EventsStatus.DONE:
                return EventsMainBlock();
                break;
              case EventsStatus.IDLE:
              default:
                return Container();
                break;
            }
          },
        ),
        bottomNavigationBar: DefaultTabBar(
          scaffoldKey: _scaffoldKey,
          tabController: _tabController,
        ),
      ),
    );
  }
}
