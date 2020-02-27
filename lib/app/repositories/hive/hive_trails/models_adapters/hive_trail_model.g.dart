// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_trail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTrailModelAdapter extends TypeAdapter<HiveTrailModel> {
  @override
  final typeId = 2;

  @override
  HiveTrailModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTrailModel(
      id: fields[0] as int,
      title: fields[4] as String,
      image: fields[3] as String,
      status: fields[2] as int,
      score: fields[1] as int,
      modules: (fields[5] as List)?.cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveTrailModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.score)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.modules);
  }
}
