// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimetableModelAdapter extends TypeAdapter<TimetableModel> {
  @override
  final int typeId = 34;

  @override
  TimetableModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimetableModel(
      id: fields[0] as String?,
      classId: fields[1] as String,
      className: fields[2] as String,
      academicYear: fields[3] as String,
      semester: fields[4] as String,
      timeSlots: (fields[5] as List).cast<TimetableSlotModel>(),
      createdAt: fields[6] as DateTime,
      createdBy: fields[7] as String,
      updatedAt: fields[8] as DateTime?,
      isActive: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TimetableModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.classId)
      ..writeByte(2)
      ..write(obj.className)
      ..writeByte(3)
      ..write(obj.academicYear)
      ..writeByte(4)
      ..write(obj.semester)
      ..writeByte(5)
      ..write(obj.timeSlots)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.createdBy)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimetableModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TimetableSlotModelAdapter extends TypeAdapter<TimetableSlotModel> {
  @override
  final int typeId = 35;

  @override
  TimetableSlotModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimetableSlotModel(
      id: fields[0] as String?,
      dayOfWeek: fields[1] as WeekDay,
      periodNumber: fields[2] as int,
      startTime: fields[3] as String,
      endTime: fields[4] as String,
      subjectId: fields[5] as String,
      subjectName: fields[6] as String,
      subjectCode: fields[7] as String,
      teacherId: fields[8] as String,
      teacherName: fields[9] as String,
      roomNumber: fields[10] as String?,
      slotType: fields[11] as SlotType,
      isBreak: fields[12] as bool,
      breakType: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TimetableSlotModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dayOfWeek)
      ..writeByte(2)
      ..write(obj.periodNumber)
      ..writeByte(3)
      ..write(obj.startTime)
      ..writeByte(4)
      ..write(obj.endTime)
      ..writeByte(5)
      ..write(obj.subjectId)
      ..writeByte(6)
      ..write(obj.subjectName)
      ..writeByte(7)
      ..write(obj.subjectCode)
      ..writeByte(8)
      ..write(obj.teacherId)
      ..writeByte(9)
      ..write(obj.teacherName)
      ..writeByte(10)
      ..write(obj.roomNumber)
      ..writeByte(11)
      ..write(obj.slotType)
      ..writeByte(12)
      ..write(obj.isBreak)
      ..writeByte(13)
      ..write(obj.breakType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimetableSlotModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TeacherScheduleModelAdapter extends TypeAdapter<TeacherScheduleModel> {
  @override
  final int typeId = 38;

  @override
  TeacherScheduleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeacherScheduleModel(
      id: fields[0] as String?,
      teacherId: fields[1] as String,
      teacherName: fields[2] as String,
      department: fields[3] as String,
      scheduleSlots: (fields[4] as List).cast<ScheduleSlotModel>(),
      maxPeriodsPerDay: fields[5] as int,
      availableDays: (fields[6] as List).cast<String>(),
      preferredTimeSlot: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TeacherScheduleModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.teacherId)
      ..writeByte(2)
      ..write(obj.teacherName)
      ..writeByte(3)
      ..write(obj.department)
      ..writeByte(4)
      ..write(obj.scheduleSlots)
      ..writeByte(5)
      ..write(obj.maxPeriodsPerDay)
      ..writeByte(6)
      ..write(obj.availableDays)
      ..writeByte(7)
      ..write(obj.preferredTimeSlot);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeacherScheduleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ScheduleSlotModelAdapter extends TypeAdapter<ScheduleSlotModel> {
  @override
  final int typeId = 39;

  @override
  ScheduleSlotModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduleSlotModel(
      id: fields[0] as String?,
      dayOfWeek: fields[1] as WeekDay,
      periodNumber: fields[2] as int,
      startTime: fields[3] as String,
      endTime: fields[4] as String,
      classId: fields[5] as String,
      className: fields[6] as String,
      subjectId: fields[7] as String,
      subjectName: fields[8] as String,
      roomNumber: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ScheduleSlotModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dayOfWeek)
      ..writeByte(2)
      ..write(obj.periodNumber)
      ..writeByte(3)
      ..write(obj.startTime)
      ..writeByte(4)
      ..write(obj.endTime)
      ..writeByte(5)
      ..write(obj.classId)
      ..writeByte(6)
      ..write(obj.className)
      ..writeByte(7)
      ..write(obj.subjectId)
      ..writeByte(8)
      ..write(obj.subjectName)
      ..writeByte(9)
      ..write(obj.roomNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleSlotModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeekDayAdapter extends TypeAdapter<WeekDay> {
  @override
  final int typeId = 36;

  @override
  WeekDay read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WeekDay.monday;
      case 1:
        return WeekDay.tuesday;
      case 2:
        return WeekDay.wednesday;
      case 3:
        return WeekDay.thursday;
      case 4:
        return WeekDay.friday;
      case 5:
        return WeekDay.saturday;
      case 6:
        return WeekDay.sunday;
      default:
        return WeekDay.monday;
    }
  }

  @override
  void write(BinaryWriter writer, WeekDay obj) {
    switch (obj) {
      case WeekDay.monday:
        writer.writeByte(0);
        break;
      case WeekDay.tuesday:
        writer.writeByte(1);
        break;
      case WeekDay.wednesday:
        writer.writeByte(2);
        break;
      case WeekDay.thursday:
        writer.writeByte(3);
        break;
      case WeekDay.friday:
        writer.writeByte(4);
        break;
      case WeekDay.saturday:
        writer.writeByte(5);
        break;
      case WeekDay.sunday:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SlotTypeAdapter extends TypeAdapter<SlotType> {
  @override
  final int typeId = 37;

  @override
  SlotType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SlotType.regular;
      case 1:
        return SlotType.laboratory;
      case 2:
        return SlotType.library;
      case 3:
        return SlotType.sports;
      case 4:
        return SlotType.assembly;
      case 5:
        return SlotType.study_hall;
      default:
        return SlotType.regular;
    }
  }

  @override
  void write(BinaryWriter writer, SlotType obj) {
    switch (obj) {
      case SlotType.regular:
        writer.writeByte(0);
        break;
      case SlotType.laboratory:
        writer.writeByte(1);
        break;
      case SlotType.library:
        writer.writeByte(2);
        break;
      case SlotType.sports:
        writer.writeByte(3);
        break;
      case SlotType.assembly:
        writer.writeByte(4);
        break;
      case SlotType.study_hall:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SlotTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
