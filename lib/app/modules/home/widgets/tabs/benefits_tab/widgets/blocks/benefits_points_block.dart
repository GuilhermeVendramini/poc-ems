import 'package:ems/app/modules/home/widgets/tabs/benefits_tab/widgets/components/profile/benefits_profile_available_coupons.dart';
import 'package:ems/app/modules/home/widgets/tabs/benefits_tab/widgets/components/profile/benefits_profile_points.dart';
import 'package:ems/app/modules/home/widgets/tabs/benefits_tab/widgets/components/profile/benefits_profile_used_coupons.dart';
import 'package:ems/app/shared/widgets/components/dividers/default_vertical_divider.dart';
import 'package:flutter/material.dart';

class BenefitsPointsBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BenefitsProfilePoints(),
          DefaultVerticalDivider(),
          BenefitsProfileAvailableCoupons(),
          DefaultVerticalDivider(),
          BenefitsProfileUsedCoupons(),
        ],
      ),
    );
  }
}
