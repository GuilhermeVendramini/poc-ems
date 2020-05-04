import 'package:ems/app/core/core_initial_controller.dart';
import 'package:ems/app/modules/home/widgets/tabs/agents_tab/agents_tab.dart';
import 'package:ems/app/modules/home/widgets/tabs/benefits_tab/benefits_tab.dart';
import 'package:ems/app/modules/home/widgets/tabs/home_tab/home_tab.dart';
import 'package:ems/app/shared/widgets/drawer/default_drawer.dart';
import 'package:ems/app/shared/widgets/tabbar/default_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  CoreInitialController _coreInitialController;
  TabController _tabController;
  int _lastIndexTab;

  @override
  void initState() {
    super.initState();
    _coreInitialController = Modular.get<CoreInitialController>();
    _lastIndexTab = _coreInitialController.initialIndexTab;
    _tabController = TabController(
        vsync: this,
        length: 5,
        initialIndex: _coreInitialController.initialIndexTab);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.index != 4) {
      _lastIndexTab = _tabController.index;
    } else {
      _tabController.index = _lastIndexTab;
      _scaffoldKey.currentState.openEndDrawer();
    }
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
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeTab(),
            Icon(Icons.favorite),
            AgentsTab(),
            BenefitsTab(),
            Container(),
          ],
        ),
        bottomNavigationBar: DefaultTabBar(
          scaffoldKey: _scaffoldKey,
          tabController: _tabController,
        ),
      ),
    );
  }
}
