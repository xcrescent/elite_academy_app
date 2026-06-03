import 'package:hive_flutter/hive_flutter.dart';

part 'notification_model.g.dart';

@HiveType(typeId: 12)
class NotificationModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String title;
  
  @HiveField(2)
  String body;
  
  @HiveField(3)
  NotificationType type;
  
  @HiveField(4)
  String? targetUserId;
  
  @HiveField(5)
  String? targetRole; // admin, faculty, student, parent
  
  @HiveField(6)
  bool isRead;
  
  @HiveField(7)
  DateTime createdAt;
  
  @HiveField(8)
  String? actionUrl;
  
  @HiveField(9)
  Map<String, dynamic>? metadata;

  NotificationModel({
    this.id,
    required this.title,
    required this.body,
    required this.type,
    this.targetUserId,
    this.targetRole,
    this.isRead = false,
    required this.createdAt,
    this.actionUrl,
    this.metadata,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      type: NotificationType.values.firstWhere(
        (e) => e.toString().split('.').last == map['type'],
        orElse: () => NotificationType.general,
      ),
      targetUserId: map['targetUserId'],
      targetRole: map['targetRole'],
      isRead: map['isRead'] ?? false,
      createdAt: DateTime.parse(map['createdAt']),
      actionUrl: map['actionUrl'],
      metadata: map['metadata'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'type': type.toString().split('.').last,
      'targetUserId': targetUserId,
      'targetRole': targetRole,
      'isRead': isRead,
      'createdAt': createdAt.toIso8601String(),
      'actionUrl': actionUrl,
      'metadata': metadata,
    };
  }
}

@HiveType(typeId: 13)
enum NotificationType {
  @HiveField(0)
  general,
  
  @HiveField(1)
  attendance,
  
  @HiveField(2)
  grade,
  
  @HiveField(3)
  assignment,
  
  @HiveField(4)
  fee,
  
  @HiveField(5)
  exam,
  
  @HiveField(6)
  announcement,
  
  @HiveField(7)
  reminder,
}

extension NotificationTypeExtension on NotificationType {
  String get displayName {
    switch (this) {
      case NotificationType.general:
        return 'General';
      case NotificationType.attendance:
        return 'Attendance';
      case NotificationType.grade:
        return 'Grade';
      case NotificationType.assignment:
        return 'Assignment';
      case NotificationType.fee:
        return 'Fee';
      case NotificationType.exam:
        return 'Exam';
      case NotificationType.announcement:
        return 'Announcement';
      case NotificationType.reminder:
        return 'Reminder';
    }
  }
  
  String get icon {
    switch (this) {
      case NotificationType.general:
        return '📢';
      case NotificationType.attendance:
        return '📅';
      case NotificationType.grade:
        return '📊';
      case NotificationType.assignment:
        return '📝';
      case NotificationType.fee:
        return '💰';
      case NotificationType.exam:
        return '📋';
      case NotificationType.announcement:
        return '📣';
      case NotificationType.reminder:
        return '⏰';
    }
  }
}