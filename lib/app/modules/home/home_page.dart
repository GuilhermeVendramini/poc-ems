import 'package:ems/app/shared/widgets/tabs/defaultTab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_bike),
          ],
        ),
        bottomNavigationBar: TabBar(
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
            DefaultTab(
              icon: Icons.menu,
              text: 'Mais',
            ),
          ],
        ),
      ),
    );
  }
}
