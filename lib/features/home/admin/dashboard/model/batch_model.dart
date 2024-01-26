import 'package:hive_flutter/hive_flutter.dart';

part 'batch_model.g.dart';

// @HiveType(typeId: 1)
// enum TransactionType {
//   @HiveField(0)
//   income,
//   @HiveField(1)
//   expense,
// }

@HiveType(typeId: 2)
class BatchModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final DateTime startDate;
  @HiveField(3)
  final DateTime endDate;
  @HiveField(4)
  final int orgId;

  BatchModel({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.orgId,
  });

  factory BatchModel.fromMap(Map<String, dynamic> map) {
    return BatchModel(
      id: map['id'],
      name: map['name'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      orgId: map['orgId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'startDate': startDate,
      'endDate': endDate,
      'orgId': orgId,
    };
  }
}
