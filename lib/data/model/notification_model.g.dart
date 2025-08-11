// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationModelAdapter extends TypeAdapter<NotificationModel> {
  @override
  final int typeId = 12;

  @override
  NotificationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationModel(
      id: fields[0] as String?,
      title: fields[1] as String,
      body: fields[2] as String,
      type: fields[3] as NotificationType,
      targetUserId: fields[4] as String?,
      targetRole: fields[5] as String?,
      isRead: fields[6] as bool,
      createdAt: fields[7] as DateTime,
      actionUrl: fields[8] as String?,
      metadata: (fields[9] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, NotificationModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.body)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.targetUserId)
      ..writeByte(5)
      ..write(obj.targetRole)
      ..writeByte(6)
      ..write(obj.isRead)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.actionUrl)
      ..writeByte(9)
      ..write(obj.metadata);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NotificationTypeAdapter extends TypeAdapter<NotificationType> {
  @override
  final int typeId = 13;

  @override
  NotificationType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return NotificationType.general;
      case 1:
        return NotificationType.attendance;
      case 2:
        return NotificationType.grade;
      case 3:
        return NotificationType.assignment;
      case 4:
        return NotificationType.fee;
      case 5:
        return NotificationType.exam;
      case 6:
        return NotificationType.announcement;
      case 7:
        return NotificationType.reminder;
      default:
        return NotificationType.general;
    }
  }

  @override
  void write(BinaryWriter writer, NotificationType obj) {
    switch (obj) {
      case NotificationType.general:
        writer.writeByte(0);
        break;
      case NotificationType.attendance:
        writer.writeByte(1);
        break;
      case NotificationType.grade:
        writer.writeByte(2);
        break;
      case NotificationType.assignment:
        writer.writeByte(3);
        break;
      case NotificationType.fee:
        writer.writeByte(4);
        break;
      case NotificationType.exam:
        writer.writeByte(5);
        break;
      case NotificationType.announcement:
        writer.writeByte(6);
        break;
      case NotificationType.reminder:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
