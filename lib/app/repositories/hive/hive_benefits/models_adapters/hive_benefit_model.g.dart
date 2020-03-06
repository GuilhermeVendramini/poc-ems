// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_benefit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBenefitModelAdapter extends TypeAdapter<HiveBenefitModel> {
  @override
  final typeId = 5;

  @override
  HiveBenefitModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBenefitModel(
      id: fields[0] as int,
      title: fields[1] as String,
      body: fields[2] as String,
      image: fields[3] as String,
      code: fields[4] as String,
      status: fields[6] as int,
      score: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveBenefitModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.body)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.code)
      ..writeByte(5)
      ..write(obj.score)
      ..writeByte(6)
      ..write(obj.status);
  }
}
