import 'package:cached_network_image/cached_network_image.dart';
import 'package:ems/app/modules/trails/widgets/components/containers/trail_status_container.dart';
import 'package:ems/app/shared/models/trail_model.dart';
import 'package:ems/app/shared/widgets/components/titles/default_block_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TrailCard extends StatelessWidget {
  final TrailModel trail;

  TrailCard({@required this.trail});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () {
          Modular.to.pushNamed('/trail/${trail.id}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(trail.image),
                ),
              ),
              height: 150.0,
              child: FittedBox(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(4.0),
                  margin: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(
                        Icons.stars,
                        color: Colors.blue,
                        size: 16.0,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        trail.score.toString(),
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DefaultBlockTitle(
                    text: trail.title,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${trail.modules.length} módulos',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            TrailStatusContainer(
              status: trail.status,
            ),
          ],
        ),
      ),
    );
  }
}
