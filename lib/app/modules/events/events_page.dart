import 'package:ems/app/shared/widgets/drawer/default_drawer.dart';
import 'package:ems/app/shared/widgets/tabbar/default_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5, initialIndex: 4);
    _tabController.addListener(_handleTabSelection);
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DefaultDrawer(),
      body: Center(
        child: Text('Events'),
      ),
      bottomNavigationBar: DefaultTabBar(
        scaffoldKey: _scaffoldKey,
        tabController: _tabController,
      ),
    );
  }
}
