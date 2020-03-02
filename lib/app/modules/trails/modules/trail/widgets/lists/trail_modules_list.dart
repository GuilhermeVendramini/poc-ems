import 'package:flutter/material.dart';

class TrailModulesList extends StatelessWidget {
  final List<int> modules;

  TrailModulesList({@required this.modules});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: modules.length,
      itemBuilder: (_, int index) {
        return Container(
          height: 300.0,
          child: Text(modules[index].toString()),
        );
      },
    );
  }
}
