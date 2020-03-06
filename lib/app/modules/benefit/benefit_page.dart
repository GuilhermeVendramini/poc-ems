import 'package:ems/app/modules/benefit/benefit_controller.dart';
import 'package:ems/app/modules/benefit/widgets/blocks/benefit_main_block.dart';
import 'package:ems/app/shared/models/benefit_model.dart';
import 'package:ems/app/shared/utils/handle_tab_selection/defaultHandleTabSelection.dart';
import 'package:ems/app/shared/widgets/buttons/default_raised_button.dart';
import 'package:ems/app/shared/widgets/drawer/default_drawer.dart';
import 'package:ems/app/shared/widgets/tabbar/default_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BenefitPage extends StatefulWidget {
  final int id;

  BenefitPage({@required this.id});

  @override
  _BenefitPageState createState() => _BenefitPageState();
}

class _BenefitPageState extends State<BenefitPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  BenefitController _benefitController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _benefitController = Modular.get<BenefitController>();
    _benefitController.loadBenefitById(widget.id);
    _tabController = TabController(vsync: this, length: 5, initialIndex: 4);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    defaultHandleTabSelection(
      scaffoldKey: _scaffoldKey,
      tabController: _tabController,
    );
  }

  void _showCoupon() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Center(
            child: Text('Parabéns'),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 0.5,
                  ),
                ),
                child: Text(
                  _benefitController.benefit.code,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            Container(
              width: double.maxFinite,
              alignment: Alignment.center,
              child: DefaultRaisedButton(
                text: 'Entendi',
                buttonColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DefaultDrawer(),
      body: Observer(
        builder: (_) {
          switch (_benefitController.benefitStatus) {
            case BenefitStatus.LOADING:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case BenefitStatus.ERROR:
              return Center(
                child: Text('Erro ao carregar evento'),
              );
              break;
            case BenefitStatus.DONE:
              BenefitModel _benefit = _benefitController.benefit;
              return _benefit != null
                  ? BenefitMainBlock(
                      benefit: _benefit,
                    )
                  : Container();
              break;
            case BenefitStatus.IDLE:
            default:
              return Container();
              break;
          }
        },
      ),
      floatingActionButton: Observer(
        builder: (_) {
          if (_benefitController.benefit != null) {
            return DefaultRaisedButton(
              buttonColor: Colors.blueAccent,
              textColor: Colors.white,
              text: 'Ver cupom',
              onPressed: _showCoupon,
            );
          }
          return Container();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: DefaultTabBar(
        scaffoldKey: _scaffoldKey,
        tabController: _tabController,
      ),
    );
  }
}
