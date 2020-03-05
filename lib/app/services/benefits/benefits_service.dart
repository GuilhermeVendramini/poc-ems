import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ems/app/repositories/firestore/firestore_benefits_repository.dart';
import 'package:ems/app/shared/models/benefit_model.dart';

class BenefitsService {
  final FirestoreBenefitsRepository _benefitsRepository =
      FirestoreBenefitsRepository();

  Future<List<BenefitModel>> getBenefits() async {
    List<BenefitModel> _benefits;

    try {
      QuerySnapshot _result = await _benefitsRepository.loadBenefits();
      List<DocumentSnapshot> _documents = _result.documents;

      if (_documents.isNotEmpty) {
        _benefits =
            _documents.map((doc) => BenefitModel.fromFirestore(doc)).toList();
        return _benefits;
      }
      return null;
    } catch (e) {
      print('Class BenefitsService - getBenefits: $e');
      return _benefits;
    }
  }
}
