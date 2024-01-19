// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrgModelAdapter extends TypeAdapter<OrgModel> {
  @override
  final int typeId = 0;

  @override
  OrgModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrgModel(
      id: fields[0] as int,
      name: fields[1] as String,
      address: fields[2] as String,
      email: fields[3] as String,
      phone: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OrgModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrgModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
