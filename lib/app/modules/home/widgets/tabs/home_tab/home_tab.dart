import 'package:ems/app/modules/home/widgets/tabs/home_tab/widgets/blocks/home_header_block.dart';
import 'package:ems/app/modules/home/widgets/tabs/home_tab/widgets/blocks/home_next_events_block.dart';
import 'package:ems/app/shared/widgets/appbar/simple_sliver_app_bar.dart';
import 'package:ems/app/shared/widgets/buttons/default_icon_button.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SimpleSliverAppBar(
          title: 'EDUCARDIO',
          leading: DefaultIconButton(
            icon: Icons.person,
            iconColor: Colors.white,
            onPressed: () {},
          ),
          action: DefaultIconButton(
            icon: Icons.notifications,
            iconColor: Colors.white,
            onPressed: () {},
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            HomeHeaderBlock(),
          ]),
        ),
        SliverPadding(
          padding: EdgeInsets.all(20.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              HomeNextEventsBlock(),
            ]),
          ),
        ),
      ],
    );
  }
}
