import 'package:cached_network_image/cached_network_image.dart';
import 'package:ems/app/shared/models/module_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TrailModuleCard extends StatelessWidget {
  final ModuleModel module;

  TrailModuleCard({@required this.module});

  @override
  Widget build(BuildContext context) {
    Color _cardColor = Colors.white;
    Color _iconColor = Colors.blueAccent;
    Widget _lock = Container();

    if (!module.enabled) {
      _cardColor = Colors.grey[200];
      _iconColor = Colors.grey;
      _lock = const Icon(
        Icons.lock_outline,
        color: Colors.white,
        size: 60.0,
      );
    }

    return Card(
      color: _cardColor,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: module.enabled
            ? () {
                Modular.to.pushNamed('/module/${module.id}');
              }
            : null,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CachedNetworkImage(
                      height: 80.0,
                      imageUrl: module.image,
                      colorBlendMode: module.enabled ? null : BlendMode.color,
                      color: module.enabled ? null : Colors.grey,
                    ),
                    _lock,
                  ],
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Container(
                  height: 80.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        module.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.stars,
                            color: Colors.blueAccent,
                            size: 14.0,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Text(
                            module.score.toString(),
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: _iconColor,
                size: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
