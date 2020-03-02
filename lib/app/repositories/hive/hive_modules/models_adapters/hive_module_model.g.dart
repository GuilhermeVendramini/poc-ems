// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_module_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveModuleModelAdapter extends TypeAdapter<HiveModuleModel> {
  @override
  final typeId = 4;

  @override
  HiveModuleModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveModuleModel(
      id: fields[0] as int,
      title: fields[1] as String,
      body: fields[2] as String,
      image: fields[3] as String,
      score: fields[4] as int,
      video: fields[5] as String,
      enabled: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveModuleModel obj) {
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
      ..write(obj.score)
      ..writeByte(5)
      ..write(obj.video)
      ..writeByte(6)
      ..write(obj.enabled);
  }
}
