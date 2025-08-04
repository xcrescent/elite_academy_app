// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_record_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceRecordModelAdapter extends TypeAdapter<AttendanceRecordModel> {
  @override
  final int typeId = 10;

  @override
  AttendanceRecordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceRecordModel(
      id: fields[0] as String?,
      studentId: fields[1] as String,
      studentName: fields[2] as String,
      classId: fields[3] as String,
      className: fields[4] as String,
      date: fields[5] as DateTime,
      status: fields[6] as AttendanceStatus,
      remarks: fields[7] as String?,
      markedBy: fields[8] as String,
      createdAt: fields[9] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceRecordModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.studentId)
      ..writeByte(2)
      ..write(obj.studentName)
      ..writeByte(3)
      ..write(obj.classId)
      ..writeByte(4)
      ..write(obj.className)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.remarks)
      ..writeByte(8)
      ..write(obj.markedBy)
      ..writeByte(9)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceRecordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AttendanceStatusAdapter extends TypeAdapter<AttendanceStatus> {
  @override
  final int typeId = 11;

  @override
  AttendanceStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AttendanceStatus.present;
      case 1:
        return AttendanceStatus.absent;
      case 2:
        return AttendanceStatus.late;
      case 3:
        return AttendanceStatus.excused;
      default:
        return AttendanceStatus.present;
    }
  }

  @override
  void write(BinaryWriter writer, AttendanceStatus obj) {
    switch (obj) {
      case AttendanceStatus.present:
        writer.writeByte(0);
        break;
      case AttendanceStatus.absent:
        writer.writeByte(1);
        break;
      case AttendanceStatus.late:
        writer.writeByte(2);
        break;
      case AttendanceStatus.excused:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
