import 'package:ems/app/shared/widgets/calendar/default_calendar.dart';
import 'package:ems/app/shared/widgets/components/titles/default_page_title.dart';
import 'package:ems/app/shared/widgets/drawer/default_drawer.dart';
import 'package:ems/app/shared/widgets/tabbar/default_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TabController _tabController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5, initialIndex: 4);
    _tabController.addListener(_handleTabSelection);
    _calendarController = CalendarController();
  }

  void _handleTabSelection() {
    print(_tabController.index);
    switch (_tabController.index) {
      case 4:
        _scaffoldKey.currentState.openEndDrawer();
        break;
      case 0:
        Modular.to.pushReplacementNamed('/home');
        break;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DefaultDrawer(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(60.0),
            ),
            gradient: LinearGradient(
              colors: [Colors.blue[900], Colors.indigo[900]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              DefaultPageTitle(
                text: 'Eventos',
              ),
              DefaultCalendar(
                calendarController: _calendarController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DefaultTabBar(
        scaffoldKey: _scaffoldKey,
        tabController: _tabController,
      ),
    );
  }
}
