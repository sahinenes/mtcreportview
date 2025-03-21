// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machines_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MachinesModelAdapter extends TypeAdapter<MachinesModel> {
  @override
  final int typeId = 1;

  @override
  MachinesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MachinesModel(
      name: fields[0] as String?,
      location: fields[1] as String?,
      date: fields[2] as String?,
      url: fields[3] as String?,
      uuid: fields[4] as String?,
      imageUrl: fields[5] as String?,
      code: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MachinesModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.uuid)
      ..writeByte(5)
      ..write(obj.imageUrl)
      ..writeByte(6)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MachinesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
