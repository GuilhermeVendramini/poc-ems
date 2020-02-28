import 'package:flutter/material.dart';

class TrailStatusContainer extends StatefulWidget {
  final int status;

  TrailStatusContainer({@required this.status});

  @override
  _TrailStatusContainerState createState() => _TrailStatusContainerState();
}

class _TrailStatusContainerState extends State<TrailStatusContainer> {
  String text;
  Color textColor = Colors.white;
  Color buttonColor = Colors.blueAccent;

  @override
  void initState() {
    switch (widget.status) {
      case 1:
        text = 'Finalizado';
        break;
      case 2:
        text = 'Em progresso';
        textColor = Colors.blueAccent;
        buttonColor = Colors.transparent;
        break;
      case 3:
      default:
        text = 'Bloqueado';
        buttonColor = Colors.grey[400];
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(10.0),
        bottomLeft: Radius.circular(10.0),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[200],
            ),
          ),
          color: buttonColor,
        ),
        width: double.infinity,
        height: 40.0,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
