// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdminModelAdapter extends TypeAdapter<AdminModel> {
  @override
  final int typeId = 0;

  @override
  AdminModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdminModel(
      firstName: fields[0] as String,
      middleName: fields[1] as String?,
      lastName: fields[2] as String?,
      email: fields[3] as String?,
      phone: fields[4] as String,
      address: fields[5] as String?,
      image: fields[6] as String?,
      id: fields[7] as String?,
      orgId: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AdminModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.middleName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.orgId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdminModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
