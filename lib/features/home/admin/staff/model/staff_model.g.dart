// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StaffModelAdapter extends TypeAdapter<StaffModel> {
  @override
  final int typeId = 63;

  @override
  StaffModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StaffModel(
      id: fields[0] as String?,
      employeeId: fields[1] as String,
      firstName: fields[2] as String,
      lastName: fields[3] as String,
      email: fields[4] as String,
      phoneNumber: fields[5] as String,
      alternatePhone: fields[6] as String?,
      dateOfBirth: fields[7] as DateTime,
      gender: fields[8] as Gender,
      address: fields[9] as String,
      role: fields[10] as StaffRole,
      department: fields[11] as String,
      designation: fields[12] as String,
      joiningDate: fields[13] as DateTime,
      leavingDate: fields[14] as DateTime?,
      employmentType: fields[15] as EmploymentType,
      status: fields[16] as StaffStatus,
      basicSalary: fields[17] as double,
      qualifications: (fields[18] as List).cast<String>(),
      subjects: (fields[19] as List).cast<String>(),
      profileImageUrl: fields[20] as String?,
      emergencyContact: fields[21] as String?,
      emergencyContactName: fields[22] as String?,
      bankAccountNumber: fields[23] as String?,
      bankName: fields[24] as String?,
      ifscCode: fields[25] as String?,
      aadharNumber: fields[26] as String?,
      panNumber: fields[27] as String?,
      createdAt: fields[28] as DateTime,
      createdBy: fields[29] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StaffModel obj) {
    writer
      ..writeByte(30)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.employeeId)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.phoneNumber)
      ..writeByte(6)
      ..write(obj.alternatePhone)
      ..writeByte(7)
      ..write(obj.dateOfBirth)
      ..writeByte(8)
      ..write(obj.gender)
      ..writeByte(9)
      ..write(obj.address)
      ..writeByte(10)
      ..write(obj.role)
      ..writeByte(11)
      ..write(obj.department)
      ..writeByte(12)
      ..write(obj.designation)
      ..writeByte(13)
      ..write(obj.joiningDate)
      ..writeByte(14)
      ..write(obj.leavingDate)
      ..writeByte(15)
      ..write(obj.employmentType)
      ..writeByte(16)
      ..write(obj.status)
      ..writeByte(17)
      ..write(obj.basicSalary)
      ..writeByte(18)
      ..write(obj.qualifications)
      ..writeByte(19)
      ..write(obj.subjects)
      ..writeByte(20)
      ..write(obj.profileImageUrl)
      ..writeByte(21)
      ..write(obj.emergencyContact)
      ..writeByte(22)
      ..write(obj.emergencyContactName)
      ..writeByte(23)
      ..write(obj.bankAccountNumber)
      ..writeByte(24)
      ..write(obj.bankName)
      ..writeByte(25)
      ..write(obj.ifscCode)
      ..writeByte(26)
      ..write(obj.aadharNumber)
      ..writeByte(27)
      ..write(obj.panNumber)
      ..writeByte(28)
      ..write(obj.createdAt)
      ..writeByte(29)
      ..write(obj.createdBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StaffModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PayrollModelAdapter extends TypeAdapter<PayrollModel> {
  @override
  final int typeId = 64;

  @override
  PayrollModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PayrollModel(
      id: fields[0] as String?,
      staffId: fields[1] as String,
      staffName: fields[2] as String,
      employeeId: fields[3] as String,
      month: fields[4] as int,
      year: fields[5] as int,
      basicSalary: fields[6] as double,
      hra: fields[7] as double,
      da: fields[8] as double,
      medicalAllowance: fields[9] as double,
      transportAllowance: fields[10] as double,
      specialAllowance: fields[11] as double,
      overtimeAmount: fields[12] as double,
      bonusAmount: fields[13] as double,
      pfDeduction: fields[14] as double,
      esiDeduction: fields[15] as double,
      taxDeduction: fields[16] as double,
      loanDeduction: fields[17] as double,
      otherDeductions: fields[18] as double,
      workingDays: fields[19] as int,
      presentDays: fields[20] as int,
      absentDays: fields[21] as int,
      casualLeaves: fields[22] as int,
      sickLeaves: fields[23] as int,
      lossOfPay: fields[24] as double,
      status: fields[25] as PayrollStatus,
      paidDate: fields[26] as DateTime?,
      paymentMode: fields[27] as String,
      remarks: fields[28] as String?,
      createdAt: fields[29] as DateTime,
      createdBy: fields[30] as String,
      processedAt: fields[31] as DateTime?,
      processedBy: fields[32] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PayrollModel obj) {
    writer
      ..writeByte(33)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.staffId)
      ..writeByte(2)
      ..write(obj.staffName)
      ..writeByte(3)
      ..write(obj.employeeId)
      ..writeByte(4)
      ..write(obj.month)
      ..writeByte(5)
      ..write(obj.year)
      ..writeByte(6)
      ..write(obj.basicSalary)
      ..writeByte(7)
      ..write(obj.hra)
      ..writeByte(8)
      ..write(obj.da)
      ..writeByte(9)
      ..write(obj.medicalAllowance)
      ..writeByte(10)
      ..write(obj.transportAllowance)
      ..writeByte(11)
      ..write(obj.specialAllowance)
      ..writeByte(12)
      ..write(obj.overtimeAmount)
      ..writeByte(13)
      ..write(obj.bonusAmount)
      ..writeByte(14)
      ..write(obj.pfDeduction)
      ..writeByte(15)
      ..write(obj.esiDeduction)
      ..writeByte(16)
      ..write(obj.taxDeduction)
      ..writeByte(17)
      ..write(obj.loanDeduction)
      ..writeByte(18)
      ..write(obj.otherDeductions)
      ..writeByte(19)
      ..write(obj.workingDays)
      ..writeByte(20)
      ..write(obj.presentDays)
      ..writeByte(21)
      ..write(obj.absentDays)
      ..writeByte(22)
      ..write(obj.casualLeaves)
      ..writeByte(23)
      ..write(obj.sickLeaves)
      ..writeByte(24)
      ..write(obj.lossOfPay)
      ..writeByte(25)
      ..write(obj.status)
      ..writeByte(26)
      ..write(obj.paidDate)
      ..writeByte(27)
      ..write(obj.paymentMode)
      ..writeByte(28)
      ..write(obj.remarks)
      ..writeByte(29)
      ..write(obj.createdAt)
      ..writeByte(30)
      ..write(obj.createdBy)
      ..writeByte(31)
      ..write(obj.processedAt)
      ..writeByte(32)
      ..write(obj.processedBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PayrollModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AttendanceModelAdapter extends TypeAdapter<AttendanceModel> {
  @override
  final int typeId = 65;

  @override
  AttendanceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceModel(
      id: fields[0] as String?,
      staffId: fields[1] as String,
      staffName: fields[2] as String,
      date: fields[3] as DateTime,
      status: fields[4] as AttendanceStatus,
      checkInTime: fields[5] as DateTime?,
      checkOutTime: fields[6] as DateTime?,
      checkInLocation: fields[7] as String?,
      checkOutLocation: fields[8] as String?,
      leaveType: fields[9] as LeaveType?,
      leaveReason: fields[10] as String?,
      overtimeHours: fields[11] as double?,
      remarks: fields[12] as String?,
      createdAt: fields[13] as DateTime,
      markedBy: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.staffId)
      ..writeByte(2)
      ..write(obj.staffName)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.checkInTime)
      ..writeByte(6)
      ..write(obj.checkOutTime)
      ..writeByte(7)
      ..write(obj.checkInLocation)
      ..writeByte(8)
      ..write(obj.checkOutLocation)
      ..writeByte(9)
      ..write(obj.leaveType)
      ..writeByte(10)
      ..write(obj.leaveReason)
      ..writeByte(11)
      ..write(obj.overtimeHours)
      ..writeByte(12)
      ..write(obj.remarks)
      ..writeByte(13)
      ..write(obj.createdAt)
      ..writeByte(14)
      ..write(obj.markedBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LeaveRequestModelAdapter extends TypeAdapter<LeaveRequestModel> {
  @override
  final int typeId = 66;

  @override
  LeaveRequestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LeaveRequestModel(
      id: fields[0] as String?,
      staffId: fields[1] as String,
      staffName: fields[2] as String,
      leaveType: fields[3] as LeaveType,
      startDate: fields[4] as DateTime,
      endDate: fields[5] as DateTime,
      totalDays: fields[6] as int,
      reason: fields[7] as String,
      status: fields[8] as LeaveStatus,
      approvedBy: fields[9] as String?,
      approvedAt: fields[10] as DateTime?,
      rejectionReason: fields[11] as String?,
      attachmentUrl: fields[12] as String?,
      appliedAt: fields[13] as DateTime,
      remarks: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LeaveRequestModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.staffId)
      ..writeByte(2)
      ..write(obj.staffName)
      ..writeByte(3)
      ..write(obj.leaveType)
      ..writeByte(4)
      ..write(obj.startDate)
      ..writeByte(5)
      ..write(obj.endDate)
      ..writeByte(6)
      ..write(obj.totalDays)
      ..writeByte(7)
      ..write(obj.reason)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.approvedBy)
      ..writeByte(10)
      ..write(obj.approvedAt)
      ..writeByte(11)
      ..write(obj.rejectionReason)
      ..writeByte(12)
      ..write(obj.attachmentUrl)
      ..writeByte(13)
      ..write(obj.appliedAt)
      ..writeByte(14)
      ..write(obj.remarks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeaveRequestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenderAdapter extends TypeAdapter<Gender> {
  @override
  final int typeId = 67;

  @override
  Gender read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Gender.male;
      case 1:
        return Gender.female;
      case 2:
        return Gender.other;
      default:
        return Gender.male;
    }
  }

  @override
  void write(BinaryWriter writer, Gender obj) {
    switch (obj) {
      case Gender.male:
        writer.writeByte(0);
        break;
      case Gender.female:
        writer.writeByte(1);
        break;
      case Gender.other:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StaffRoleAdapter extends TypeAdapter<StaffRole> {
  @override
  final int typeId = 68;

  @override
  StaffRole read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return StaffRole.teacher;
      case 1:
        return StaffRole.principal;
      case 2:
        return StaffRole.vice_principal;
      case 3:
        return StaffRole.head_teacher;
      case 4:
        return StaffRole.admin_staff;
      case 5:
        return StaffRole.librarian;
      case 6:
        return StaffRole.lab_assistant;
      case 7:
        return StaffRole.counselor;
      case 8:
        return StaffRole.nurse;
      case 9:
        return StaffRole.security;
      case 10:
        return StaffRole.maintenance;
      case 11:
        return StaffRole.transport;
      case 12:
        return StaffRole.accountant;
      default:
        return StaffRole.teacher;
    }
  }

  @override
  void write(BinaryWriter writer, StaffRole obj) {
    switch (obj) {
      case StaffRole.teacher:
        writer.writeByte(0);
        break;
      case StaffRole.principal:
        writer.writeByte(1);
        break;
      case StaffRole.vice_principal:
        writer.writeByte(2);
        break;
      case StaffRole.head_teacher:
        writer.writeByte(3);
        break;
      case StaffRole.admin_staff:
        writer.writeByte(4);
        break;
      case StaffRole.librarian:
        writer.writeByte(5);
        break;
      case StaffRole.lab_assistant:
        writer.writeByte(6);
        break;
      case StaffRole.counselor:
        writer.writeByte(7);
        break;
      case StaffRole.nurse:
        writer.writeByte(8);
        break;
      case StaffRole.security:
        writer.writeByte(9);
        break;
      case StaffRole.maintenance:
        writer.writeByte(10);
        break;
      case StaffRole.transport:
        writer.writeByte(11);
        break;
      case StaffRole.accountant:
        writer.writeByte(12);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StaffRoleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EmploymentTypeAdapter extends TypeAdapter<EmploymentType> {
  @override
  final int typeId = 69;

  @override
  EmploymentType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EmploymentType.fullTime;
      case 1:
        return EmploymentType.partTime;
      case 2:
        return EmploymentType.contract;
      case 3:
        return EmploymentType.temporary;
      case 4:
        return EmploymentType.substitute;
      default:
        return EmploymentType.fullTime;
    }
  }

  @override
  void write(BinaryWriter writer, EmploymentType obj) {
    switch (obj) {
      case EmploymentType.fullTime:
        writer.writeByte(0);
        break;
      case EmploymentType.partTime:
        writer.writeByte(1);
        break;
      case EmploymentType.contract:
        writer.writeByte(2);
        break;
      case EmploymentType.temporary:
        writer.writeByte(3);
        break;
      case EmploymentType.substitute:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmploymentTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StaffStatusAdapter extends TypeAdapter<StaffStatus> {
  @override
  final int typeId = 70;

  @override
  StaffStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return StaffStatus.active;
      case 1:
        return StaffStatus.inactive;
      case 2:
        return StaffStatus.on_leave;
      case 3:
        return StaffStatus.suspended;
      case 4:
        return StaffStatus.terminated;
      case 5:
        return StaffStatus.resigned;
      default:
        return StaffStatus.active;
    }
  }

  @override
  void write(BinaryWriter writer, StaffStatus obj) {
    switch (obj) {
      case StaffStatus.active:
        writer.writeByte(0);
        break;
      case StaffStatus.inactive:
        writer.writeByte(1);
        break;
      case StaffStatus.on_leave:
        writer.writeByte(2);
        break;
      case StaffStatus.suspended:
        writer.writeByte(3);
        break;
      case StaffStatus.terminated:
        writer.writeByte(4);
        break;
      case StaffStatus.resigned:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StaffStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PayrollStatusAdapter extends TypeAdapter<PayrollStatus> {
  @override
  final int typeId = 71;

  @override
  PayrollStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PayrollStatus.draft;
      case 1:
        return PayrollStatus.calculated;
      case 2:
        return PayrollStatus.approved;
      case 3:
        return PayrollStatus.paid;
      case 4:
        return PayrollStatus.cancelled;
      default:
        return PayrollStatus.draft;
    }
  }

  @override
  void write(BinaryWriter writer, PayrollStatus obj) {
    switch (obj) {
      case PayrollStatus.draft:
        writer.writeByte(0);
        break;
      case PayrollStatus.calculated:
        writer.writeByte(1);
        break;
      case PayrollStatus.approved:
        writer.writeByte(2);
        break;
      case PayrollStatus.paid:
        writer.writeByte(3);
        break;
      case PayrollStatus.cancelled:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PayrollStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AttendanceStatusAdapter extends TypeAdapter<AttendanceStatus> {
  @override
  final int typeId = 72;

  @override
  AttendanceStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AttendanceStatus.present;
      case 1:
        return AttendanceStatus.absent;
      case 2:
        return AttendanceStatus.late;
      case 3:
        return AttendanceStatus.half_day;
      case 4:
        return AttendanceStatus.on_leave;
      case 5:
        return AttendanceStatus.holiday;
      case 6:
        return AttendanceStatus.weekend;
      default:
        return AttendanceStatus.present;
    }
  }

  @override
  void write(BinaryWriter writer, AttendanceStatus obj) {
    switch (obj) {
      case AttendanceStatus.present:
        writer.writeByte(0);
        break;
      case AttendanceStatus.absent:
        writer.writeByte(1);
        break;
      case AttendanceStatus.late:
        writer.writeByte(2);
        break;
      case AttendanceStatus.half_day:
        writer.writeByte(3);
        break;
      case AttendanceStatus.on_leave:
        writer.writeByte(4);
        break;
      case AttendanceStatus.holiday:
        writer.writeByte(5);
        break;
      case AttendanceStatus.weekend:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LeaveTypeAdapter extends TypeAdapter<LeaveType> {
  @override
  final int typeId = 73;

  @override
  LeaveType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LeaveType.casual;
      case 1:
        return LeaveType.sick;
      case 2:
        return LeaveType.earned;
      case 3:
        return LeaveType.maternity;
      case 4:
        return LeaveType.paternity;
      case 5:
        return LeaveType.emergency;
      case 6:
        return LeaveType.compensatory;
      default:
        return LeaveType.casual;
    }
  }

  @override
  void write(BinaryWriter writer, LeaveType obj) {
    switch (obj) {
      case LeaveType.casual:
        writer.writeByte(0);
        break;
      case LeaveType.sick:
        writer.writeByte(1);
        break;
      case LeaveType.earned:
        writer.writeByte(2);
        break;
      case LeaveType.maternity:
        writer.writeByte(3);
        break;
      case LeaveType.paternity:
        writer.writeByte(4);
        break;
      case LeaveType.emergency:
        writer.writeByte(5);
        break;
      case LeaveType.compensatory:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeaveTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LeaveStatusAdapter extends TypeAdapter<LeaveStatus> {
  @override
  final int typeId = 74;

  @override
  LeaveStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LeaveStatus.pending;
      case 1:
        return LeaveStatus.approved;
      case 2:
        return LeaveStatus.rejected;
      case 3:
        return LeaveStatus.cancelled;
      default:
        return LeaveStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, LeaveStatus obj) {
    switch (obj) {
      case LeaveStatus.pending:
        writer.writeByte(0);
        break;
      case LeaveStatus.approved:
        writer.writeByte(1);
        break;
      case LeaveStatus.rejected:
        writer.writeByte(2);
        break;
      case LeaveStatus.cancelled:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeaveStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
