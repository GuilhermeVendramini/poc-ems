import 'package:ems/app/shared/widgets/appbar/simple_sliver_app_bar.dart';
import 'package:flutter/material.dart';

class AgentsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: NestedScrollView(
        headerSliverBuilder: (_, __) {
          return <Widget>[
            SimpleSliverAppBar(
              title: 'REPRESENTANTES',
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Text('Header'),
                SizedBox(
                  height: 20.0,
                ),
              Text('Sub Header'),
                SizedBox(
                  height: 20.0,
                ),
              ]),
            ),
          ];
        },
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Text('Body'),
          ],
        ),
      ),
    );
  }
}
