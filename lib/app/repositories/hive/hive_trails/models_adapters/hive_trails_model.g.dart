// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_trails_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTrailsModelAdapter extends TypeAdapter<HiveTrailsModel> {
  @override
  final typeId = 3;

  @override
  HiveTrailsModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTrailsModel(
      id: fields[0] as int,
      title: fields[3] as String,
      trails: (fields[2] as List)?.cast<HiveTrailModel>(),
      category: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTrailsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.trails)
      ..writeByte(3)
      ..write(obj.title);
  }
}
