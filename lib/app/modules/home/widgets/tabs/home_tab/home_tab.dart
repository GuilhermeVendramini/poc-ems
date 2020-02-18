import 'package:ems/app/modules/home/widgets/tabs/home_tab/widgets/blocks/home_header_block.dart';
import 'package:ems/app/modules/home/widgets/tabs/home_tab/widgets/blocks/home_next_events_block.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HomeHeaderBlock(),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                HomeNextEventsBlock(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
