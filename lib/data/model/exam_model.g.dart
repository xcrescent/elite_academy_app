// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExamModelAdapter extends TypeAdapter<ExamModel> {
  @override
  final int typeId = 29;

  @override
  ExamModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExamModel(
      id: fields[0] as String?,
      name: fields[1] as String,
      description: fields[2] as String,
      examType: fields[3] as ExamType,
      subjectId: fields[4] as String,
      subjectName: fields[5] as String,
      classId: fields[6] as String,
      className: fields[7] as String,
      startDate: fields[8] as DateTime,
      endDate: fields[9] as DateTime,
      duration: fields[10] as int,
      totalMarks: fields[11] as int,
      passingMarks: fields[12] as int,
      status: fields[13] as ExamStatus,
      createdBy: fields[14] as String,
      createdAt: fields[15] as DateTime,
      updatedAt: fields[16] as DateTime?,
      instructions: fields[17] as String?,
      syllabusTopics: (fields[18] as List?)?.cast<String>(),
      isPublished: fields[19] as bool,
      resultsPublishedAt: fields[20] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ExamModel obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.examType)
      ..writeByte(4)
      ..write(obj.subjectId)
      ..writeByte(5)
      ..write(obj.subjectName)
      ..writeByte(6)
      ..write(obj.classId)
      ..writeByte(7)
      ..write(obj.className)
      ..writeByte(8)
      ..write(obj.startDate)
      ..writeByte(9)
      ..write(obj.endDate)
      ..writeByte(10)
      ..write(obj.duration)
      ..writeByte(11)
      ..write(obj.totalMarks)
      ..writeByte(12)
      ..write(obj.passingMarks)
      ..writeByte(13)
      ..write(obj.status)
      ..writeByte(14)
      ..write(obj.createdBy)
      ..writeByte(15)
      ..write(obj.createdAt)
      ..writeByte(16)
      ..write(obj.updatedAt)
      ..writeByte(17)
      ..write(obj.instructions)
      ..writeByte(18)
      ..write(obj.syllabusTopics)
      ..writeByte(19)
      ..write(obj.isPublished)
      ..writeByte(20)
      ..write(obj.resultsPublishedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExamResultModelAdapter extends TypeAdapter<ExamResultModel> {
  @override
  final int typeId = 32;

  @override
  ExamResultModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExamResultModel(
      id: fields[0] as String?,
      examId: fields[1] as String,
      studentId: fields[2] as String,
      studentName: fields[3] as String,
      marksObtained: fields[4] as double,
      totalMarks: fields[5] as double,
      grade: fields[6] as String,
      percentage: fields[7] as double,
      status: fields[8] as ExamResultStatus,
      remarks: fields[9] as String?,
      examDate: fields[10] as DateTime?,
      rank: fields[11] as int?,
      isPassed: fields[12] as bool,
      createdAt: fields[13] as DateTime,
      gradedBy: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExamResultModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.examId)
      ..writeByte(2)
      ..write(obj.studentId)
      ..writeByte(3)
      ..write(obj.studentName)
      ..writeByte(4)
      ..write(obj.marksObtained)
      ..writeByte(5)
      ..write(obj.totalMarks)
      ..writeByte(6)
      ..write(obj.grade)
      ..writeByte(7)
      ..write(obj.percentage)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.remarks)
      ..writeByte(10)
      ..write(obj.examDate)
      ..writeByte(11)
      ..write(obj.rank)
      ..writeByte(12)
      ..write(obj.isPassed)
      ..writeByte(13)
      ..write(obj.createdAt)
      ..writeByte(14)
      ..write(obj.gradedBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamResultModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExamTypeAdapter extends TypeAdapter<ExamType> {
  @override
  final int typeId = 30;

  @override
  ExamType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ExamType.quiz;
      case 1:
        return ExamType.unit;
      case 2:
        return ExamType.midterm;
      case 3:
        return ExamType.final_exam;
      case 4:
        return ExamType.practical;
      case 5:
        return ExamType.oral;
      case 6:
        return ExamType.project;
      default:
        return ExamType.quiz;
    }
  }

  @override
  void write(BinaryWriter writer, ExamType obj) {
    switch (obj) {
      case ExamType.quiz:
        writer.writeByte(0);
        break;
      case ExamType.unit:
        writer.writeByte(1);
        break;
      case ExamType.midterm:
        writer.writeByte(2);
        break;
      case ExamType.final_exam:
        writer.writeByte(3);
        break;
      case ExamType.practical:
        writer.writeByte(4);
        break;
      case ExamType.oral:
        writer.writeByte(5);
        break;
      case ExamType.project:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExamStatusAdapter extends TypeAdapter<ExamStatus> {
  @override
  final int typeId = 31;

  @override
  ExamStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ExamStatus.draft;
      case 1:
        return ExamStatus.scheduled;
      case 2:
        return ExamStatus.ongoing;
      case 3:
        return ExamStatus.completed;
      case 4:
        return ExamStatus.cancelled;
      case 5:
        return ExamStatus.results_published;
      default:
        return ExamStatus.draft;
    }
  }

  @override
  void write(BinaryWriter writer, ExamStatus obj) {
    switch (obj) {
      case ExamStatus.draft:
        writer.writeByte(0);
        break;
      case ExamStatus.scheduled:
        writer.writeByte(1);
        break;
      case ExamStatus.ongoing:
        writer.writeByte(2);
        break;
      case ExamStatus.completed:
        writer.writeByte(3);
        break;
      case ExamStatus.cancelled:
        writer.writeByte(4);
        break;
      case ExamStatus.results_published:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExamResultStatusAdapter extends TypeAdapter<ExamResultStatus> {
  @override
  final int typeId = 33;

  @override
  ExamResultStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ExamResultStatus.pending;
      case 1:
        return ExamResultStatus.graded;
      case 2:
        return ExamResultStatus.published;
      case 3:
        return ExamResultStatus.disputed;
      default:
        return ExamResultStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, ExamResultStatus obj) {
    switch (obj) {
      case ExamResultStatus.pending:
        writer.writeByte(0);
        break;
      case ExamResultStatus.graded:
        writer.writeByte(1);
        break;
      case ExamResultStatus.published:
        writer.writeByte(2);
        break;
      case ExamResultStatus.disputed:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamResultStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
