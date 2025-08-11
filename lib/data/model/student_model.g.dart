// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelAdapter extends TypeAdapter<StudentModel> {
  @override
  final int typeId = 4;

  @override
  StudentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModel(
      id: fields[0] as String?,
      name: fields[1] as String,
      dateOfBirth: fields[2] as DateTime?,
      phoneNumber: fields[3] as String,
      email: fields[4] as String?,
      batchId: fields[5] as String?,
      enrollmentNumber: fields[6] as String?,
      address: fields[7] as String?,
      orgId: fields[8] as String,
      whatsappNumber: fields[9] as String,
      userName: fields[10] as String,
      profilePic: fields[11] as String?,
      city: fields[12] as String?,
      state: fields[13] as String?,
      country: fields[14] as String?,
      pincode: fields[15] as String?,
      fatherName: fields[16] as String?,
      motherName: fields[17] as String?,
      fatherMobile: fields[18] as String?,
      motherMobile: fields[19] as String?,
      coverPic: fields[20] as String?,
      studyIn: fields[21] as String,
      stream: fields[22] as String,
      password: fields[10] as String?,
      rollNumber: fields[11] as String?,
      standard: fields[12] as String?,
      aadharNumber: fields[13] as String?,
      fatherName: fields[14] as String?,
      fatherPhone: fields[15] as String?,
      fatherEmail: fields[16] as String?,
      fatherAddress: fields[17] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.dateOfBirth)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.batchId)
      ..writeByte(6)
      ..write(obj.enrollmentNumber)
      ..writeByte(7)
      ..write(obj.address)
      ..writeByte(8)
      ..write(obj.orgId)
      ..writeByte(9)
      ..write(obj.whatsappNumber)
      ..writeByte(10)
      ..write(obj.userName)
      ..writeByte(11)
      ..write(obj.profilePic)
      ..writeByte(12)
      ..write(obj.city)
      ..writeByte(13)
      ..write(obj.state)
      ..writeByte(14)
      ..write(obj.country)
      ..writeByte(15)
      ..write(obj.pincode)
      ..writeByte(16)
      ..write(obj.fatherName)
      ..writeByte(17)
      ..write(obj.motherName)
      ..writeByte(18)
      ..write(obj.fatherMobile)
      ..writeByte(19)
      ..write(obj.motherMobile)
      ..writeByte(20)
      ..write(obj.coverPic)
      ..writeByte(21)
      ..write(obj.studyIn)
      ..writeByte(22)
      ..write(obj.stream);
      ..write(obj.whatsappNumber)
      ..writeByte(10)
      ..write(obj.password)
      ..writeByte(11)
      ..write(obj.rollNumber)
      ..writeByte(12)
      ..write(obj.standard)
      ..writeByte(13)
      ..write(obj.aadharNumber)
      ..writeByte(14)
      ..write(obj.fatherName)
      ..writeByte(15)
      ..write(obj.fatherPhone)
      ..writeByte(16)
      ..write(obj.fatherEmail)
      ..writeByte(17)
      ..write(obj.fatherAddress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
