import 'package:hive_flutter/hive_flutter.dart';

part 'parent_model.g.dart';

@HiveType(typeId: 24)
class ParentModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String name;
  
  @HiveField(2)
  String email;
  
  @HiveField(3)
  String phoneNumber;
  
  @HiveField(4)
  String? whatsappNumber;
  
  @HiveField(5)
  String? address;
  
  @HiveField(6)
  List<String> childrenIds;
  
  @HiveField(7)
  ParentType parentType;
  
  @HiveField(8)
  String? occupation;
  
  @HiveField(9)
  String? workplace;
  
  @HiveField(10)
  String? emergencyContact;
  
  @HiveField(11)
  DateTime createdAt;
  
  @HiveField(12)
  DateTime? lastLogin;
  
  @HiveField(13)
  bool isActive;

  ParentModel({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.whatsappNumber,
    this.address,
    this.childrenIds = const [],
    this.parentType = ParentType.father,
    this.occupation,
    this.workplace,
    this.emergencyContact,
    required this.createdAt,
    this.lastLogin,
    this.isActive = true,
  });

  factory ParentModel.fromMap(Map<String, dynamic> map) {
    return ParentModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      whatsappNumber: map['whatsappNumber'],
      address: map['address'],
      childrenIds: List<String>.from(map['childrenIds'] ?? []),
      parentType: ParentType.values.firstWhere(
        (e) => e.toString().split('.').last == map['parentType'],
        orElse: () => ParentType.father,
      ),
      occupation: map['occupation'],
      workplace: map['workplace'],
      emergencyContact: map['emergencyContact'],
      createdAt: DateTime.parse(map['createdAt']),
      lastLogin: map['lastLogin'] != null ? DateTime.parse(map['lastLogin']) : null,
      isActive: map['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'whatsappNumber': whatsappNumber,
      'address': address,
      'childrenIds': childrenIds,
      'parentType': parentType.toString().split('.').last,
      'occupation': occupation,
      'workplace': workplace,
      'emergencyContact': emergencyContact,
      'createdAt': createdAt.toIso8601String(),
      'lastLogin': lastLogin?.toIso8601String(),
      'isActive': isActive,
    };
  }
}

@HiveType(typeId: 25)
enum ParentType {
  @HiveField(0)
  father,
  
  @HiveField(1)
  mother,
  
  @HiveField(2)
  guardian,
}

@HiveType(typeId: 26)
class MessageModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String senderId;
  
  @HiveField(2)
  String senderName;
  
  @HiveField(3)
  String senderRole; // teacher, admin, parent
  
  @HiveField(4)
  String receiverId;
  
  @HiveField(5)
  String receiverName;
  
  @HiveField(6)
  String receiverRole;
  
  @HiveField(7)
  String subject;
  
  @HiveField(8)
  String content;
  
  @HiveField(9)
  MessageType messageType;
  
  @HiveField(10)
  MessagePriority priority;
  
  @HiveField(11)
  DateTime sentAt;
  
  @HiveField(12)
  DateTime? readAt;
  
  @HiveField(13)
  bool isRead;
  
  @HiveField(14)
  String? attachmentUrl;
  
  @HiveField(15)
  String? relatedStudentId;

  MessageModel({
    this.id,
    required this.senderId,
    required this.senderName,
    required this.senderRole,
    required this.receiverId,
    required this.receiverName,
    required this.receiverRole,
    required this.subject,
    required this.content,
    this.messageType = MessageType.general,
    this.priority = MessagePriority.normal,
    required this.sentAt,
    this.readAt,
    this.isRead = false,
    this.attachmentUrl,
    this.relatedStudentId,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'],
      senderId: map['senderId'],
      senderName: map['senderName'],
      senderRole: map['senderRole'],
      receiverId: map['receiverId'],
      receiverName: map['receiverName'],
      receiverRole: map['receiverRole'],
      subject: map['subject'],
      content: map['content'],
      messageType: MessageType.values.firstWhere(
        (e) => e.toString().split('.').last == map['messageType'],
        orElse: () => MessageType.general,
      ),
      priority: MessagePriority.values.firstWhere(
        (e) => e.toString().split('.').last == map['priority'],
        orElse: () => MessagePriority.normal,
      ),
      sentAt: DateTime.parse(map['sentAt']),
      readAt: map['readAt'] != null ? DateTime.parse(map['readAt']) : null,
      isRead: map['isRead'] ?? false,
      attachmentUrl: map['attachmentUrl'],
      relatedStudentId: map['relatedStudentId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'senderName': senderName,
      'senderRole': senderRole,
      'receiverId': receiverId,
      'receiverName': receiverName,
      'receiverRole': receiverRole,
      'subject': subject,
      'content': content,
      'messageType': messageType.toString().split('.').last,
      'priority': priority.toString().split('.').last,
      'sentAt': sentAt.toIso8601String(),
      'readAt': readAt?.toIso8601String(),
      'isRead': isRead,
      'attachmentUrl': attachmentUrl,
      'relatedStudentId': relatedStudentId,
    };
  }
}

@HiveType(typeId: 27)
enum MessageType {
  @HiveField(0)
  general,
  
  @HiveField(1)
  academic,
  
  @HiveField(2)
  disciplinary,
  
  @HiveField(3)
  attendance,
  
  @HiveField(4)
  fee,
  
  @HiveField(5)
  health,
  
  @HiveField(6)
  event,
}

@HiveType(typeId: 28)
enum MessagePriority {
  @HiveField(0)
  low,
  
  @HiveField(1)
  normal,
  
  @HiveField(2)
  high,
  
  @HiveField(3)
  urgent,
}

extension MessageTypeExtension on MessageType {
  String get displayName {
    switch (this) {
      case MessageType.general:
        return 'General';
      case MessageType.academic:
        return 'Academic';
      case MessageType.disciplinary:
        return 'Disciplinary';
      case MessageType.attendance:
        return 'Attendance';
      case MessageType.fee:
        return 'Fee Related';
      case MessageType.health:
        return 'Health';
      case MessageType.event:
        return 'Event';
    }
  }
  
  String get icon {
    switch (this) {
      case MessageType.general:
        return '💬';
      case MessageType.academic:
        return '📚';
      case MessageType.disciplinary:
        return '⚠️';
      case MessageType.attendance:
        return '📅';
      case MessageType.fee:
        return '💰';
      case MessageType.health:
        return '🏥';
      case MessageType.event:
        return '🎉';
    }
  }
}