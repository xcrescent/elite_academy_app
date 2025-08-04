// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GradeModelAdapter extends TypeAdapter<GradeModel> {
  @override
  final int typeId = 14;

  @override
  GradeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GradeModel(
      id: fields[0] as String?,
      studentId: fields[1] as String,
      studentName: fields[2] as String,
      subjectId: fields[3] as String,
      subjectName: fields[4] as String,
      classId: fields[5] as String,
      className: fields[6] as String,
      examType: fields[7] as String,
      marksObtained: fields[8] as double,
      totalMarks: fields[9] as double,
      grade: fields[10] as String?,
      gpa: fields[11] as double?,
      examDate: fields[12] as DateTime,
      remarks: fields[13] as String?,
      gradedBy: fields[14] as String,
      createdAt: fields[15] as DateTime,
      updatedAt: fields[16] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, GradeModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.studentId)
      ..writeByte(2)
      ..write(obj.studentName)
      ..writeByte(3)
      ..write(obj.subjectId)
      ..writeByte(4)
      ..write(obj.subjectName)
      ..writeByte(5)
      ..write(obj.classId)
      ..writeByte(6)
      ..write(obj.className)
      ..writeByte(7)
      ..write(obj.examType)
      ..writeByte(8)
      ..write(obj.marksObtained)
      ..writeByte(9)
      ..write(obj.totalMarks)
      ..writeByte(10)
      ..write(obj.grade)
      ..writeByte(11)
      ..write(obj.gpa)
      ..writeByte(12)
      ..write(obj.examDate)
      ..writeByte(13)
      ..write(obj.remarks)
      ..writeByte(14)
      ..write(obj.gradedBy)
      ..writeByte(15)
      ..write(obj.createdAt)
      ..writeByte(16)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GradeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubjectModelAdapter extends TypeAdapter<SubjectModel> {
  @override
  final int typeId = 15;

  @override
  SubjectModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubjectModel(
      id: fields[0] as String?,
      name: fields[1] as String,
      code: fields[2] as String,
      description: fields[3] as String?,
      creditHours: fields[4] as int,
      facultyId: fields[5] as String?,
      facultyName: fields[6] as String?,
      classIds: (fields[7] as List).cast<String>(),
      createdAt: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SubjectModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.creditHours)
      ..writeByte(5)
      ..write(obj.facultyId)
      ..writeByte(6)
      ..write(obj.facultyName)
      ..writeByte(7)
      ..write(obj.classIds)
      ..writeByte(8)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubjectModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
