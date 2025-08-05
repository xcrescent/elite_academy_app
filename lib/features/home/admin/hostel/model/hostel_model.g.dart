// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hostel_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HostelModelAdapter extends TypeAdapter<HostelModel> {
  @override
  final int typeId = 49;

  @override
  HostelModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HostelModel(
      id: fields[0] as String?,
      name: fields[1] as String,
      description: fields[2] as String,
      hostelType: fields[3] as HostelType,
      address: fields[4] as String,
      contactNumber: fields[5] as String,
      wardenName: fields[6] as String,
      wardenContact: fields[7] as String,
      totalRooms: fields[8] as int,
      totalBeds: fields[9] as int,
      occupiedBeds: fields[10] as int,
      monthlyFee: fields[11] as double,
      facilities: (fields[12] as List).cast<String>(),
      imageUrl: fields[13] as String?,
      status: fields[14] as HostelStatus,
      createdAt: fields[15] as DateTime,
      createdBy: fields[16] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HostelModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.hostelType)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.contactNumber)
      ..writeByte(6)
      ..write(obj.wardenName)
      ..writeByte(7)
      ..write(obj.wardenContact)
      ..writeByte(8)
      ..write(obj.totalRooms)
      ..writeByte(9)
      ..write(obj.totalBeds)
      ..writeByte(10)
      ..write(obj.occupiedBeds)
      ..writeByte(11)
      ..write(obj.monthlyFee)
      ..writeByte(12)
      ..write(obj.facilities)
      ..writeByte(13)
      ..write(obj.imageUrl)
      ..writeByte(14)
      ..write(obj.status)
      ..writeByte(15)
      ..write(obj.createdAt)
      ..writeByte(16)
      ..write(obj.createdBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HostelModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HostelRoomModelAdapter extends TypeAdapter<HostelRoomModel> {
  @override
  final int typeId = 50;

  @override
  HostelRoomModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HostelRoomModel(
      id: fields[0] as String?,
      hostelId: fields[1] as String,
      roomNumber: fields[2] as String,
      roomType: fields[3] as RoomType,
      floor: fields[4] as int,
      capacity: fields[5] as int,
      currentOccupancy: fields[6] as int,
      status: fields[7] as RoomStatus,
      facilities: (fields[8] as List).cast<String>(),
      monthlyRent: fields[9] as double,
      notes: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HostelRoomModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.hostelId)
      ..writeByte(2)
      ..write(obj.roomNumber)
      ..writeByte(3)
      ..write(obj.roomType)
      ..writeByte(4)
      ..write(obj.floor)
      ..writeByte(5)
      ..write(obj.capacity)
      ..writeByte(6)
      ..write(obj.currentOccupancy)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.facilities)
      ..writeByte(9)
      ..write(obj.monthlyRent)
      ..writeByte(10)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HostelRoomModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HostelAllocationModelAdapter extends TypeAdapter<HostelAllocationModel> {
  @override
  final int typeId = 51;

  @override
  HostelAllocationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HostelAllocationModel(
      id: fields[0] as String?,
      studentId: fields[1] as String,
      studentName: fields[2] as String,
      hostelId: fields[3] as String,
      hostelName: fields[4] as String,
      roomId: fields[5] as String,
      roomNumber: fields[6] as String,
      allocationDate: fields[7] as DateTime,
      checkOutDate: fields[8] as DateTime?,
      status: fields[9] as AllocationStatus,
      monthlyFee: fields[10] as double,
      securityDeposit: fields[11] as double,
      guardianName: fields[12] as String?,
      guardianContact: fields[13] as String?,
      emergencyContact: fields[14] as String?,
      medicalInfo: fields[15] as String?,
      specialRequirements: fields[16] as String?,
      createdAt: fields[17] as DateTime,
      createdBy: fields[18] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HostelAllocationModel obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.studentId)
      ..writeByte(2)
      ..write(obj.studentName)
      ..writeByte(3)
      ..write(obj.hostelId)
      ..writeByte(4)
      ..write(obj.hostelName)
      ..writeByte(5)
      ..write(obj.roomId)
      ..writeByte(6)
      ..write(obj.roomNumber)
      ..writeByte(7)
      ..write(obj.allocationDate)
      ..writeByte(8)
      ..write(obj.checkOutDate)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.monthlyFee)
      ..writeByte(11)
      ..write(obj.securityDeposit)
      ..writeByte(12)
      ..write(obj.guardianName)
      ..writeByte(13)
      ..write(obj.guardianContact)
      ..writeByte(14)
      ..write(obj.emergencyContact)
      ..writeByte(15)
      ..write(obj.medicalInfo)
      ..writeByte(16)
      ..write(obj.specialRequirements)
      ..writeByte(17)
      ..write(obj.createdAt)
      ..writeByte(18)
      ..write(obj.createdBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HostelAllocationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransportRouteModelAdapter extends TypeAdapter<TransportRouteModel> {
  @override
  final int typeId = 52;

  @override
  TransportRouteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransportRouteModel(
      id: fields[0] as String?,
      routeName: fields[1] as String,
      routeNumber: fields[2] as String,
      stops: (fields[3] as List).cast<TransportStopModel>(),
      driverId: fields[4] as String,
      driverName: fields[5] as String,
      driverContact: fields[6] as String,
      vehicleId: fields[7] as String,
      vehicleNumber: fields[8] as String,
      vehicleType: fields[9] as VehicleType,
      capacity: fields[10] as int,
      currentOccupancy: fields[11] as int,
      monthlyFee: fields[12] as double,
      startTime: fields[13] as String,
      endTime: fields[14] as String,
      status: fields[15] as RouteStatus,
      createdAt: fields[16] as DateTime,
      createdBy: fields[17] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransportRouteModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.routeName)
      ..writeByte(2)
      ..write(obj.routeNumber)
      ..writeByte(3)
      ..write(obj.stops)
      ..writeByte(4)
      ..write(obj.driverId)
      ..writeByte(5)
      ..write(obj.driverName)
      ..writeByte(6)
      ..write(obj.driverContact)
      ..writeByte(7)
      ..write(obj.vehicleId)
      ..writeByte(8)
      ..write(obj.vehicleNumber)
      ..writeByte(9)
      ..write(obj.vehicleType)
      ..writeByte(10)
      ..write(obj.capacity)
      ..writeByte(11)
      ..write(obj.currentOccupancy)
      ..writeByte(12)
      ..write(obj.monthlyFee)
      ..writeByte(13)
      ..write(obj.startTime)
      ..writeByte(14)
      ..write(obj.endTime)
      ..writeByte(15)
      ..write(obj.status)
      ..writeByte(16)
      ..write(obj.createdAt)
      ..writeByte(17)
      ..write(obj.createdBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransportRouteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransportStopModelAdapter extends TypeAdapter<TransportStopModel> {
  @override
  final int typeId = 53;

  @override
  TransportStopModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransportStopModel(
      id: fields[0] as String?,
      stopName: fields[1] as String,
      address: fields[2] as String,
      latitude: fields[3] as double?,
      longitude: fields[4] as double?,
      arrivalTime: fields[5] as String,
      stopOrder: fields[6] as int,
      distanceFromSchool: fields[7] as double,
    );
  }

  @override
  void write(BinaryWriter writer, TransportStopModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.stopName)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.latitude)
      ..writeByte(4)
      ..write(obj.longitude)
      ..writeByte(5)
      ..write(obj.arrivalTime)
      ..writeByte(6)
      ..write(obj.stopOrder)
      ..writeByte(7)
      ..write(obj.distanceFromSchool);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransportStopModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransportAllocationModelAdapter
    extends TypeAdapter<TransportAllocationModel> {
  @override
  final int typeId = 54;

  @override
  TransportAllocationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransportAllocationModel(
      id: fields[0] as String?,
      studentId: fields[1] as String,
      studentName: fields[2] as String,
      routeId: fields[3] as String,
      routeName: fields[4] as String,
      stopId: fields[5] as String,
      stopName: fields[6] as String,
      allocationDate: fields[7] as DateTime,
      endDate: fields[8] as DateTime?,
      status: fields[9] as TransportAllocationStatus,
      monthlyFee: fields[10] as double,
      guardianContact: fields[11] as String?,
      emergencyContact: fields[12] as String?,
      pickupAddress: fields[13] as String?,
      dropAddress: fields[14] as String?,
      createdAt: fields[15] as DateTime,
      createdBy: fields[16] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransportAllocationModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.studentId)
      ..writeByte(2)
      ..write(obj.studentName)
      ..writeByte(3)
      ..write(obj.routeId)
      ..writeByte(4)
      ..write(obj.routeName)
      ..writeByte(5)
      ..write(obj.stopId)
      ..writeByte(6)
      ..write(obj.stopName)
      ..writeByte(7)
      ..write(obj.allocationDate)
      ..writeByte(8)
      ..write(obj.endDate)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.monthlyFee)
      ..writeByte(11)
      ..write(obj.guardianContact)
      ..writeByte(12)
      ..write(obj.emergencyContact)
      ..writeByte(13)
      ..write(obj.pickupAddress)
      ..writeByte(14)
      ..write(obj.dropAddress)
      ..writeByte(15)
      ..write(obj.createdAt)
      ..writeByte(16)
      ..write(obj.createdBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransportAllocationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HostelTypeAdapter extends TypeAdapter<HostelType> {
  @override
  final int typeId = 55;

  @override
  HostelType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HostelType.boys;
      case 1:
        return HostelType.girls;
      case 2:
        return HostelType.mixed;
      case 3:
        return HostelType.staff;
      default:
        return HostelType.boys;
    }
  }

  @override
  void write(BinaryWriter writer, HostelType obj) {
    switch (obj) {
      case HostelType.boys:
        writer.writeByte(0);
        break;
      case HostelType.girls:
        writer.writeByte(1);
        break;
      case HostelType.mixed:
        writer.writeByte(2);
        break;
      case HostelType.staff:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HostelTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HostelStatusAdapter extends TypeAdapter<HostelStatus> {
  @override
  final int typeId = 56;

  @override
  HostelStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HostelStatus.active;
      case 1:
        return HostelStatus.inactive;
      case 2:
        return HostelStatus.maintenance;
      case 3:
        return HostelStatus.full;
      default:
        return HostelStatus.active;
    }
  }

  @override
  void write(BinaryWriter writer, HostelStatus obj) {
    switch (obj) {
      case HostelStatus.active:
        writer.writeByte(0);
        break;
      case HostelStatus.inactive:
        writer.writeByte(1);
        break;
      case HostelStatus.maintenance:
        writer.writeByte(2);
        break;
      case HostelStatus.full:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HostelStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RoomTypeAdapter extends TypeAdapter<RoomType> {
  @override
  final int typeId = 57;

  @override
  RoomType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RoomType.single;
      case 1:
        return RoomType.double;
      case 2:
        return RoomType.triple;
      case 3:
        return RoomType.dormitory;
      default:
        return RoomType.single;
    }
  }

  @override
  void write(BinaryWriter writer, RoomType obj) {
    switch (obj) {
      case RoomType.single:
        writer.writeByte(0);
        break;
      case RoomType.double:
        writer.writeByte(1);
        break;
      case RoomType.triple:
        writer.writeByte(2);
        break;
      case RoomType.dormitory:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RoomStatusAdapter extends TypeAdapter<RoomStatus> {
  @override
  final int typeId = 58;

  @override
  RoomStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RoomStatus.available;
      case 1:
        return RoomStatus.occupied;
      case 2:
        return RoomStatus.maintenance;
      case 3:
        return RoomStatus.reserved;
      default:
        return RoomStatus.available;
    }
  }

  @override
  void write(BinaryWriter writer, RoomStatus obj) {
    switch (obj) {
      case RoomStatus.available:
        writer.writeByte(0);
        break;
      case RoomStatus.occupied:
        writer.writeByte(1);
        break;
      case RoomStatus.maintenance:
        writer.writeByte(2);
        break;
      case RoomStatus.reserved:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AllocationStatusAdapter extends TypeAdapter<AllocationStatus> {
  @override
  final int typeId = 59;

  @override
  AllocationStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AllocationStatus.active;
      case 1:
        return AllocationStatus.inactive;
      case 2:
        return AllocationStatus.terminated;
      case 3:
        return AllocationStatus.suspended;
      default:
        return AllocationStatus.active;
    }
  }

  @override
  void write(BinaryWriter writer, AllocationStatus obj) {
    switch (obj) {
      case AllocationStatus.active:
        writer.writeByte(0);
        break;
      case AllocationStatus.inactive:
        writer.writeByte(1);
        break;
      case AllocationStatus.terminated:
        writer.writeByte(2);
        break;
      case AllocationStatus.suspended:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllocationStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VehicleTypeAdapter extends TypeAdapter<VehicleType> {
  @override
  final int typeId = 60;

  @override
  VehicleType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return VehicleType.bus;
      case 1:
        return VehicleType.van;
      case 2:
        return VehicleType.car;
      case 3:
        return VehicleType.auto;
      default:
        return VehicleType.bus;
    }
  }

  @override
  void write(BinaryWriter writer, VehicleType obj) {
    switch (obj) {
      case VehicleType.bus:
        writer.writeByte(0);
        break;
      case VehicleType.van:
        writer.writeByte(1);
        break;
      case VehicleType.car:
        writer.writeByte(2);
        break;
      case VehicleType.auto:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RouteStatusAdapter extends TypeAdapter<RouteStatus> {
  @override
  final int typeId = 61;

  @override
  RouteStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RouteStatus.active;
      case 1:
        return RouteStatus.inactive;
      case 2:
        return RouteStatus.suspended;
      case 3:
        return RouteStatus.maintenance;
      default:
        return RouteStatus.active;
    }
  }

  @override
  void write(BinaryWriter writer, RouteStatus obj) {
    switch (obj) {
      case RouteStatus.active:
        writer.writeByte(0);
        break;
      case RouteStatus.inactive:
        writer.writeByte(1);
        break;
      case RouteStatus.suspended:
        writer.writeByte(2);
        break;
      case RouteStatus.maintenance:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RouteStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransportAllocationStatusAdapter
    extends TypeAdapter<TransportAllocationStatus> {
  @override
  final int typeId = 62;

  @override
  TransportAllocationStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TransportAllocationStatus.active;
      case 1:
        return TransportAllocationStatus.inactive;
      case 2:
        return TransportAllocationStatus.terminated;
      case 3:
        return TransportAllocationStatus.suspended;
      default:
        return TransportAllocationStatus.active;
    }
  }

  @override
  void write(BinaryWriter writer, TransportAllocationStatus obj) {
    switch (obj) {
      case TransportAllocationStatus.active:
        writer.writeByte(0);
        break;
      case TransportAllocationStatus.inactive:
        writer.writeByte(1);
        break;
      case TransportAllocationStatus.terminated:
        writer.writeByte(2);
        break;
      case TransportAllocationStatus.suspended:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransportAllocationStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
