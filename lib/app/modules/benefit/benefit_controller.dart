import 'package:ems/app/services/benefits/benefits_service.dart';
import 'package:ems/app/shared/models/benefit_model.dart';
import 'package:mobx/mobx.dart';

part 'benefit_controller.g.dart';

enum BenefitStatus { IDLE, LOADING, ERROR, DONE }

class BenefitController = _BenefitBase with _$BenefitController;

abstract class _BenefitBase with Store {
  @observable
  BenefitModel benefit;

  @observable
  BenefitStatus benefitStatus = BenefitStatus.IDLE;

  BenefitsService _benefitsService = BenefitsService();

  @action
  Future<Null> loadBenefitById(int id) async {
    try {
      benefitStatus = BenefitStatus.LOADING;
      benefit = await _benefitsService.getBenefitById(id);
      benefitStatus = BenefitStatus.DONE;
    } catch (e) {
      benefitStatus = BenefitStatus.ERROR;
      print('Class BenefitController - loadBenefitById: $e');
    }
    return null;
  }
}
