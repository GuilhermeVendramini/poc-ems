import 'package:ems/app/modules/home/widgets/tabs/benefits_tab/widgets/blocks/benefits_main_block.dart';
import 'package:ems/app/shared/widgets/appbar/simple_sliver_app_bar.dart';
import 'package:flutter/material.dart';

class BenefitsTab extends StatefulWidget {
  @override
  _BenefitsTabState createState() => _BenefitsTabState();
}

class _BenefitsTabState extends State<BenefitsTab>
    with TickerProviderStateMixin {
  TabController _benefitsTabController;

  @override
  void initState() {
    super.initState();
    _benefitsTabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _benefitsTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (_, __) {
        return <Widget>[
          SimpleSliverAppBar(
            title: 'BENEFÍCIOS',
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Text('HEADER'),
              TabBar(
                controller: _benefitsTabController,
                unselectedLabelColor: Colors.grey[400],
                labelColor: Colors.blueAccent,
                tabs: [
                  Tab(child: Text('Cupons')),
                  Tab(child: Text('Meus cupons')),
                ],
              ),
            ]),
          ),
        ];
      },
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _benefitsTabController,
        children: <Widget>[
          BenefitsMainBlock(),
          Icon(
            Icons.redeem,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
