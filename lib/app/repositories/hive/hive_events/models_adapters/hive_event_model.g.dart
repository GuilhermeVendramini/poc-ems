// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_event_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveEventModelAdapter extends TypeAdapter<HiveEventModel> {
  @override
  final typeId = 1;

  @override
  HiveEventModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveEventModel(
      id: fields[0] as String,
      title: fields[1] as String,
      body: fields[2] as String,
      date: fields[3] as DateTime,
      description: fields[4] as String,
      image: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveEventModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.body)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.image);
  }
}
