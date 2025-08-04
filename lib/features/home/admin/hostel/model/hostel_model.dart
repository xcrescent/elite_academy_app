import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'hostel_model.g.dart';

@HiveType(typeId: 49)
class HostelModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String name;
  
  @HiveField(2)
  String description;
  
  @HiveField(3)
  HostelType hostelType;
  
  @HiveField(4)
  String address;
  
  @HiveField(5)
  String contactNumber;
  
  @HiveField(6)
  String wardenName;
  
  @HiveField(7)
  String wardenContact;
  
  @HiveField(8)
  int totalRooms;
  
  @HiveField(9)
  int totalBeds;
  
  @HiveField(10)
  int occupiedBeds;
  
  @HiveField(11)
  double monthlyFee;
  
  @HiveField(12)
  List<String> facilities;
  
  @HiveField(13)
  String? imageUrl;
  
  @HiveField(14)
  HostelStatus status;
  
  @HiveField(15)
  DateTime createdAt;
  
  @HiveField(16)
  String createdBy;

  HostelModel({
    this.id,
    required this.name,
    required this.description,
    required this.hostelType,
    required this.address,
    required this.contactNumber,
    required this.wardenName,
    required this.wardenContact,
    required this.totalRooms,
    required this.totalBeds,
    this.occupiedBeds = 0,
    required this.monthlyFee,
    this.facilities = const [],
    this.imageUrl,
    this.status = HostelStatus.active,
    required this.createdAt,
    required this.createdBy,
  });

  int get availableBeds => totalBeds - occupiedBeds;
  double get occupancyRate => (occupiedBeds / totalBeds) * 100;
  bool get hasVacancy => availableBeds > 0;

  factory HostelModel.fromMap(Map<String, dynamic> map) {
    return HostelModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      hostelType: HostelType.values.firstWhere(
        (e) => e.toString().split('.').last == map['hostelType'],
        orElse: () => HostelType.boys,
      ),
      address: map['address'],
      contactNumber: map['contactNumber'],
      wardenName: map['wardenName'],
      wardenContact: map['wardenContact'],
      totalRooms: map['totalRooms'],
      totalBeds: map['totalBeds'],
      occupiedBeds: map['occupiedBeds'] ?? 0,
      monthlyFee: map['monthlyFee'].toDouble(),
      facilities: List<String>.from(map['facilities'] ?? []),
      imageUrl: map['imageUrl'],
      status: HostelStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => HostelStatus.active,
      ),
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'hostelType': hostelType.toString().split('.').last,
      'address': address,
      'contactNumber': contactNumber,
      'wardenName': wardenName,
      'wardenContact': wardenContact,
      'totalRooms': totalRooms,
      'totalBeds': totalBeds,
      'occupiedBeds': occupiedBeds,
      'monthlyFee': monthlyFee,
      'facilities': facilities,
      'imageUrl': imageUrl,
      'status': status.toString().split('.').last,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }
}

@HiveType(typeId: 50)
class HostelRoomModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String hostelId;
  
  @HiveField(2)
  String roomNumber;
  
  @HiveField(3)
  RoomType roomType;
  
  @HiveField(4)
  int floor;
  
  @HiveField(5)
  int capacity;
  
  @HiveField(6)
  int currentOccupancy;
  
  @HiveField(7)
  RoomStatus status;
  
  @HiveField(8)
  List<String> facilities;
  
  @HiveField(9)
  double monthlyRent;
  
  @HiveField(10)
  String? notes;

  HostelRoomModel({
    this.id,
    required this.hostelId,
    required this.roomNumber,
    required this.roomType,
    required this.floor,
    required this.capacity,
    this.currentOccupancy = 0,
    this.status = RoomStatus.available,
    this.facilities = const [],
    required this.monthlyRent,
    this.notes,
  });

  bool get isAvailable => status == RoomStatus.available && currentOccupancy < capacity;
  bool get isFull => currentOccupancy >= capacity;
  int get availableSlots => capacity - currentOccupancy;

  factory HostelRoomModel.fromMap(Map<String, dynamic> map) {
    return HostelRoomModel(
      id: map['id'],
      hostelId: map['hostelId'],
      roomNumber: map['roomNumber'],
      roomType: RoomType.values.firstWhere(
        (e) => e.toString().split('.').last == map['roomType'],
        orElse: () => RoomType.single,
      ),
      floor: map['floor'],
      capacity: map['capacity'],
      currentOccupancy: map['currentOccupancy'] ?? 0,
      status: RoomStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => RoomStatus.available,
      ),
      facilities: List<String>.from(map['facilities'] ?? []),
      monthlyRent: map['monthlyRent'].toDouble(),
      notes: map['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hostelId': hostelId,
      'roomNumber': roomNumber,
      'roomType': roomType.toString().split('.').last,
      'floor': floor,
      'capacity': capacity,
      'currentOccupancy': currentOccupancy,
      'status': status.toString().split('.').last,
      'facilities': facilities,
      'monthlyRent': monthlyRent,
      'notes': notes,
    };
  }
}

@HiveType(typeId: 51)
class HostelAllocationModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String studentId;
  
  @HiveField(2)
  String studentName;
  
  @HiveField(3)
  String hostelId;
  
  @HiveField(4)
  String hostelName;
  
  @HiveField(5)
  String roomId;
  
  @HiveField(6)
  String roomNumber;
  
  @HiveField(7)
  DateTime allocationDate;
  
  @HiveField(8)
  DateTime? checkOutDate;
  
  @HiveField(9)
  AllocationStatus status;
  
  @HiveField(10)
  double monthlyFee;
  
  @HiveField(11)
  double securityDeposit;
  
  @HiveField(12)
  String? guardianName;
  
  @HiveField(13)
  String? guardianContact;
  
  @HiveField(14)
  String? emergencyContact;
  
  @HiveField(15)
  String? medicalInfo;
  
  @HiveField(16)
  String? specialRequirements;
  
  @HiveField(17)
  DateTime createdAt;
  
  @HiveField(18)
  String createdBy;

  HostelAllocationModel({
    this.id,
    required this.studentId,
    required this.studentName,
    required this.hostelId,
    required this.hostelName,
    required this.roomId,
    required this.roomNumber,
    required this.allocationDate,
    this.checkOutDate,
    this.status = AllocationStatus.active,
    required this.monthlyFee,
    this.securityDeposit = 0.0,
    this.guardianName,
    this.guardianContact,
    this.emergencyContact,
    this.medicalInfo,
    this.specialRequirements,
    required this.createdAt,
    required this.createdBy,
  });

  int get stayDuration => 
      (checkOutDate ?? DateTime.now()).difference(allocationDate).inDays;

  bool get isActive => status == AllocationStatus.active;

  factory HostelAllocationModel.fromMap(Map<String, dynamic> map) {
    return HostelAllocationModel(
      id: map['id'],
      studentId: map['studentId'],
      studentName: map['studentName'],
      hostelId: map['hostelId'],
      hostelName: map['hostelName'],
      roomId: map['roomId'],
      roomNumber: map['roomNumber'],
      allocationDate: DateTime.parse(map['allocationDate']),
      checkOutDate: map['checkOutDate'] != null 
          ? DateTime.parse(map['checkOutDate']) 
          : null,
      status: AllocationStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => AllocationStatus.active,
      ),
      monthlyFee: map['monthlyFee'].toDouble(),
      securityDeposit: map['securityDeposit']?.toDouble() ?? 0.0,
      guardianName: map['guardianName'],
      guardianContact: map['guardianContact'],
      emergencyContact: map['emergencyContact'],
      medicalInfo: map['medicalInfo'],
      specialRequirements: map['specialRequirements'],
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentId': studentId,
      'studentName': studentName,
      'hostelId': hostelId,
      'hostelName': hostelName,
      'roomId': roomId,
      'roomNumber': roomNumber,
      'allocationDate': allocationDate.toIso8601String(),
      'checkOutDate': checkOutDate?.toIso8601String(),
      'status': status.toString().split('.').last,
      'monthlyFee': monthlyFee,
      'securityDeposit': securityDeposit,
      'guardianName': guardianName,
      'guardianContact': guardianContact,
      'emergencyContact': emergencyContact,
      'medicalInfo': medicalInfo,
      'specialRequirements': specialRequirements,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }
}

@HiveType(typeId: 52)
class TransportRouteModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String routeName;
  
  @HiveField(2)
  String routeNumber;
  
  @HiveField(3)
  List<TransportStopModel> stops;
  
  @HiveField(4)
  String driverId;
  
  @HiveField(5)
  String driverName;
  
  @HiveField(6)
  String driverContact;
  
  @HiveField(7)
  String vehicleId;
  
  @HiveField(8)
  String vehicleNumber;
  
  @HiveField(9)
  VehicleType vehicleType;
  
  @HiveField(10)
  int capacity;
  
  @HiveField(11)
  int currentOccupancy;
  
  @HiveField(12)
  double monthlyFee;
  
  @HiveField(13)
  String startTime;
  
  @HiveField(14)
  String endTime;
  
  @HiveField(15)
  RouteStatus status;
  
  @HiveField(16)
  DateTime createdAt;
  
  @HiveField(17)
  String createdBy;

  TransportRouteModel({
    this.id,
    required this.routeName,
    required this.routeNumber,
    this.stops = const [],
    required this.driverId,
    required this.driverName,
    required this.driverContact,
    required this.vehicleId,
    required this.vehicleNumber,
    required this.vehicleType,
    required this.capacity,
    this.currentOccupancy = 0,
    required this.monthlyFee,
    required this.startTime,
    required this.endTime,
    this.status = RouteStatus.active,
    required this.createdAt,
    required this.createdBy,
  });

  bool get hasVacancy => currentOccupancy < capacity;
  int get availableSeats => capacity - currentOccupancy;
  double get occupancyRate => (currentOccupancy / capacity) * 100;

  factory TransportRouteModel.fromMap(Map<String, dynamic> map) {
    return TransportRouteModel(
      id: map['id'],
      routeName: map['routeName'],
      routeNumber: map['routeNumber'],
      stops: (map['stops'] as List?)
          ?.map((stop) => TransportStopModel.fromMap(stop))
          .toList() ?? [],
      driverId: map['driverId'],
      driverName: map['driverName'],
      driverContact: map['driverContact'],
      vehicleId: map['vehicleId'],
      vehicleNumber: map['vehicleNumber'],
      vehicleType: VehicleType.values.firstWhere(
        (e) => e.toString().split('.').last == map['vehicleType'],
        orElse: () => VehicleType.bus,
      ),
      capacity: map['capacity'],
      currentOccupancy: map['currentOccupancy'] ?? 0,
      monthlyFee: map['monthlyFee'].toDouble(),
      startTime: map['startTime'],
      endTime: map['endTime'],
      status: RouteStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => RouteStatus.active,
      ),
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'routeName': routeName,
      'routeNumber': routeNumber,
      'stops': stops.map((stop) => stop.toMap()).toList(),
      'driverId': driverId,
      'driverName': driverName,
      'driverContact': driverContact,
      'vehicleId': vehicleId,
      'vehicleNumber': vehicleNumber,
      'vehicleType': vehicleType.toString().split('.').last,
      'capacity': capacity,
      'currentOccupancy': currentOccupancy,
      'monthlyFee': monthlyFee,
      'startTime': startTime,
      'endTime': endTime,
      'status': status.toString().split('.').last,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }
}

@HiveType(typeId: 53)
class TransportStopModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String stopName;
  
  @HiveField(2)
  String address;
  
  @HiveField(3)
  double? latitude;
  
  @HiveField(4)
  double? longitude;
  
  @HiveField(5)
  String arrivalTime;
  
  @HiveField(6)
  int stopOrder;
  
  @HiveField(7)
  double distanceFromSchool;

  TransportStopModel({
    this.id,
    required this.stopName,
    required this.address,
    this.latitude,
    this.longitude,
    required this.arrivalTime,
    required this.stopOrder,
    required this.distanceFromSchool,
  });

  factory TransportStopModel.fromMap(Map<String, dynamic> map) {
    return TransportStopModel(
      id: map['id'],
      stopName: map['stopName'],
      address: map['address'],
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
      arrivalTime: map['arrivalTime'],
      stopOrder: map['stopOrder'],
      distanceFromSchool: map['distanceFromSchool'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stopName': stopName,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'arrivalTime': arrivalTime,
      'stopOrder': stopOrder,
      'distanceFromSchool': distanceFromSchool,
    };
  }
}

@HiveType(typeId: 54)
class TransportAllocationModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String studentId;
  
  @HiveField(2)
  String studentName;
  
  @HiveField(3)
  String routeId;
  
  @HiveField(4)
  String routeName;
  
  @HiveField(5)
  String stopId;
  
  @HiveField(6)
  String stopName;
  
  @HiveField(7)
  DateTime allocationDate;
  
  @HiveField(8)
  DateTime? endDate;
  
  @HiveField(9)
  TransportAllocationStatus status;
  
  @HiveField(10)
  double monthlyFee;
  
  @HiveField(11)
  String? guardianContact;
  
  @HiveField(12)
  String? emergencyContact;
  
  @HiveField(13)
  String? pickupAddress;
  
  @HiveField(14)
  String? dropAddress;
  
  @HiveField(15)
  DateTime createdAt;
  
  @HiveField(16)
  String createdBy;

  TransportAllocationModel({
    this.id,
    required this.studentId,
    required this.studentName,
    required this.routeId,
    required this.routeName,
    required this.stopId,
    required this.stopName,
    required this.allocationDate,
    this.endDate,
    this.status = TransportAllocationStatus.active,
    required this.monthlyFee,
    this.guardianContact,
    this.emergencyContact,
    this.pickupAddress,
    this.dropAddress,
    required this.createdAt,
    required this.createdBy,
  });

  bool get isActive => status == TransportAllocationStatus.active;
  int get usageDuration => 
      (endDate ?? DateTime.now()).difference(allocationDate).inDays;

  factory TransportAllocationModel.fromMap(Map<String, dynamic> map) {
    return TransportAllocationModel(
      id: map['id'],
      studentId: map['studentId'],
      studentName: map['studentName'],
      routeId: map['routeId'],
      routeName: map['routeName'],
      stopId: map['stopId'],
      stopName: map['stopName'],
      allocationDate: DateTime.parse(map['allocationDate']),
      endDate: map['endDate'] != null ? DateTime.parse(map['endDate']) : null,
      status: TransportAllocationStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => TransportAllocationStatus.active,
      ),
      monthlyFee: map['monthlyFee'].toDouble(),
      guardianContact: map['guardianContact'],
      emergencyContact: map['emergencyContact'],
      pickupAddress: map['pickupAddress'],
      dropAddress: map['dropAddress'],
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentId': studentId,
      'studentName': studentName,
      'routeId': routeId,
      'routeName': routeName,
      'stopId': stopId,
      'stopName': stopName,
      'allocationDate': allocationDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'status': status.toString().split('.').last,
      'monthlyFee': monthlyFee,
      'guardianContact': guardianContact,
      'emergencyContact': emergencyContact,
      'pickupAddress': pickupAddress,
      'dropAddress': dropAddress,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }
}

// Enums
@HiveType(typeId: 55)
enum HostelType {
  @HiveField(0)
  boys,
  
  @HiveField(1)
  girls,
  
  @HiveField(2)
  mixed,
  
  @HiveField(3)
  staff,
}

@HiveType(typeId: 56)
enum HostelStatus {
  @HiveField(0)
  active,
  
  @HiveField(1)
  inactive,
  
  @HiveField(2)
  maintenance,
  
  @HiveField(3)
  full,
}

@HiveType(typeId: 57)
enum RoomType {
  @HiveField(0)
  single,
  
  @HiveField(1)
  double,
  
  @HiveField(2)
  triple,
  
  @HiveField(3)
  dormitory,
}

@HiveType(typeId: 58)
enum RoomStatus {
  @HiveField(0)
  available,
  
  @HiveField(1)
  occupied,
  
  @HiveField(2)
  maintenance,
  
  @HiveField(3)
  reserved,
}

@HiveType(typeId: 59)
enum AllocationStatus {
  @HiveField(0)
  active,
  
  @HiveField(1)
  inactive,
  
  @HiveField(2)
  terminated,
  
  @HiveField(3)
  suspended,
}

@HiveType(typeId: 60)
enum VehicleType {
  @HiveField(0)
  bus,
  
  @HiveField(1)
  van,
  
  @HiveField(2)
  car,
  
  @HiveField(3)
  auto,
}

@HiveType(typeId: 61)
enum RouteStatus {
  @HiveField(0)
  active,
  
  @HiveField(1)
  inactive,
  
  @HiveField(2)
  suspended,
  
  @HiveField(3)
  maintenance,
}

@HiveType(typeId: 62)
enum TransportAllocationStatus {
  @HiveField(0)
  active,
  
  @HiveField(1)
  inactive,
  
  @HiveField(2)
  terminated,
  
  @HiveField(3)
  suspended,
}

// Extensions
extension HostelTypeExtension on HostelType {
  String get displayName {
    switch (this) {
      case HostelType.boys:
        return 'Boys Hostel';
      case HostelType.girls:
        return 'Girls Hostel';
      case HostelType.mixed:
        return 'Mixed Hostel';
      case HostelType.staff:
        return 'Staff Quarters';
    }
  }

  String get icon {
    switch (this) {
      case HostelType.boys:
        return '👦';
      case HostelType.girls:
        return '👧';
      case HostelType.mixed:
        return '🏠';
      case HostelType.staff:
        return '👨‍💼';
    }
  }

  Color get color {
    switch (this) {
      case HostelType.boys:
        return const Color(0xFF2196F3);
      case HostelType.girls:
        return const Color(0xFFE91E63);
      case HostelType.mixed:
        return const Color(0xFF9C27B0);
      case HostelType.staff:
        return const Color(0xFF4CAF50);
    }
  }
}

extension RoomTypeExtension on RoomType {
  String get displayName {
    switch (this) {
      case RoomType.single:
        return 'Single Room';
      case RoomType.double:
        return 'Double Room';
      case RoomType.triple:
        return 'Triple Room';
      case RoomType.dormitory:
        return 'Dormitory';
    }
  }

  int get defaultCapacity {
    switch (this) {
      case RoomType.single:
        return 1;
      case RoomType.double:
        return 2;
      case RoomType.triple:
        return 3;
      case RoomType.dormitory:
        return 8;
    }
  }
}

extension VehicleTypeExtension on VehicleType {
  String get displayName {
    switch (this) {
      case VehicleType.bus:
        return 'Bus';
      case VehicleType.van:
        return 'Van';
      case VehicleType.car:
        return 'Car';
      case VehicleType.auto:
        return 'Auto Rickshaw';
    }
  }

  String get icon {
    switch (this) {
      case VehicleType.bus:
        return '🚌';
      case VehicleType.van:
        return '🚐';
      case VehicleType.car:
        return '🚗';
      case VehicleType.auto:
        return '🛺';
    }
  }

  int get defaultCapacity {
    switch (this) {
      case VehicleType.bus:
        return 50;
      case VehicleType.van:
        return 12;
      case VehicleType.car:
        return 4;
      case VehicleType.auto:
        return 3;
    }
  }
}