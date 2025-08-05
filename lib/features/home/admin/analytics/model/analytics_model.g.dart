// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DashboardMetricsAdapter extends TypeAdapter<DashboardMetrics> {
  @override
  final int typeId = 92;

  @override
  DashboardMetrics read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DashboardMetrics(
      id: fields[0] as String?,
      date: fields[1] as DateTime,
      totalStudents: fields[2] as int,
      totalStaff: fields[3] as int,
      totalRevenue: fields[4] as double,
      totalExpenses: fields[5] as double,
      admissions: fields[6] as int,
      attendanceRate: fields[7] as double,
      examsConducted: fields[8] as int,
      averageMarks: fields[9] as double,
      libraryBooks: fields[10] as int,
      assetsCount: fields[11] as int,
      transportUtilization: fields[12] as double,
      hostelOccupancy: fields[13] as double,
    );
  }

  @override
  void write(BinaryWriter writer, DashboardMetrics obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.totalStudents)
      ..writeByte(3)
      ..write(obj.totalStaff)
      ..writeByte(4)
      ..write(obj.totalRevenue)
      ..writeByte(5)
      ..write(obj.totalExpenses)
      ..writeByte(6)
      ..write(obj.admissions)
      ..writeByte(7)
      ..write(obj.attendanceRate)
      ..writeByte(8)
      ..write(obj.examsConducted)
      ..writeByte(9)
      ..write(obj.averageMarks)
      ..writeByte(10)
      ..write(obj.libraryBooks)
      ..writeByte(11)
      ..write(obj.assetsCount)
      ..writeByte(12)
      ..write(obj.transportUtilization)
      ..writeByte(13)
      ..write(obj.hostelOccupancy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardMetricsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StudentAnalyticsAdapter extends TypeAdapter<StudentAnalytics> {
  @override
  final int typeId = 93;

  @override
  StudentAnalytics read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentAnalytics(
      classId: fields[0] as String,
      className: fields[1] as String,
      totalStudents: fields[2] as int,
      maleStudents: fields[3] as int,
      femaleStudents: fields[4] as int,
      averageAttendance: fields[5] as double,
      averageGrade: fields[6] as double,
      passCount: fields[7] as int,
      failCount: fields[8] as int,
      feeCollection: fields[9] as double,
      pendingFees: fields[10] as double,
    );
  }

  @override
  void write(BinaryWriter writer, StudentAnalytics obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.classId)
      ..writeByte(1)
      ..write(obj.className)
      ..writeByte(2)
      ..write(obj.totalStudents)
      ..writeByte(3)
      ..write(obj.maleStudents)
      ..writeByte(4)
      ..write(obj.femaleStudents)
      ..writeByte(5)
      ..write(obj.averageAttendance)
      ..writeByte(6)
      ..write(obj.averageGrade)
      ..writeByte(7)
      ..write(obj.passCount)
      ..writeByte(8)
      ..write(obj.failCount)
      ..writeByte(9)
      ..write(obj.feeCollection)
      ..writeByte(10)
      ..write(obj.pendingFees);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentAnalyticsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FinancialAnalyticsAdapter extends TypeAdapter<FinancialAnalytics> {
  @override
  final int typeId = 94;

  @override
  FinancialAnalytics read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinancialAnalytics(
      month: fields[0] as String,
      tuitionFees: fields[1] as double,
      transportFees: fields[2] as double,
      hostelFees: fields[3] as double,
      examFees: fields[4] as double,
      otherIncome: fields[5] as double,
      salaryExpenses: fields[6] as double,
      utilityExpenses: fields[7] as double,
      maintenanceExpenses: fields[8] as double,
      suppliesExpenses: fields[9] as double,
      otherExpenses: fields[10] as double,
    );
  }

  @override
  void write(BinaryWriter writer, FinancialAnalytics obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.month)
      ..writeByte(1)
      ..write(obj.tuitionFees)
      ..writeByte(2)
      ..write(obj.transportFees)
      ..writeByte(3)
      ..write(obj.hostelFees)
      ..writeByte(4)
      ..write(obj.examFees)
      ..writeByte(5)
      ..write(obj.otherIncome)
      ..writeByte(6)
      ..write(obj.salaryExpenses)
      ..writeByte(7)
      ..write(obj.utilityExpenses)
      ..writeByte(8)
      ..write(obj.maintenanceExpenses)
      ..writeByte(9)
      ..write(obj.suppliesExpenses)
      ..writeByte(10)
      ..write(obj.otherExpenses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinancialAnalyticsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AcademicAnalyticsAdapter extends TypeAdapter<AcademicAnalytics> {
  @override
  final int typeId = 95;

  @override
  AcademicAnalytics read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AcademicAnalytics(
      subject: fields[0] as String,
      className: fields[1] as String,
      averageScore: fields[2] as double,
      highestScore: fields[3] as double,
      lowestScore: fields[4] as double,
      studentsAppeared: fields[5] as int,
      studentsAbsent: fields[6] as int,
      examType: fields[7] as String,
      examDate: fields[8] as DateTime,
      difficulty: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AcademicAnalytics obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.subject)
      ..writeByte(1)
      ..write(obj.className)
      ..writeByte(2)
      ..write(obj.averageScore)
      ..writeByte(3)
      ..write(obj.highestScore)
      ..writeByte(4)
      ..write(obj.lowestScore)
      ..writeByte(5)
      ..write(obj.studentsAppeared)
      ..writeByte(6)
      ..write(obj.studentsAbsent)
      ..writeByte(7)
      ..write(obj.examType)
      ..writeByte(8)
      ..write(obj.examDate)
      ..writeByte(9)
      ..write(obj.difficulty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AcademicAnalyticsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnalyticsPeriodAdapter extends TypeAdapter<AnalyticsPeriod> {
  @override
  final int typeId = 96;

  @override
  AnalyticsPeriod read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AnalyticsPeriod.daily;
      case 1:
        return AnalyticsPeriod.weekly;
      case 2:
        return AnalyticsPeriod.monthly;
      case 3:
        return AnalyticsPeriod.quarterly;
      case 4:
        return AnalyticsPeriod.yearly;
      default:
        return AnalyticsPeriod.daily;
    }
  }

  @override
  void write(BinaryWriter writer, AnalyticsPeriod obj) {
    switch (obj) {
      case AnalyticsPeriod.daily:
        writer.writeByte(0);
        break;
      case AnalyticsPeriod.weekly:
        writer.writeByte(1);
        break;
      case AnalyticsPeriod.monthly:
        writer.writeByte(2);
        break;
      case AnalyticsPeriod.quarterly:
        writer.writeByte(3);
        break;
      case AnalyticsPeriod.yearly:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalyticsPeriodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChartTypeAdapter extends TypeAdapter<ChartType> {
  @override
  final int typeId = 97;

  @override
  ChartType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ChartType.line;
      case 1:
        return ChartType.bar;
      case 2:
        return ChartType.pie;
      case 3:
        return ChartType.donut;
      case 4:
        return ChartType.area;
      case 5:
        return ChartType.scatter;
      default:
        return ChartType.line;
    }
  }

  @override
  void write(BinaryWriter writer, ChartType obj) {
    switch (obj) {
      case ChartType.line:
        writer.writeByte(0);
        break;
      case ChartType.bar:
        writer.writeByte(1);
        break;
      case ChartType.pie:
        writer.writeByte(2);
        break;
      case ChartType.donut:
        writer.writeByte(3);
        break;
      case ChartType.area:
        writer.writeByte(4);
        break;
      case ChartType.scatter:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChartTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MetricTrendAdapter extends TypeAdapter<MetricTrend> {
  @override
  final int typeId = 98;

  @override
  MetricTrend read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MetricTrend.increasing;
      case 1:
        return MetricTrend.decreasing;
      case 2:
        return MetricTrend.stable;
      case 3:
        return MetricTrend.volatile;
      default:
        return MetricTrend.increasing;
    }
  }

  @override
  void write(BinaryWriter writer, MetricTrend obj) {
    switch (obj) {
      case MetricTrend.increasing:
        writer.writeByte(0);
        break;
      case MetricTrend.decreasing:
        writer.writeByte(1);
        break;
      case MetricTrend.stable:
        writer.writeByte(2);
        break;
      case MetricTrend.volatile:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetricTrendAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
