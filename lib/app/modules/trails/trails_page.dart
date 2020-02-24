import 'package:ems/app/modules/trails/widgets/blocks/trails_profile_box.dart';
import 'package:ems/app/shared/utils/handle_tab_selection/defaultHandleTabSelection.dart';
import 'package:ems/app/shared/widgets/components/titles/default_page_title.dart';
import 'package:ems/app/shared/widgets/drawer/default_drawer.dart';
import 'package:ems/app/shared/widgets/tabbar/default_tabbar.dart';
import 'package:flutter/material.dart';

class TrailsPage  extends StatefulWidget {
  @override
  _TrailsPageState createState() => _TrailsPageState();
}

class _TrailsPageState extends State<TrailsPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
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
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                height: 160.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[900], Colors.indigo[900]],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    DefaultPageTitle(
                      text: 'Trilhas',
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TrailsProfileBox(),
                  ],
                ),
              ),
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
