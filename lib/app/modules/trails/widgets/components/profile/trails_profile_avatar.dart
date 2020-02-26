import 'package:cached_network_image/cached_network_image.dart';
import 'package:ems/app/core/core_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TrailsProfileAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CoreController _coreController = Modular.get<CoreController>();

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(
          height: 120.0,
        ),
        CircleAvatar(
          radius: 50.0,
          backgroundImage:
              CachedNetworkImageProvider(_coreController.currentUser.image),
        ),
        SizedBox(
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            backgroundColor: Colors.amber[50],
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.amber,
            ),
            value: 0.8,
          ),
          height: 105.0,
          width: 105.0,
        ),
        Positioned(
          top: 00.0,
          child: Container(
            padding: EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Icons.stars,
              color: Colors.amber,
              size: 14.0,
            ),
          ),
        ),
      ],
    );
  }
}
