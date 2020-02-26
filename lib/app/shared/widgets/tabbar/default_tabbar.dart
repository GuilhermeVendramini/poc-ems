import 'package:ems/app/shared/widgets/tabs/defaultTab.dart';
import 'package:flutter/material.dart';

class DefaultTabBar extends StatelessWidget {
  final TabController tabController;
  final GlobalKey<ScaffoldState> scaffoldKey;

  DefaultTabBar({@required this.scaffoldKey, @required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      labelColor: Colors.indigo,
      tabs: [
        DefaultTab(
          icon: Icons.home,
          text: 'Home',
        ),
        DefaultTab(
          icon: Icons.favorite,
          text: 'Favoritos',
        ),
        DefaultTab(
          icon: Icons.supervisor_account,
          text: 'Representante',
        ),
        DefaultTab(
          icon: Icons.redeem,
          text: 'Benefícios',
        ),
        GestureDetector(
          onTap: () => scaffoldKey.currentState.openEndDrawer(),
          child: SizedBox(
            width: double.infinity,
            child: Container(
              color: Colors.transparent,
              child: DefaultTab(
                icon: Icons.menu,
                text: 'Mais',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
