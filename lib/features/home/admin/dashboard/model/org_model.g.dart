// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrgModelAdapter extends TypeAdapter<OrgModel> {
  @override
  final int typeId = 1;

  @override
  OrgModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrgModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      address: fields[2] as String?,
      email: fields[3] as String?,
      phone: fields[4] as String?,
      logo: fields[5] as String?,
      website: fields[6] as String?,
      facebook: fields[7] as String?,
      twitter: fields[8] as String?,
      instagram: fields[9] as String?,
      youtube: fields[10] as String?,
      linkedin: fields[11] as String?,
      github: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrgModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.logo)
      ..writeByte(6)
      ..write(obj.website)
      ..writeByte(7)
      ..write(obj.facebook)
      ..writeByte(8)
      ..write(obj.twitter)
      ..writeByte(9)
      ..write(obj.instagram)
      ..writeByte(10)
      ..write(obj.youtube)
      ..writeByte(11)
      ..write(obj.linkedin)
      ..writeByte(12)
      ..write(obj.github);
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
