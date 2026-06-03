// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssignmentModelAdapter extends TypeAdapter<AssignmentModel> {
  @override
  final int typeId = 16;

  @override
  AssignmentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AssignmentModel(
      id: fields[0] as String?,
      title: fields[1] as String,
      description: fields[2] as String,
      subjectId: fields[3] as String,
      subjectName: fields[4] as String,
      classId: fields[5] as String,
      className: fields[6] as String,
      type: fields[7] as AssignmentType,
      dueDate: fields[8] as DateTime,
      submissionDeadline: fields[9] as DateTime?,
      totalMarks: fields[10] as int,
      status: fields[11] as AssignmentStatus,
      createdBy: fields[12] as String,
      createdAt: fields[13] as DateTime,
      updatedAt: fields[14] as DateTime?,
      instructions: fields[15] as String?,
      attachmentUrls: (fields[16] as List?)?.cast<String>(),
      allowLateSubmission: fields[17] as bool,
      latePenaltyPercent: fields[18] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, AssignmentModel obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.subjectId)
      ..writeByte(4)
      ..write(obj.subjectName)
      ..writeByte(5)
      ..write(obj.classId)
      ..writeByte(6)
      ..write(obj.className)
      ..writeByte(7)
      ..write(obj.type)
      ..writeByte(8)
      ..write(obj.dueDate)
      ..writeByte(9)
      ..write(obj.submissionDeadline)
      ..writeByte(10)
      ..write(obj.totalMarks)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.createdBy)
      ..writeByte(13)
      ..write(obj.createdAt)
      ..writeByte(14)
      ..write(obj.updatedAt)
      ..writeByte(15)
      ..write(obj.instructions)
      ..writeByte(16)
      ..write(obj.attachmentUrls)
      ..writeByte(17)
      ..write(obj.allowLateSubmission)
      ..writeByte(18)
      ..write(obj.latePenaltyPercent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssignmentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StudentSubmissionModelAdapter
    extends TypeAdapter<StudentSubmissionModel> {
  @override
  final int typeId = 19;

  @override
  StudentSubmissionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentSubmissionModel(
      id: fields[0] as String?,
      assignmentId: fields[1] as String,
      studentId: fields[2] as String,
      studentName: fields[3] as String,
      submittedAt: fields[4] as DateTime,
      submissionText: fields[5] as String?,
      attachmentUrls: (fields[6] as List?)?.cast<String>(),
      status: fields[7] as SubmissionStatus,
      marksAwarded: fields[8] as double?,
      feedback: fields[9] as String?,
      gradedBy: fields[10] as String?,
      gradedAt: fields[11] as DateTime?,
      isLate: fields[12] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, StudentSubmissionModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.assignmentId)
      ..writeByte(2)
      ..write(obj.studentId)
      ..writeByte(3)
      ..write(obj.studentName)
      ..writeByte(4)
      ..write(obj.submittedAt)
      ..writeByte(5)
      ..write(obj.submissionText)
      ..writeByte(6)
      ..write(obj.attachmentUrls)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.marksAwarded)
      ..writeByte(9)
      ..write(obj.feedback)
      ..writeByte(10)
      ..write(obj.gradedBy)
      ..writeByte(11)
      ..write(obj.gradedAt)
      ..writeByte(12)
      ..write(obj.isLate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentSubmissionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AssignmentTypeAdapter extends TypeAdapter<AssignmentType> {
  @override
  final int typeId = 17;

  @override
  AssignmentType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AssignmentType.homework;
      case 1:
        return AssignmentType.project;
      case 2:
        return AssignmentType.lab;
      case 3:
        return AssignmentType.essay;
      case 4:
        return AssignmentType.research;
      case 5:
        return AssignmentType.presentation;
      default:
        return AssignmentType.homework;
    }
  }

  @override
  void write(BinaryWriter writer, AssignmentType obj) {
    switch (obj) {
      case AssignmentType.homework:
        writer.writeByte(0);
        break;
      case AssignmentType.project:
        writer.writeByte(1);
        break;
      case AssignmentType.lab:
        writer.writeByte(2);
        break;
      case AssignmentType.essay:
        writer.writeByte(3);
        break;
      case AssignmentType.research:
        writer.writeByte(4);
        break;
      case AssignmentType.presentation:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssignmentTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AssignmentStatusAdapter extends TypeAdapter<AssignmentStatus> {
  @override
  final int typeId = 18;

  @override
  AssignmentStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AssignmentStatus.draft;
      case 1:
        return AssignmentStatus.active;
      case 2:
        return AssignmentStatus.closed;
      case 3:
        return AssignmentStatus.graded;
      default:
        return AssignmentStatus.draft;
    }
  }

  @override
  void write(BinaryWriter writer, AssignmentStatus obj) {
    switch (obj) {
      case AssignmentStatus.draft:
        writer.writeByte(0);
        break;
      case AssignmentStatus.active:
        writer.writeByte(1);
        break;
      case AssignmentStatus.closed:
        writer.writeByte(2);
        break;
      case AssignmentStatus.graded:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssignmentStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubmissionStatusAdapter extends TypeAdapter<SubmissionStatus> {
  @override
  final int typeId = 20;

  @override
  SubmissionStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SubmissionStatus.submitted;
      case 1:
        return SubmissionStatus.graded;
      case 2:
        return SubmissionStatus.returned;
      case 3:
        return SubmissionStatus.resubmitted;
      default:
        return SubmissionStatus.submitted;
    }
  }

  @override
  void write(BinaryWriter writer, SubmissionStatus obj) {
    switch (obj) {
      case SubmissionStatus.submitted:
        writer.writeByte(0);
        break;
      case SubmissionStatus.graded:
        writer.writeByte(1);
        break;
      case SubmissionStatus.returned:
        writer.writeByte(2);
        break;
      case SubmissionStatus.resubmitted:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubmissionStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
