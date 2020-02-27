import 'package:ems/app/modules/trails/widgets/blocks/trails_header_block.dart';
import 'package:ems/app/shared/utils/handle_tab_selection/defaultHandleTabSelection.dart';
import 'package:ems/app/shared/widgets/drawer/default_drawer.dart';
import 'package:ems/app/shared/widgets/tabbar/default_tabbar.dart';
import 'package:flutter/material.dart';

class TrailsPage extends StatefulWidget {
  @override
  _TrailsPageState createState() => _TrailsPageState();
}

class _TrailsPageState extends State<TrailsPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;
  TabController _trailsTabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5, initialIndex: 4);
    _trailsTabController = TabController(vsync: this, length: 2);
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
    _trailsTabController.dispose();
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
        body: NestedScrollView(
          headerSliverBuilder: (_, __) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  TrailsHeaderBlock(),
                  TabBar(
                    controller: _trailsTabController,
                    unselectedLabelColor: Colors.grey[400],
                    labelColor: Colors.blueAccent,
                    tabs: [
                      Tab(child: Text('Negócio')),
                      Tab(child: Text('Carreira')),
                    ],
                  ),
                ]),
              ),
            ];
          },
          body: TabBarView(
            controller: _trailsTabController,
            children: <Widget>[
              Text('Tab 1'),
              Icon(Icons.work),
            ],
          ),
        ),
        bottomNavigationBar: DefaultTabBar(
          scaffoldKey: _scaffoldKey,
          tabController: _tabController,
        ),
      ),
    );
  }
}
