// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParentModelAdapter extends TypeAdapter<ParentModel> {
  @override
  final int typeId = 24;

  @override
  ParentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParentModel(
      id: fields[0] as String?,
      name: fields[1] as String,
      email: fields[2] as String,
      phoneNumber: fields[3] as String,
      whatsappNumber: fields[4] as String?,
      address: fields[5] as String?,
      childrenIds: (fields[6] as List).cast<String>(),
      parentType: fields[7] as ParentType,
      occupation: fields[8] as String?,
      workplace: fields[9] as String?,
      emergencyContact: fields[10] as String?,
      createdAt: fields[11] as DateTime,
      lastLogin: fields[12] as DateTime?,
      isActive: fields[13] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ParentModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.whatsappNumber)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.childrenIds)
      ..writeByte(7)
      ..write(obj.parentType)
      ..writeByte(8)
      ..write(obj.occupation)
      ..writeByte(9)
      ..write(obj.workplace)
      ..writeByte(10)
      ..write(obj.emergencyContact)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.lastLogin)
      ..writeByte(13)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MessageModelAdapter extends TypeAdapter<MessageModel> {
  @override
  final int typeId = 26;

  @override
  MessageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessageModel(
      id: fields[0] as String?,
      senderId: fields[1] as String,
      senderName: fields[2] as String,
      senderRole: fields[3] as String,
      receiverId: fields[4] as String,
      receiverName: fields[5] as String,
      receiverRole: fields[6] as String,
      subject: fields[7] as String,
      content: fields[8] as String,
      messageType: fields[9] as MessageType,
      priority: fields[10] as MessagePriority,
      sentAt: fields[11] as DateTime,
      readAt: fields[12] as DateTime?,
      isRead: fields[13] as bool,
      attachmentUrl: fields[14] as String?,
      relatedStudentId: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MessageModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.senderId)
      ..writeByte(2)
      ..write(obj.senderName)
      ..writeByte(3)
      ..write(obj.senderRole)
      ..writeByte(4)
      ..write(obj.receiverId)
      ..writeByte(5)
      ..write(obj.receiverName)
      ..writeByte(6)
      ..write(obj.receiverRole)
      ..writeByte(7)
      ..write(obj.subject)
      ..writeByte(8)
      ..write(obj.content)
      ..writeByte(9)
      ..write(obj.messageType)
      ..writeByte(10)
      ..write(obj.priority)
      ..writeByte(11)
      ..write(obj.sentAt)
      ..writeByte(12)
      ..write(obj.readAt)
      ..writeByte(13)
      ..write(obj.isRead)
      ..writeByte(14)
      ..write(obj.attachmentUrl)
      ..writeByte(15)
      ..write(obj.relatedStudentId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ParentTypeAdapter extends TypeAdapter<ParentType> {
  @override
  final int typeId = 25;

  @override
  ParentType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ParentType.father;
      case 1:
        return ParentType.mother;
      case 2:
        return ParentType.guardian;
      default:
        return ParentType.father;
    }
  }

  @override
  void write(BinaryWriter writer, ParentType obj) {
    switch (obj) {
      case ParentType.father:
        writer.writeByte(0);
        break;
      case ParentType.mother:
        writer.writeByte(1);
        break;
      case ParentType.guardian:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParentTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MessageTypeAdapter extends TypeAdapter<MessageType> {
  @override
  final int typeId = 27;

  @override
  MessageType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MessageType.general;
      case 1:
        return MessageType.academic;
      case 2:
        return MessageType.disciplinary;
      case 3:
        return MessageType.attendance;
      case 4:
        return MessageType.fee;
      case 5:
        return MessageType.health;
      case 6:
        return MessageType.event;
      default:
        return MessageType.general;
    }
  }

  @override
  void write(BinaryWriter writer, MessageType obj) {
    switch (obj) {
      case MessageType.general:
        writer.writeByte(0);
        break;
      case MessageType.academic:
        writer.writeByte(1);
        break;
      case MessageType.disciplinary:
        writer.writeByte(2);
        break;
      case MessageType.attendance:
        writer.writeByte(3);
        break;
      case MessageType.fee:
        writer.writeByte(4);
        break;
      case MessageType.health:
        writer.writeByte(5);
        break;
      case MessageType.event:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MessagePriorityAdapter extends TypeAdapter<MessagePriority> {
  @override
  final int typeId = 28;

  @override
  MessagePriority read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MessagePriority.low;
      case 1:
        return MessagePriority.normal;
      case 2:
        return MessagePriority.high;
      case 3:
        return MessagePriority.urgent;
      default:
        return MessagePriority.low;
    }
  }

  @override
  void write(BinaryWriter writer, MessagePriority obj) {
    switch (obj) {
      case MessagePriority.low:
        writer.writeByte(0);
        break;
      case MessagePriority.normal:
        writer.writeByte(1);
        break;
      case MessagePriority.high:
        writer.writeByte(2);
        break;
      case MessagePriority.urgent:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessagePriorityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
