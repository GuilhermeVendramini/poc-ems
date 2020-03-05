import 'package:ems/app/modules/home/widgets/tabs/benefits_tab/widgets/components/header/benefits_header_content.dart';
import 'package:ems/app/modules/home/widgets/tabs/benefits_tab/widgets/components/header/benefits_header_wallet.dart';
import 'package:flutter/material.dart';

class BenefitsHeaderBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    double _screenWidth = _screenSize.width;

    return Container(
      height: 300.0,
      child: Stack(
        children: <Widget>[
          BenefitsHeaderContent(),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80.0,
                width: _screenWidth * 0.70,
                child: BenefitsHeaderWallet(),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
