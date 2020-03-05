import 'package:cached_network_image/cached_network_image.dart';
import 'package:ems/app/core/core_controller.dart';
import 'package:ems/app/modules/home/widgets/tabs/benefits_tab/widgets/components/profile/benefits_profile_level.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BenefitsHeaderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CoreController _coreController = Modular.get<CoreController>();

    return Container(
      padding: EdgeInsets.all(20.0),
      height: 260.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(60.0),
        ),
        gradient: LinearGradient(
          colors: [Colors.blue[900], Colors.indigo[900]],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage:
                CachedNetworkImageProvider(_coreController.currentUser.image),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            _coreController.currentUser.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10.0,
          ),
          BenefitsProfileLevel(),
        ],
      ),
    );
  }
}
