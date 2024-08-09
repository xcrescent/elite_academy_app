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
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  DateTime? startDate;
  @HiveField(3)
  DateTime? endDate;
  @HiveField(4)
  String orgId;
  @HiveField(5)
  String? staffId;
  @HiveField(6)
  String? courseId;
  @HiveField(7)
  double fees;
  @HiveField(8)
  String feeType;

  BatchModel({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.orgId,
    this.staffId,
    this.courseId,
    required this.fees,
    this.feeType = "Monthly",
  });

  factory BatchModel.fromMap(Map<String, dynamic> map) {
    return BatchModel(
      id: map['id'],
      name: map['name'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      orgId: map['orgId'],
      staffId: map['staffId'],
      courseId: map['courseId'],
      fees: map['fees'],
      feeType: map['feeType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'startDate': startDate,
      'endDate': endDate,
      'orgId': orgId,
      'staffId': staffId,
      'courseId': courseId,
      'fees': fees,
      'feeType': feeType,
    };
  }
}
