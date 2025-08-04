import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'staff_model.g.dart';

@HiveType(typeId: 63)
class StaffModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String employeeId;
  
  @HiveField(2)
  String firstName;
  
  @HiveField(3)
  String lastName;
  
  @HiveField(4)
  String email;
  
  @HiveField(5)
  String phoneNumber;
  
  @HiveField(6)
  String? alternatePhone;
  
  @HiveField(7)
  DateTime dateOfBirth;
  
  @HiveField(8)
  Gender gender;
  
  @HiveField(9)
  String address;
  
  @HiveField(10)
  StaffRole role;
  
  @HiveField(11)
  String department;
  
  @HiveField(12)
  String designation;
  
  @HiveField(13)
  DateTime joiningDate;
  
  @HiveField(14)
  DateTime? leavingDate;
  
  @HiveField(15)
  EmploymentType employmentType;
  
  @HiveField(16)
  StaffStatus status;
  
  @HiveField(17)
  double basicSalary;
  
  @HiveField(18)
  List<String> qualifications;
  
  @HiveField(19)
  List<String> subjects;
  
  @HiveField(20)
  String? profileImageUrl;
  
  @HiveField(21)
  String? emergencyContact;
  
  @HiveField(22)
  String? emergencyContactName;
  
  @HiveField(23)
  String? bankAccountNumber;
  
  @HiveField(24)
  String? bankName;
  
  @HiveField(25)
  String? ifscCode;
  
  @HiveField(26)
  String? aadharNumber;
  
  @HiveField(27)
  String? panNumber;
  
  @HiveField(28)
  DateTime createdAt;
  
  @HiveField(29)
  String createdBy;

  StaffModel({
    this.id,
    required this.employeeId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.alternatePhone,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    required this.role,
    required this.department,
    required this.designation,
    required this.joiningDate,
    this.leavingDate,
    this.employmentType = EmploymentType.fullTime,
    this.status = StaffStatus.active,
    required this.basicSalary,
    this.qualifications = const [],
    this.subjects = const [],
    this.profileImageUrl,
    this.emergencyContact,
    this.emergencyContactName,
    this.bankAccountNumber,
    this.bankName,
    this.ifscCode,
    this.aadharNumber,
    this.panNumber,
    required this.createdAt,
    required this.createdBy,
  });

  String get fullName => '$firstName $lastName';
  int get age => DateTime.now().difference(dateOfBirth).inDays ~/ 365;
  int get experienceInYears => DateTime.now().difference(joiningDate).inDays ~/ 365;
  bool get isActive => status == StaffStatus.active;
  String get initials => '${firstName[0]}${lastName[0]}';

  factory StaffModel.fromMap(Map<String, dynamic> map) {
    return StaffModel(
      id: map['id'],
      employeeId: map['employeeId'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      alternatePhone: map['alternatePhone'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
      gender: Gender.values.firstWhere(
        (e) => e.toString().split('.').last == map['gender'],
        orElse: () => Gender.male,
      ),
      address: map['address'],
      role: StaffRole.values.firstWhere(
        (e) => e.toString().split('.').last == map['role'],
        orElse: () => StaffRole.teacher,
      ),
      department: map['department'],
      designation: map['designation'],
      joiningDate: DateTime.parse(map['joiningDate']),
      leavingDate: map['leavingDate'] != null ? DateTime.parse(map['leavingDate']) : null,
      employmentType: EmploymentType.values.firstWhere(
        (e) => e.toString().split('.').last == map['employmentType'],
        orElse: () => EmploymentType.fullTime,
      ),
      status: StaffStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => StaffStatus.active,
      ),
      basicSalary: map['basicSalary'].toDouble(),
      qualifications: List<String>.from(map['qualifications'] ?? []),
      subjects: List<String>.from(map['subjects'] ?? []),
      profileImageUrl: map['profileImageUrl'],
      emergencyContact: map['emergencyContact'],
      emergencyContactName: map['emergencyContactName'],
      bankAccountNumber: map['bankAccountNumber'],
      bankName: map['bankName'],
      ifscCode: map['ifscCode'],
      aadharNumber: map['aadharNumber'],
      panNumber: map['panNumber'],
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'employeeId': employeeId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'alternatePhone': alternatePhone,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'gender': gender.toString().split('.').last,
      'address': address,
      'role': role.toString().split('.').last,
      'department': department,
      'designation': designation,
      'joiningDate': joiningDate.toIso8601String(),
      'leavingDate': leavingDate?.toIso8601String(),
      'employmentType': employmentType.toString().split('.').last,
      'status': status.toString().split('.').last,
      'basicSalary': basicSalary,
      'qualifications': qualifications,
      'subjects': subjects,
      'profileImageUrl': profileImageUrl,
      'emergencyContact': emergencyContact,
      'emergencyContactName': emergencyContactName,
      'bankAccountNumber': bankAccountNumber,
      'bankName': bankName,
      'ifscCode': ifscCode,
      'aadharNumber': aadharNumber,
      'panNumber': panNumber,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }
}

@HiveType(typeId: 64)
class PayrollModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String staffId;
  
  @HiveField(2)
  String staffName;
  
  @HiveField(3)
  String employeeId;
  
  @HiveField(4)
  int month;
  
  @HiveField(5)
  int year;
  
  @HiveField(6)
  double basicSalary;
  
  @HiveField(7)
  double hra;
  
  @HiveField(8)
  double da;
  
  @HiveField(9)
  double medicalAllowance;
  
  @HiveField(10)
  double transportAllowance;
  
  @HiveField(11)
  double specialAllowance;
  
  @HiveField(12)
  double overtimeAmount;
  
  @HiveField(13)
  double bonusAmount;
  
  @HiveField(14)
  double pfDeduction;
  
  @HiveField(15)
  double esiDeduction;
  
  @HiveField(16)
  double taxDeduction;
  
  @HiveField(17)
  double loanDeduction;
  
  @HiveField(18)
  double otherDeductions;
  
  @HiveField(19)
  int workingDays;
  
  @HiveField(20)
  int presentDays;
  
  @HiveField(21)
  int absentDays;
  
  @HiveField(22)
  int casualLeaves;
  
  @HiveField(23)
  int sickLeaves;
  
  @HiveField(24)
  double lossOfPay;
  
  @HiveField(25)
  PayrollStatus status;
  
  @HiveField(26)
  DateTime? paidDate;
  
  @HiveField(27)
  String paymentMode;
  
  @HiveField(28)
  String? remarks;
  
  @HiveField(29)
  DateTime createdAt;
  
  @HiveField(30)
  String createdBy;
  
  @HiveField(31)
  DateTime? processedAt;
  
  @HiveField(32)
  String? processedBy;

  PayrollModel({
    this.id,
    required this.staffId,
    required this.staffName,
    required this.employeeId,
    required this.month,
    required this.year,
    required this.basicSalary,
    this.hra = 0.0,
    this.da = 0.0,
    this.medicalAllowance = 0.0,
    this.transportAllowance = 0.0,
    this.specialAllowance = 0.0,
    this.overtimeAmount = 0.0,
    this.bonusAmount = 0.0,
    this.pfDeduction = 0.0,
    this.esiDeduction = 0.0,
    this.taxDeduction = 0.0,
    this.loanDeduction = 0.0,
    this.otherDeductions = 0.0,
    required this.workingDays,
    required this.presentDays,
    this.absentDays = 0,
    this.casualLeaves = 0,
    this.sickLeaves = 0,
    this.lossOfPay = 0.0,
    this.status = PayrollStatus.draft,
    this.paidDate,
    this.paymentMode = 'Bank Transfer',
    this.remarks,
    required this.createdAt,
    required this.createdBy,
    this.processedAt,
    this.processedBy,
  });

  double get totalEarnings => 
      basicSalary + hra + da + medicalAllowance + 
      transportAllowance + specialAllowance + overtimeAmount + bonusAmount;
  
  double get totalDeductions => 
      pfDeduction + esiDeduction + taxDeduction + 
      loanDeduction + otherDeductions + lossOfPay;
  
  double get netSalary => totalEarnings - totalDeductions;
  
  String get monthYear => '${_getMonthName(month)} $year';
  
  double get attendancePercentage => 
      workingDays > 0 ? (presentDays / workingDays) * 100 : 0.0;

  String _getMonthName(int month) {
    const months = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month];
  }

  factory PayrollModel.fromMap(Map<String, dynamic> map) {
    return PayrollModel(
      id: map['id'],
      staffId: map['staffId'],
      staffName: map['staffName'],
      employeeId: map['employeeId'],
      month: map['month'],
      year: map['year'],
      basicSalary: map['basicSalary'].toDouble(),
      hra: map['hra']?.toDouble() ?? 0.0,
      da: map['da']?.toDouble() ?? 0.0,
      medicalAllowance: map['medicalAllowance']?.toDouble() ?? 0.0,
      transportAllowance: map['transportAllowance']?.toDouble() ?? 0.0,
      specialAllowance: map['specialAllowance']?.toDouble() ?? 0.0,
      overtimeAmount: map['overtimeAmount']?.toDouble() ?? 0.0,
      bonusAmount: map['bonusAmount']?.toDouble() ?? 0.0,
      pfDeduction: map['pfDeduction']?.toDouble() ?? 0.0,
      esiDeduction: map['esiDeduction']?.toDouble() ?? 0.0,
      taxDeduction: map['taxDeduction']?.toDouble() ?? 0.0,
      loanDeduction: map['loanDeduction']?.toDouble() ?? 0.0,
      otherDeductions: map['otherDeductions']?.toDouble() ?? 0.0,
      workingDays: map['workingDays'],
      presentDays: map['presentDays'],
      absentDays: map['absentDays'] ?? 0,
      casualLeaves: map['casualLeaves'] ?? 0,
      sickLeaves: map['sickLeaves'] ?? 0,
      lossOfPay: map['lossOfPay']?.toDouble() ?? 0.0,
      status: PayrollStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => PayrollStatus.draft,
      ),
      paidDate: map['paidDate'] != null ? DateTime.parse(map['paidDate']) : null,
      paymentMode: map['paymentMode'] ?? 'Bank Transfer',
      remarks: map['remarks'],
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'],
      processedAt: map['processedAt'] != null ? DateTime.parse(map['processedAt']) : null,
      processedBy: map['processedBy'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'staffId': staffId,
      'staffName': staffName,
      'employeeId': employeeId,
      'month': month,
      'year': year,
      'basicSalary': basicSalary,
      'hra': hra,
      'da': da,
      'medicalAllowance': medicalAllowance,
      'transportAllowance': transportAllowance,
      'specialAllowance': specialAllowance,
      'overtimeAmount': overtimeAmount,
      'bonusAmount': bonusAmount,
      'pfDeduction': pfDeduction,
      'esiDeduction': esiDeduction,
      'taxDeduction': taxDeduction,
      'loanDeduction': loanDeduction,
      'otherDeductions': otherDeductions,
      'workingDays': workingDays,
      'presentDays': presentDays,
      'absentDays': absentDays,
      'casualLeaves': casualLeaves,
      'sickLeaves': sickLeaves,
      'lossOfPay': lossOfPay,
      'status': status.toString().split('.').last,
      'paidDate': paidDate?.toIso8601String(),
      'paymentMode': paymentMode,
      'remarks': remarks,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
      'processedAt': processedAt?.toIso8601String(),
      'processedBy': processedBy,
    };
  }
}

@HiveType(typeId: 65)
class AttendanceModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String staffId;
  
  @HiveField(2)
  String staffName;
  
  @HiveField(3)
  DateTime date;
  
  @HiveField(4)
  AttendanceStatus status;
  
  @HiveField(5)
  DateTime? checkInTime;
  
  @HiveField(6)
  DateTime? checkOutTime;
  
  @HiveField(7)
  String? checkInLocation;
  
  @HiveField(8)
  String? checkOutLocation;
  
  @HiveField(9)
  LeaveType? leaveType;
  
  @HiveField(10)
  String? leaveReason;
  
  @HiveField(11)
  double? overtimeHours;
  
  @HiveField(12)
  String? remarks;
  
  @HiveField(13)
  DateTime createdAt;
  
  @HiveField(14)
  String? markedBy;

  AttendanceModel({
    this.id,
    required this.staffId,
    required this.staffName,
    required this.date,
    required this.status,
    this.checkInTime,
    this.checkOutTime,
    this.checkInLocation,
    this.checkOutLocation,
    this.leaveType,
    this.leaveReason,
    this.overtimeHours,
    this.remarks,
    required this.createdAt,
    this.markedBy,
  });

  Duration? get workDuration {
    if (checkInTime != null && checkOutTime != null) {
      return checkOutTime!.difference(checkInTime!);
    }
    return null;
  }

  double get workHours {
    final duration = workDuration;
    return duration != null ? duration.inMinutes / 60.0 : 0.0;
  }

  bool get isLate {
    if (checkInTime == null) return false;
    // Assuming standard work time starts at 9:00 AM
    final standardTime = DateTime(
      checkInTime!.year, 
      checkInTime!.month, 
      checkInTime!.day, 
      9, 0
    );
    return checkInTime!.isAfter(standardTime);
  }

  bool get isEarlyLeave {
    if (checkOutTime == null) return false;
    // Assuming standard work time ends at 5:00 PM
    final standardTime = DateTime(
      checkOutTime!.year, 
      checkOutTime!.month, 
      checkOutTime!.day, 
      17, 0
    );
    return checkOutTime!.isBefore(standardTime);
  }

  factory AttendanceModel.fromMap(Map<String, dynamic> map) {
    return AttendanceModel(
      id: map['id'],
      staffId: map['staffId'],
      staffName: map['staffName'],
      date: DateTime.parse(map['date']),
      status: AttendanceStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => AttendanceStatus.absent,
      ),
      checkInTime: map['checkInTime'] != null ? DateTime.parse(map['checkInTime']) : null,
      checkOutTime: map['checkOutTime'] != null ? DateTime.parse(map['checkOutTime']) : null,
      checkInLocation: map['checkInLocation'],
      checkOutLocation: map['checkOutLocation'],
      leaveType: map['leaveType'] != null 
          ? LeaveType.values.firstWhere(
              (e) => e.toString().split('.').last == map['leaveType'],
              orElse: () => LeaveType.casual,
            )
          : null,
      leaveReason: map['leaveReason'],
      overtimeHours: map['overtimeHours']?.toDouble(),
      remarks: map['remarks'],
      createdAt: DateTime.parse(map['createdAt']),
      markedBy: map['markedBy'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'staffId': staffId,
      'staffName': staffName,
      'date': date.toIso8601String(),
      'status': status.toString().split('.').last,
      'checkInTime': checkInTime?.toIso8601String(),
      'checkOutTime': checkOutTime?.toIso8601String(),
      'checkInLocation': checkInLocation,
      'checkOutLocation': checkOutLocation,
      'leaveType': leaveType?.toString().split('.').last,
      'leaveReason': leaveReason,
      'overtimeHours': overtimeHours,
      'remarks': remarks,
      'createdAt': createdAt.toIso8601String(),
      'markedBy': markedBy,
    };
  }
}

@HiveType(typeId: 66)
class LeaveRequestModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String staffId;
  
  @HiveField(2)
  String staffName;
  
  @HiveField(3)
  LeaveType leaveType;
  
  @HiveField(4)
  DateTime startDate;
  
  @HiveField(5)
  DateTime endDate;
  
  @HiveField(6)
  int totalDays;
  
  @HiveField(7)
  String reason;
  
  @HiveField(8)
  LeaveStatus status;
  
  @HiveField(9)
  String? approvedBy;
  
  @HiveField(10)
  DateTime? approvedAt;
  
  @HiveField(11)
  String? rejectionReason;
  
  @HiveField(12)
  String? attachmentUrl;
  
  @HiveField(13)
  DateTime appliedAt;
  
  @HiveField(14)
  String? remarks;

  LeaveRequestModel({
    this.id,
    required this.staffId,
    required this.staffName,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.totalDays,
    required this.reason,
    this.status = LeaveStatus.pending,
    this.approvedBy,
    this.approvedAt,
    this.rejectionReason,
    this.attachmentUrl,
    required this.appliedAt,
    this.remarks,
  });

  bool get isApproved => status == LeaveStatus.approved;
  bool get isRejected => status == LeaveStatus.rejected;
  bool get isPending => status == LeaveStatus.pending;
  bool get isActive => isApproved && DateTime.now().isAfter(startDate) && DateTime.now().isBefore(endDate.add(const Duration(days: 1)));

  factory LeaveRequestModel.fromMap(Map<String, dynamic> map) {
    return LeaveRequestModel(
      id: map['id'],
      staffId: map['staffId'],
      staffName: map['staffName'],
      leaveType: LeaveType.values.firstWhere(
        (e) => e.toString().split('.').last == map['leaveType'],
        orElse: () => LeaveType.casual,
      ),
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      totalDays: map['totalDays'],
      reason: map['reason'],
      status: LeaveStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => LeaveStatus.pending,
      ),
      approvedBy: map['approvedBy'],
      approvedAt: map['approvedAt'] != null ? DateTime.parse(map['approvedAt']) : null,
      rejectionReason: map['rejectionReason'],
      attachmentUrl: map['attachmentUrl'],
      appliedAt: DateTime.parse(map['appliedAt']),
      remarks: map['remarks'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'staffId': staffId,
      'staffName': staffName,
      'leaveType': leaveType.toString().split('.').last,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'totalDays': totalDays,
      'reason': reason,
      'status': status.toString().split('.').last,
      'approvedBy': approvedBy,
      'approvedAt': approvedAt?.toIso8601String(),
      'rejectionReason': rejectionReason,
      'attachmentUrl': attachmentUrl,
      'appliedAt': appliedAt.toIso8601String(),
      'remarks': remarks,
    };
  }
}

// Enums
@HiveType(typeId: 67)
enum Gender {
  @HiveField(0)
  male,
  
  @HiveField(1)
  female,
  
  @HiveField(2)
  other,
}

@HiveType(typeId: 68)
enum StaffRole {
  @HiveField(0)
  teacher,
  
  @HiveField(1)
  principal,
  
  @HiveField(2)
  vice_principal,
  
  @HiveField(3)
  head_teacher,
  
  @HiveField(4)
  admin_staff,
  
  @HiveField(5)
  librarian,
  
  @HiveField(6)
  lab_assistant,
  
  @HiveField(7)
  counselor,
  
  @HiveField(8)
  nurse,
  
  @HiveField(9)
  security,
  
  @HiveField(10)
  maintenance,
  
  @HiveField(11)
  transport,
  
  @HiveField(12)
  accountant,
}

@HiveType(typeId: 69)
enum EmploymentType {
  @HiveField(0)
  fullTime,
  
  @HiveField(1)
  partTime,
  
  @HiveField(2)
  contract,
  
  @HiveField(3)
  temporary,
  
  @HiveField(4)
  substitute,
}

@HiveType(typeId: 70)
enum StaffStatus {
  @HiveField(0)
  active,
  
  @HiveField(1)
  inactive,
  
  @HiveField(2)
  on_leave,
  
  @HiveField(3)
  suspended,
  
  @HiveField(4)
  terminated,
  
  @HiveField(5)
  resigned,
}

@HiveType(typeId: 71)
enum PayrollStatus {
  @HiveField(0)
  draft,
  
  @HiveField(1)
  calculated,
  
  @HiveField(2)
  approved,
  
  @HiveField(3)
  paid,
  
  @HiveField(4)
  cancelled,
}

@HiveType(typeId: 72)
enum AttendanceStatus {
  @HiveField(0)
  present,
  
  @HiveField(1)
  absent,
  
  @HiveField(2)
  late,
  
  @HiveField(3)
  half_day,
  
  @HiveField(4)
  on_leave,
  
  @HiveField(5)
  holiday,
  
  @HiveField(6)
  weekend,
}

@HiveType(typeId: 73)
enum LeaveType {
  @HiveField(0)
  casual,
  
  @HiveField(1)
  sick,
  
  @HiveField(2)
  earned,
  
  @HiveField(3)
  maternity,
  
  @HiveField(4)
  paternity,
  
  @HiveField(5)
  emergency,
  
  @HiveField(6)
  compensatory,
}

@HiveType(typeId: 74)
enum LeaveStatus {
  @HiveField(0)
  pending,
  
  @HiveField(1)
  approved,
  
  @HiveField(2)
  rejected,
  
  @HiveField(3)
  cancelled,
}

// Extensions
extension StaffRoleExtension on StaffRole {
  String get displayName {
    switch (this) {
      case StaffRole.teacher:
        return 'Teacher';
      case StaffRole.principal:
        return 'Principal';
      case StaffRole.vice_principal:
        return 'Vice Principal';
      case StaffRole.head_teacher:
        return 'Head Teacher';
      case StaffRole.admin_staff:
        return 'Admin Staff';
      case StaffRole.librarian:
        return 'Librarian';
      case StaffRole.lab_assistant:
        return 'Lab Assistant';
      case StaffRole.counselor:
        return 'Counselor';
      case StaffRole.nurse:
        return 'Nurse';
      case StaffRole.security:
        return 'Security';
      case StaffRole.maintenance:
        return 'Maintenance';
      case StaffRole.transport:
        return 'Transport';
      case StaffRole.accountant:
        return 'Accountant';
    }
  }

  String get icon {
    switch (this) {
      case StaffRole.teacher:
        return '👨‍🏫';
      case StaffRole.principal:
        return '👨‍💼';
      case StaffRole.vice_principal:
        return '👩‍💼';
      case StaffRole.head_teacher:
        return '👨‍🏫';
      case StaffRole.admin_staff:
        return '👨‍💻';
      case StaffRole.librarian:
        return '📚';
      case StaffRole.lab_assistant:
        return '🧪';
      case StaffRole.counselor:
        return '👨‍⚕️';
      case StaffRole.nurse:
        return '👩‍⚕️';
      case StaffRole.security:
        return '🛡️';
      case StaffRole.maintenance:
        return '🔧';
      case StaffRole.transport:
        return '🚌';
      case StaffRole.accountant:
        return '💰';
    }
  }

  Color get color {
    switch (this) {
      case StaffRole.teacher:
        return const Color(0xFF2196F3);
      case StaffRole.principal:
      case StaffRole.vice_principal:
        return const Color(0xFF9C27B0);
      case StaffRole.head_teacher:
        return const Color(0xFF3F51B5);
      case StaffRole.admin_staff:
        return const Color(0xFF4CAF50);
      case StaffRole.librarian:
        return const Color(0xFF795548);
      case StaffRole.lab_assistant:
        return const Color(0xFFFF9800);
      case StaffRole.counselor:
      case StaffRole.nurse:
        return const Color(0xFFE91E63);
      case StaffRole.security:
        return const Color(0xFF607D8B);
      case StaffRole.maintenance:
        return const Color(0xFF9E9E9E);
      case StaffRole.transport:
        return const Color(0xFF00BCD4);
      case StaffRole.accountant:
        return const Color(0xFF4CAF50);
    }
  }
}

extension LeaveTypeExtension on LeaveType {
  String get displayName {
    switch (this) {
      case LeaveType.casual:
        return 'Casual Leave';
      case LeaveType.sick:
        return 'Sick Leave';
      case LeaveType.earned:
        return 'Earned Leave';
      case LeaveType.maternity:
        return 'Maternity Leave';
      case LeaveType.paternity:
        return 'Paternity Leave';
      case LeaveType.emergency:
        return 'Emergency Leave';
      case LeaveType.compensatory:
        return 'Compensatory Leave';
    }
  }

  Color get color {
    switch (this) {
      case LeaveType.casual:
        return Colors.blue;
      case LeaveType.sick:
        return Colors.red;
      case LeaveType.earned:
        return Colors.green;
      case LeaveType.maternity:
      case LeaveType.paternity:
        return Colors.pink;
      case LeaveType.emergency:
        return Colors.orange;
      case LeaveType.compensatory:
        return Colors.purple;
    }
  }
}

extension AttendanceStatusExtension on AttendanceStatus {
  String get displayName {
    switch (this) {
      case AttendanceStatus.present:
        return 'Present';
      case AttendanceStatus.absent:
        return 'Absent';
      case AttendanceStatus.late:
        return 'Late';
      case AttendanceStatus.half_day:
        return 'Half Day';
      case AttendanceStatus.on_leave:
        return 'On Leave';
      case AttendanceStatus.holiday:
        return 'Holiday';
      case AttendanceStatus.weekend:
        return 'Weekend';
    }
  }

  Color get color {
    switch (this) {
      case AttendanceStatus.present:
        return Colors.green;
      case AttendanceStatus.absent:
        return Colors.red;
      case AttendanceStatus.late:
        return Colors.orange;
      case AttendanceStatus.half_day:
        return Colors.amber;
      case AttendanceStatus.on_leave:
        return Colors.blue;
      case AttendanceStatus.holiday:
      case AttendanceStatus.weekend:
        return Colors.grey;
    }
  }
}