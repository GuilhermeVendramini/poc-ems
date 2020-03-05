import 'package:ems/app/modules/home/widgets/tabs/benefits_tab/widgets/blocks/benefits_header_block.dart';
import 'package:ems/app/modules/home/widgets/tabs/benefits_tab/widgets/blocks/benefits_main_block.dart';
import 'package:ems/app/modules/home/widgets/tabs/benefits_tab/widgets/blocks/benefits_points_block.dart';
import 'package:ems/app/shared/widgets/appbar/simple_sliver_app_bar.dart';
import 'package:flutter/material.dart';

class BenefitsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (_, __) {
          return <Widget>[
            SimpleSliverAppBar(
              title: 'BENEFÍCIOS',
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                BenefitsHeaderBlock(),
                SizedBox(
                  height: 20.0,
                ),
                BenefitsPointsBlock(),
                SizedBox(
                  height: 20.0,
                ),
                TabBar(
                  unselectedLabelColor: Colors.grey[400],
                  labelColor: Colors.blueAccent,
                  tabs: [
                    const Tab(child: const Text('Cupons')),
                    const Tab(child: const Text('Meus cupons')),
                  ],
                ),
              ]),
            ),
          ];
        },
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            BenefitsMainBlock(),
            const Icon(
              Icons.redeem,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
