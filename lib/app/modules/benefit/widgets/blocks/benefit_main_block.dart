import 'package:ems/app/shared/models/benefit_model.dart';
import 'package:ems/app/shared/widgets/appbar/default_sliver_appbar.dart';
import 'package:ems/app/shared/widgets/components/body/default_body.dart';
import 'package:ems/app/shared/widgets/components/titles/default_block_title.dart';
import 'package:flutter/material.dart';

class BenefitMainBlock extends StatelessWidget {
  final BenefitModel benefit;

  BenefitMainBlock({@required this.benefit});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: DefaultSliverAppBar(
            expandedHeight: 400,
            title: benefit.title,
            imagePath: benefit.image,
          ),
          pinned: true,
        ),
        SliverPadding(
          padding: EdgeInsets.all(20.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              DefaultBlockTitle(
                text: benefit.title,
              ),
              SizedBox(
                height: 20.0,
              ),
              DefaultBody(
                text: benefit.body,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
