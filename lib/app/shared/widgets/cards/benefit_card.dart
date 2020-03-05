import 'package:cached_network_image/cached_network_image.dart';
import 'package:ems/app/shared/models/benefit_model.dart';
import 'package:ems/app/shared/widgets/components/titles/default_block_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BenefitCard extends StatelessWidget {
  final BenefitModel benefit;

  BenefitCard({@required this.benefit});

  Widget _benefitsStatus() {
    String _text = 'Disponível';
    Color _color = Colors.blueAccent;

    if (benefit.status != 1) {
      _text = 'Pontos insuficientes';
      _color = Colors.grey;
    }
    return Text(
      _text,
      style: TextStyle(color: _color, fontWeight: FontWeight.w600),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color _cardColor = Colors.white;
    Color _iconColor = Colors.deepOrangeAccent;
    Widget _lock = Container();

    if (benefit.status != 1) {
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
        onTap: benefit.status == 1
            ? () {
                Modular.to.pushNamed('/benefit/${benefit.id}');
              }
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
                    image: DecorationImage(
                      colorFilter: benefit.status != 1
                          ? ColorFilter.mode(Colors.grey, BlendMode.color)
                          : null,
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(benefit.image),
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
                            Icons.offline_bolt,
                            color: _iconColor,
                            size: 16.0,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Text(
                            benefit.score.toString(),
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
                _lock,
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _benefitsStatus(),
                  SizedBox(
                    height: 10.0,
                  ),
                  DefaultBlockTitle(
                    text: benefit.title,
                    maxLines: 1,
                    fontSize: 16.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
