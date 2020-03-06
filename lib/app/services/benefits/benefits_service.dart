import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ems/app/repositories/firestore/firestore_benefits_repository.dart';
import 'package:ems/app/repositories/hive/hive_benefits/hive_benefits_instance.dart';
import 'package:ems/app/repositories/hive/hive_benefits/hive_benefits_repository.dart';
import 'package:ems/app/shared/models/benefit_model.dart';

class BenefitsService {
  final FirestoreBenefitsRepository _benefitsRepository =
      FirestoreBenefitsRepository();

  final HiveBenefitsRepository _hiveBenefitsRepository =
      HiveBenefitsInstance.repository;

  Future<List<BenefitModel>> getCachedBenefits() async {
    List<BenefitModel> _benefits;
    _benefits = await _hiveBenefitsRepository.getBenefits();

    if (_benefits != null && _benefits.length > 0) {
      _benefits
          .sort((a, b) => (b.status == 1 ? 1 : 0) - (a.status == 1 ? 1 : 0));
      return _benefits;
    }

    return null;
  }

  Future<List<BenefitModel>> getBenefits() async {
    List<BenefitModel> _benefits;

    try {
      bool expiredCache = await _hiveBenefitsRepository.expiredCache();

      if (!expiredCache) {
        _benefits = await getCachedBenefits();
        return _benefits;
      }

      QuerySnapshot _result = await _benefitsRepository.loadBenefits();
      List<DocumentSnapshot> _documents = _result.documents;

      if (_documents.isNotEmpty) {
        _benefits =
            _documents.map((doc) => BenefitModel.fromFirestore(doc)).toList();
        _benefits
            .sort((a, b) => (b.status == 1 ? 1 : 0) - (a.status == 1 ? 1 : 0));
        _hiveBenefitsRepository.saveBenefits(benefits: _benefits);
        return _benefits;
      }
      return null;
    } catch (e) {
      print('Class BenefitsService - getBenefits: $e');
      _benefits = await getCachedBenefits();
      return _benefits;
    }
  }

  Future<BenefitModel> getCachedBenefitById(int id) async {
    BenefitModel _benefit;
    _benefit = await _hiveBenefitsRepository.getBenefitById(id);

    return _benefit;
  }

  Future<BenefitModel> getBenefitById(int id) async {
    BenefitModel _benefit;

    try {
      bool expiredCache = await _hiveBenefitsRepository.expiredCache();

      if (!expiredCache) {
        _benefit= await getCachedBenefitById(id);
        return _benefit;
      }

      QuerySnapshot _result = await _benefitsRepository.loadBenefitById(id);
      List<DocumentSnapshot> _documents = _result.documents;

      if (_documents.isNotEmpty) {
        _benefit =
            _documents.map((doc) => BenefitModel.fromFirestore(doc)).first;
        return _benefit;
      }
      return null;
    } catch (e) {
      print('Class BenefitsService - getBenefitById: $e');
      _benefit = await getCachedBenefitById(id);
      return _benefit;
    }
  }
}
