import 'package:ems/app/modules/home/widgets/tabs/home_tab/widgets/components/header/home_header_content.dart';
import 'package:ems/app/shared/widgets/buttons/default_icon_button.dart';
import 'package:ems/app/shared/widgets/components/logo/default_logo_title.dart';
import 'package:ems/app/shared/widgets/components/search/default_search.dart';
import 'package:flutter/material.dart';

class HomeHeaderBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    double _screenWidth = _screenSize.width;

    return Container(
      height: 380.0,
      child: Stack(
        children: <Widget>[
          HomeHeaderContent(),
          Positioned(
            top: 30.0,
            left: 10.0,
            child: DefaultIconButton(
              icon: Icons.person,
              iconColor: Colors.white,
              action: () {},
            ),
          ),
          Positioned(
            top: 40.0,
            right: 00.0,
            left: 00.0,
            child: DefaultLogoTitle(),
          ),
          Positioned(
            top: 30.0,
            right: 10.0,
            child: DefaultIconButton(
              icon: Icons.notifications,
              iconColor: Colors.white,
              action: () {},
            ),
          ),
          Positioned(
            top: 280.0,
            child: Container(
              padding: EdgeInsets.all(10.0),
              height: 80.0,
              width: _screenWidth,
              child: DefaultSearch(
                onTap: () {},
                hintText: 'Buscar...',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
