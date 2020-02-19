import 'package:ems/app/shared/models/event_model.dart';
import 'package:ems/app/shared/widgets/cards/event_card.dart';
import 'package:flutter/material.dart';

class HorizontalPageViewEvents extends StatefulWidget {

  final List<EventModel> events;

  HorizontalPageViewEvents({@required this.events});

  @override
  _HorizontalPageViewEventsState createState() => _HorizontalPageViewEventsState();
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
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      itemCount: widget.events.length,
      itemBuilder: (BuildContext context, int index) {
        return EventCard(
          event: widget.events[index],
        );
      },
    );
  }
}
