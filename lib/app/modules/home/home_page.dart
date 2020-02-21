import 'package:ems/app/modules/home/widgets/tabs/home_tab/home_tab.dart';
import 'package:ems/app/shared/widgets/drawer/default_drawer.dart';
import 'package:ems/app/shared/widgets/tabbar/default_tabbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TabController _tabController;
  int _lastIndexTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
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
            Icon(Icons.supervisor_account),
            Icon(Icons.redeem),
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
