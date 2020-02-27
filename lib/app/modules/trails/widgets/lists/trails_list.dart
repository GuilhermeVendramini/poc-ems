import 'package:ems/app/shared/models/trail_model.dart';
import 'package:ems/app/shared/models/trails_model.dart';
import 'package:ems/app/shared/widgets/components/titles/default_block_title.dart';
import 'package:flutter/material.dart';

class TrailsList extends StatefulWidget {
  final List<TrailsModel> trails;

  TrailsList({@required this.trails});

  @override
  _TrailsListState createState() => _TrailsListState();
}

class _TrailsListState extends State<TrailsList> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.96);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.trails == null || widget.trails.isEmpty) {
      return Center(
        child: Text('Trilha vazia'),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(20.0),
      itemCount: widget.trails.length,
      itemBuilder: (_, int index) {
        return Container(
          margin: EdgeInsets.only(bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DefaultBlockTitle(text: widget.trails[index].title),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 240.0,
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.trails[index].trails.length,
                  itemBuilder: (_, int indexTrail) {
                    TrailModel trail = widget.trails[index].trails[indexTrail];
                    return Text(trail.title);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
