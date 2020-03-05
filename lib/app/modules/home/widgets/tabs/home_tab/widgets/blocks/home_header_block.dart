import 'package:ems/app/modules/home/widgets/tabs/home_tab/widgets/components/header/home_header_content.dart';
import 'package:ems/app/shared/widgets/components/search/default_search.dart';
import 'package:flutter/material.dart';

class HomeHeaderBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    double _screenWidth = _screenSize.width;

    return Container(
      height: 360.0,
      child: Stack(
        children: <Widget>[
          HomeHeaderContent(),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
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
          ),
        ],
      ),
    );
  }
}
