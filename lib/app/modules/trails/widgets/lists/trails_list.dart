import 'package:ems/app/modules/trails/widgets/cards/trail_card.dart';
import 'package:ems/app/shared/models/trail_model.dart';
import 'package:ems/app/shared/models/trails_model.dart';
import 'package:ems/app/shared/widgets/components/dots_indicator/zoom_dots_indicator.dart';
import 'package:ems/app/shared/widgets/components/titles/default_block_title.dart';
import 'package:flutter/material.dart';

class TrailsList extends StatelessWidget {
  final List<TrailsModel> trails;

  TrailsList({@required this.trails});

  @override
  Widget build(BuildContext context) {
    if (trails == null || trails.isEmpty) {
      return Center(
        child: Text('Trilha vazia'),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(20.0),
      itemCount: trails.length,
      itemBuilder: (_, int index) {
        PageController _pageController = PageController(viewportFraction: 0.96);
        return Container(
          margin: EdgeInsets.only(bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DefaultBlockTitle(text: trails[index].title),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 300.0,
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: trails[index].trails.length,
                  itemBuilder: (_, int indexTrail) {
                    TrailModel trail = trails[index].trails[indexTrail];
                    return TrailCard(
                      id: trails[index].id,
                      trail: trail,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ZoomDotsIndicator(
                controller: _pageController,
                itemCount: trails[index].trails.length,
                color: Colors.blueAccent,
                onPageSelected: (int page) {
                  _pageController.animateToPage(
                    page,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
