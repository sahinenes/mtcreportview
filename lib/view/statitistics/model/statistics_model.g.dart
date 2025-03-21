// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatisticsModelAdapter extends TypeAdapter<StatisticsModel> {
  @override
  final int typeId = 2;

  @override
  StatisticsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatisticsModel(
      uuid: fields[0] as String?,
      ok: fields[1] as int?,
      nok: fields[2] as int?,
      total: fields[3] as int?,
      dataName: fields[4] as String?,
      dataIndex: fields[5] as String?,
      date: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StatisticsModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.ok)
      ..writeByte(2)
      ..write(obj.nok)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(4)
      ..write(obj.dataName)
      ..writeByte(5)
      ..write(obj.dataIndex)
      ..writeByte(6)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatisticsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
