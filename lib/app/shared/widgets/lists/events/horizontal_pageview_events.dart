import 'package:ems/app/shared/models/event_model.dart';
import 'package:ems/app/shared/widgets/cards/event_card.dart';
import 'package:ems/app/shared/widgets/components/dots_indicator/zoom_dots_indicator.dart';
import 'package:flutter/material.dart';

class HorizontalPageViewEvents extends StatefulWidget {
  final List<EventModel> events;

  HorizontalPageViewEvents({@required this.events});

  @override
  _HorizontalPageViewEventsState createState() =>
      _HorizontalPageViewEventsState();
}

class _HorizontalPageViewEventsState extends State<HorizontalPageViewEvents> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.95,
    );

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int eventsLength = widget.events.length >= 4 ? 4 : widget.events.length;

    return Column(
      children: <Widget>[
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: eventsLength,
            itemBuilder: (BuildContext context, int index) {
              return EventCard(
                event: widget.events[index],
              );
            },
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        ZoomDotsIndicator(
          controller: _pageController,
          itemCount: eventsLength,
          color: Colors.indigo,
          onPageSelected: (int page) {
            _pageController.animateToPage(
              page,
              duration: Duration(milliseconds: 100),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }
}
