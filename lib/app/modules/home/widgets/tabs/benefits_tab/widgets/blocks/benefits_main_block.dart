import 'package:ems/app/core/core_initial_controller.dart';
import 'package:ems/app/shared/widgets/cards/benefit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BenefitsMainBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CoreInitialController _coreInitialController =
        Modular.get<CoreInitialController>();
    return Observer(
      builder: (_) {
        switch (_coreInitialController.benefitsStatus) {
          case BenefitsStatus.IDLE:
          case BenefitsStatus.LOADING:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case BenefitsStatus.ERROR:
            return Container();
            break;
          case BenefitsStatus.DONE:
          default:
            if (_coreInitialController.benefits != null &&
                _coreInitialController.benefits.length > 0) {
              return ListView.separated(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 20.0,
                ),
                itemCount: _coreInitialController.benefits.length,
                itemBuilder: (BuildContext context, int index) {
                  return BenefitCard(
                    benefit: _coreInitialController.benefits[index],
                  );
                },
              );
            }
            return Center(
              child: Text('Nenhum benefício no momento'),
            );
            break;
        }
      },
    );
  }
}
