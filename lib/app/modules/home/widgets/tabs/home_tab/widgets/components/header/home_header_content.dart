import 'package:ems/app/shared/widgets/buttons/default_raised_button.dart';
import 'package:flutter/material.dart';

class HomeHeaderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    double _screenWidth = _screenSize.width;

    return Container(
      padding: EdgeInsets.all(20.0),
      height: 340.0,
      width: _screenWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/minimalist_person.png'),
          //fit: BoxFit.fitHeight,
          alignment: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(60.0),
        ),
        color: Colors.blue,
        gradient: LinearGradient(
          colors: [Colors.blue[900], Colors.indigo[900]],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Alavanque sua carreira e seu negócio',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'As trilhas podem \nte ajudar.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          DefaultRaisedButton(
            text: 'Começar',
            textColor: Colors.white,
            buttonColor: Colors.lightBlue,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
