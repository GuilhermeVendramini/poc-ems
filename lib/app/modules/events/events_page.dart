import 'package:ems/app/shared/widgets/calendar/default_calendar.dart';
import 'package:ems/app/shared/widgets/components/titles/default_page_title.dart';
import 'package:ems/app/shared/widgets/drawer/default_drawer.dart';
import 'package:ems/app/shared/widgets/tabbar/default_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TabController _tabController;
  CalendarController _calendarController;
  Map<DateTime, List> _events;
  List _selectedEvents;
  DateTime _currentDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5, initialIndex: 4);
    _tabController.addListener(_handleTabSelection);
    _calendarController = CalendarController();

    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Event A0',
        'Event B0',
        'Event C0'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2'
      ],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Event A5',
        'Event B5',
        'Event C5',
        'Event C5',
        'Event C5',
        'Event C5',
      ],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 1)): [
        'Event A88',
        'Event B8',
        'Event C8',
        'Event D81',
        'Event D9',
        'Event D10',
      ],
      _selectedDay.add(Duration(days: 3)):
          Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): [
        'Event A12',
        'Event B12',
        'Event C12',
        'Event D12',
      ],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): [
        'Event A14',
        'Event B14',
        'Event C14'
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
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

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedEvents = events;

      if (DateFormat.yMMMd().format(_currentDay) ==
          DateFormat.yMMMd().format(day)) {
        print('mesmo dia');
        _calendarController.setSelectedDay(DateTime.now());
      } else {
        print('outro dia');
        _currentDay = day;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DefaultDrawer(),
      body: SingleChildScrollView(
        child: Column(
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
                  DefaultCalendar(
                    calendarController: _calendarController,
                    onDaySelected: _onDaySelected,
                    events: _events,
                  ),
                ],
              ),
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: _selectedEvents
                  .map((event) => Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.8),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: ListTile(
                          title: Text(event.toString()),
                          onTap: () => print('$event tapped!'),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DefaultTabBar(
        scaffoldKey: _scaffoldKey,
        tabController: _tabController,
      ),
    );
  }
}
