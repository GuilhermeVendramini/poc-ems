import 'package:ems/app/modules/events/events_controller.dart';
import 'package:ems/app/modules/events/widgets/blocks/events_block.dart';
import 'package:ems/app/shared/widgets/calendar/default_calendar.dart';
import 'package:ems/app/shared/widgets/components/titles/default_page_title.dart';
import 'package:ems/app/shared/widgets/drawer/default_drawer.dart';
import 'package:ems/app/shared/widgets/tabbar/default_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  EventsController _eventsController;

  TabController _tabController;
  CalendarController _calendarController;
  DateTime _currentDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _eventsController = Modular.get<EventsController>();
    _tabController = TabController(vsync: this, length: 5, initialIndex: 4);
    _tabController.addListener(_handleTabSelection);
    _calendarController = CalendarController();
  }

  void _handleTabSelection() {
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

  void _onDaySelected(DateTime dateTime, List events) {
    setState(() {
      if (DateFormat.yMMMd().format(_currentDay) ==
          DateFormat.yMMMd().format(dateTime)) {
        _calendarController.setSelectedDay(DateTime.now());
        _eventsController.filterEvents();
      } else {
        _eventsController.filterEvents(dateTime: dateTime);
        _currentDay = dateTime;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
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
                          Observer(
                            builder: (_) {
                              return DefaultCalendar(
                                calendarController: _calendarController,
                                onDaySelected: _onDaySelected,
                                events: _eventsController.getCalendarEvents(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    EventsBlock(),
                  ],
                ),
              );
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
    );
  }
}
