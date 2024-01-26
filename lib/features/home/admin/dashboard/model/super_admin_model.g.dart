// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'super_admin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SuperAdminModelAdapter extends TypeAdapter<SuperAdminModel> {
  @override
  final int typeId = 0;

  @override
  SuperAdminModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SuperAdminModel(
      name: fields[0] as String,
      email: fields[1] as String,
      phone: fields[2] as String,
      address: fields[3] as String?,
      image: fields[4] as String?,
      id: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SuperAdminModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuperAdminModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
