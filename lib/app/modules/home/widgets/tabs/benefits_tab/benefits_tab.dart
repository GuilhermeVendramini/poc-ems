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
              const Text('HEADER'),
              TabBar(
                controller: _benefitsTabController,
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
        controller: _benefitsTabController,
        children: <Widget>[
          BenefitsMainBlock(),
          const Icon(
            Icons.redeem,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
