import 'package:ems/app/repositories/hive/hive_benefits/models_adapters/hive_benefit_model.dart';
import 'package:ems/app/repositories/hive/hive_instance.dart';
import 'package:ems/app/shared/models/benefit_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class HiveBenefitsRepository {
  Box<Map> _benefitsBox;

  Future<Null> loadBenefitsBox() async {
    if (_benefitsBox == null) {
      try {
        await HiveInstance.initHive();
        Hive.registerAdapter(HiveBenefitModelAdapter());
        _benefitsBox = await Hive.openBox<Map>('benefitsBox');
      } catch (e) {
        throw e;
      }
    }
    return;
  }

  Future<Null> saveBenefits({
    @required List<BenefitModel> benefits,
    Duration cache = const Duration(days: 1),
  }) async {
    await loadBenefitsBox();
    List<HiveBenefitModel> _listHiveBenefitModel = benefits
        .map((benefit) => HiveBenefitModel(
              title: benefit.title,
              id: benefit.id,
              image: benefit.image,
              body: benefit.body,
              code: benefit.code,
              score: benefit.score,
              status: benefit.status,
            ))
        .toList();

    _benefitsBox.put(
      'benefits',
      {
        'data': _listHiveBenefitModel,
        'cache_expire': DateTime.now().add(cache)
      },
    );
    return;
  }

  Future<Null> deleteBenefits() async {
    await loadBenefitsBox();
    await _benefitsBox.delete('benefits');
    return;
  }

  Future<bool> expiredCache() async {
    await loadBenefitsBox();
    if (_benefitsBox.isNotEmpty) {
      DateTime cache = _benefitsBox.get('benefits')['cache_expire'];

      if (cache.isBefore(DateTime.now())) {
        return true;
      }

      return false;
    }
    return true;
  }

  Future<List<BenefitModel>> getBenefits() async {
    await loadBenefitsBox();
    if (_benefitsBox.isNotEmpty) {
      List<dynamic> _hiveBenefit = _benefitsBox.get('benefits')['data'];
      List<BenefitModel> _benefits = _hiveBenefit
          .map<BenefitModel>((benefit) => BenefitModel(
                id: benefit.id,
                image: benefit.image,
                body: benefit.body,
                status: benefit.status,
                code: benefit.code,
                score: benefit.score,
                title: benefit.title,
              ))
          .toList();
      return _benefits;
    }
    return null;
  }

  Future<BenefitModel> getBenefitById(int id) async {
    await loadBenefitsBox();
    if (_benefitsBox.isNotEmpty) {
      BenefitModel _benefit = _benefitsBox
          .get('benefits')['data']
          .firstWhere((benefit) => benefit.id == id);

      return _benefit;
    }
    return null;
  }
}
