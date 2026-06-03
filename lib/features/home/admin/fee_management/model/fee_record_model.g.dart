// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee_record_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeeRecordModelAdapter extends TypeAdapter<FeeRecordModel> {
  @override
  final int typeId = 21;

  @override
  FeeRecordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeeRecordModel(
      id: fields[0] as String?,
      studentId: fields[1] as String,
      studentName: fields[2] as String,
      classId: fields[3] as String,
      className: fields[4] as String,
      feeType: fields[5] as FeeType,
      amount: fields[6] as double,
      dueDate: fields[7] as DateTime,
      status: fields[8] as FeeStatus,
      paidDate: fields[9] as DateTime?,
      paidAmount: fields[10] as double?,
      paymentMethod: fields[11] as String?,
      transactionId: fields[12] as String?,
      remarks: fields[13] as String?,
      createdAt: fields[14] as DateTime,
      createdBy: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FeeRecordModel obj) {
    writer
      ..writeByte(16)
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
      ..write(obj.feeType)
      ..writeByte(6)
      ..write(obj.amount)
      ..writeByte(7)
      ..write(obj.dueDate)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.paidDate)
      ..writeByte(10)
      ..write(obj.paidAmount)
      ..writeByte(11)
      ..write(obj.paymentMethod)
      ..writeByte(12)
      ..write(obj.transactionId)
      ..writeByte(13)
      ..write(obj.remarks)
      ..writeByte(14)
      ..write(obj.createdAt)
      ..writeByte(15)
      ..write(obj.createdBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeeRecordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FeeTypeAdapter extends TypeAdapter<FeeType> {
  @override
  final int typeId = 22;

  @override
  FeeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FeeType.tuition;
      case 1:
        return FeeType.admission;
      case 2:
        return FeeType.examination;
      case 3:
        return FeeType.library;
      case 4:
        return FeeType.laboratory;
      case 5:
        return FeeType.transport;
      case 6:
        return FeeType.hostel;
      case 7:
        return FeeType.sports;
      case 8:
        return FeeType.miscellaneous;
      default:
        return FeeType.tuition;
    }
  }

  @override
  void write(BinaryWriter writer, FeeType obj) {
    switch (obj) {
      case FeeType.tuition:
        writer.writeByte(0);
        break;
      case FeeType.admission:
        writer.writeByte(1);
        break;
      case FeeType.examination:
        writer.writeByte(2);
        break;
      case FeeType.library:
        writer.writeByte(3);
        break;
      case FeeType.laboratory:
        writer.writeByte(4);
        break;
      case FeeType.transport:
        writer.writeByte(5);
        break;
      case FeeType.hostel:
        writer.writeByte(6);
        break;
      case FeeType.sports:
        writer.writeByte(7);
        break;
      case FeeType.miscellaneous:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FeeStatusAdapter extends TypeAdapter<FeeStatus> {
  @override
  final int typeId = 23;

  @override
  FeeStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FeeStatus.pending;
      case 1:
        return FeeStatus.partial;
      case 2:
        return FeeStatus.paid;
      case 3:
        return FeeStatus.cancelled;
      default:
        return FeeStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, FeeStatus obj) {
    switch (obj) {
      case FeeStatus.pending:
        writer.writeByte(0);
        break;
      case FeeStatus.partial:
        writer.writeByte(1);
        break;
      case FeeStatus.paid:
        writer.writeByte(2);
        break;
      case FeeStatus.cancelled:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeeStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
