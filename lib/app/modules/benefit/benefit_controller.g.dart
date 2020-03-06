// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'benefit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BenefitController on _BenefitBase, Store {
  final _$benefitAtom = Atom(name: '_BenefitBase.benefit');

  @override
  BenefitModel get benefit {
    _$benefitAtom.context.enforceReadPolicy(_$benefitAtom);
    _$benefitAtom.reportObserved();
    return super.benefit;
  }

  @override
  set benefit(BenefitModel value) {
    _$benefitAtom.context.conditionallyRunInAction(() {
      super.benefit = value;
      _$benefitAtom.reportChanged();
    }, _$benefitAtom, name: '${_$benefitAtom.name}_set');
  }

  final _$benefitStatusAtom = Atom(name: '_BenefitBase.benefitStatus');

  @override
  BenefitStatus get benefitStatus {
    _$benefitStatusAtom.context.enforceReadPolicy(_$benefitStatusAtom);
    _$benefitStatusAtom.reportObserved();
    return super.benefitStatus;
  }

  @override
  set benefitStatus(BenefitStatus value) {
    _$benefitStatusAtom.context.conditionallyRunInAction(() {
      super.benefitStatus = value;
      _$benefitStatusAtom.reportChanged();
    }, _$benefitStatusAtom, name: '${_$benefitStatusAtom.name}_set');
  }

  final _$loadBenefitByIdAsyncAction = AsyncAction('loadBenefitById');

  @override
  Future<Null> loadBenefitById(int id) {
    return _$loadBenefitByIdAsyncAction.run(() => super.loadBenefitById(id));
  }

  @override
  String toString() {
    final string =
        'benefit: ${benefit.toString()},benefitStatus: ${benefitStatus.toString()}';
    return '{$string}';
  }
}
