// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeeModelAdapter extends TypeAdapter<FeeModel> {
  @override
  final int typeId = 5;

  @override
  FeeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeeModel(
      id: fields[0] as String,
      studentId: fields[1] as int,
      amount: fields[2] as double,
      dueDate: fields[3] as DateTime,
      isPaid: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FeeModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.studentId)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.dueDate)
      ..writeByte(4)
      ..write(obj.isPaid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
