import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'inventory_model.g.dart';

@HiveType(typeId: 75)
class AssetModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String assetId;
  
  @HiveField(2)
  String name;
  
  @HiveField(3)
  String description;
  
  @HiveField(4)
  AssetCategory category;
  
  @HiveField(5)
  String brand;
  
  @HiveField(6)
  String model;
  
  @HiveField(7)
  String serialNumber;
  
  @HiveField(8)
  double purchasePrice;
  
  @HiveField(9)
  DateTime purchaseDate;
  
  @HiveField(10)
  String supplier;
  
  @HiveField(11)
  AssetCondition condition;
  
  @HiveField(12)
  AssetStatus status;
  
  @HiveField(13)
  String location;
  
  @HiveField(14)
  String department;
  
  @HiveField(15)
  String? assignedTo;
  
  @HiveField(16)
  String? assignedToName;
  
  @HiveField(17)
  DateTime? assignedDate;
  
  @HiveField(18)
  DateTime? warrantyExpiry;
  
  @HiveField(19)
  DateTime? lastMaintenanceDate;
  
  @HiveField(20)
  DateTime? nextMaintenanceDate;
  
  @HiveField(21)
  double currentValue;
  
  @HiveField(22)
  double depreciationRate;
  
  @HiveField(23)
  List<String> attachments;
  
  @HiveField(24)
  String? notes;
  
  @HiveField(25)
  DateTime createdAt;
  
  @HiveField(26)
  String createdBy;

  AssetModel({
    this.id,
    required this.assetId,
    required this.name,
    required this.description,
    required this.category,
    required this.brand,
    required this.model,
    required this.serialNumber,
    required this.purchasePrice,
    required this.purchaseDate,
    required this.supplier,
    this.condition = AssetCondition.excellent,
    this.status = AssetStatus.available,
    required this.location,
    required this.department,
    this.assignedTo,
    this.assignedToName,
    this.assignedDate,
    this.warrantyExpiry,
    this.lastMaintenanceDate,
    this.nextMaintenanceDate,
    required this.currentValue,
    this.depreciationRate = 10.0,
    this.attachments = const [],
    this.notes,
    required this.createdAt,
    required this.createdBy,
  });

  bool get isAssigned => assignedTo != null;
  bool get isWarrantyValid => warrantyExpiry != null && DateTime.now().isBefore(warrantyExpiry!);
  bool get needsMaintenance => nextMaintenanceDate != null && DateTime.now().isAfter(nextMaintenanceDate!);
  int get ageInYears => DateTime.now().difference(purchaseDate).inDays ~/ 365;
  double get depreciatedValue => currentValue * (1 - (depreciationRate / 100) * ageInYears);

  factory AssetModel.fromMap(Map<String, dynamic> map) {
    return AssetModel(
      id: map['id'],
      assetId: map['assetId'],
      name: map['name'],
      description: map['description'],
      category: AssetCategory.values.firstWhere(
        (e) => e.toString().split('.').last == map['category'],
        orElse: () => AssetCategory.equipment,
      ),
      brand: map['brand'],
      model: map['model'],
      serialNumber: map['serialNumber'],
      purchasePrice: map['purchasePrice'].toDouble(),
      purchaseDate: DateTime.parse(map['purchaseDate']),
      supplier: map['supplier'],
      condition: AssetCondition.values.firstWhere(
        (e) => e.toString().split('.').last == map['condition'],
        orElse: () => AssetCondition.excellent,
      ),
      status: AssetStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => AssetStatus.available,
      ),
      location: map['location'],
      department: map['department'],
      assignedTo: map['assignedTo'],
      assignedToName: map['assignedToName'],
      assignedDate: map['assignedDate'] != null ? DateTime.parse(map['assignedDate']) : null,
      warrantyExpiry: map['warrantyExpiry'] != null ? DateTime.parse(map['warrantyExpiry']) : null,
      lastMaintenanceDate: map['lastMaintenanceDate'] != null ? DateTime.parse(map['lastMaintenanceDate']) : null,
      nextMaintenanceDate: map['nextMaintenanceDate'] != null ? DateTime.parse(map['nextMaintenanceDate']) : null,
      currentValue: map['currentValue'].toDouble(),
      depreciationRate: map['depreciationRate']?.toDouble() ?? 10.0,
      attachments: List<String>.from(map['attachments'] ?? []),
      notes: map['notes'],
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'assetId': assetId,
      'name': name,
      'description': description,
      'category': category.toString().split('.').last,
      'brand': brand,
      'model': model,
      'serialNumber': serialNumber,
      'purchasePrice': purchasePrice,
      'purchaseDate': purchaseDate.toIso8601String(),
      'supplier': supplier,
      'condition': condition.toString().split('.').last,
      'status': status.toString().split('.').last,
      'location': location,
      'department': department,
      'assignedTo': assignedTo,
      'assignedToName': assignedToName,
      'assignedDate': assignedDate?.toIso8601String(),
      'warrantyExpiry': warrantyExpiry?.toIso8601String(),
      'lastMaintenanceDate': lastMaintenanceDate?.toIso8601String(),
      'nextMaintenanceDate': nextMaintenanceDate?.toIso8601String(),
      'currentValue': currentValue,
      'depreciationRate': depreciationRate,
      'attachments': attachments,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }
}

@HiveType(typeId: 76)
class InventoryItemModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String itemCode;
  
  @HiveField(2)
  String name;
  
  @HiveField(3)
  String description;
  
  @HiveField(4)
  InventoryCategory category;
  
  @HiveField(5)
  String unit;
  
  @HiveField(6)
  int currentStock;
  
  @HiveField(7)
  int minStockLevel;
  
  @HiveField(8)
  int maxStockLevel;
  
  @HiveField(9)
  double unitPrice;
  
  @HiveField(10)
  String supplier;
  
  @HiveField(11)
  String location;
  
  @HiveField(12)
  DateTime? expiryDate;
  
  @HiveField(13)
  String? batchNumber;
  
  @HiveField(14)
  InventoryStatus status;
  
  @HiveField(15)
  DateTime createdAt;
  
  @HiveField(16)
  String createdBy;
  
  @HiveField(17)
  DateTime? lastUpdated;

  InventoryItemModel({
    this.id,
    required this.itemCode,
    required this.name,
    required this.description,
    required this.category,
    required this.unit,
    required this.currentStock,
    required this.minStockLevel,
    required this.maxStockLevel,
    required this.unitPrice,
    required this.supplier,
    required this.location,
    this.expiryDate,
    this.batchNumber,
    this.status = InventoryStatus.inStock,
    required this.createdAt,
    required this.createdBy,
    this.lastUpdated,
  });

  bool get isLowStock => currentStock <= minStockLevel;
  bool get isOutOfStock => currentStock <= 0;
  bool get isExpired => expiryDate != null && DateTime.now().isAfter(expiryDate!);
  bool get isExpiringSoon => expiryDate != null && 
      DateTime.now().add(const Duration(days: 30)).isAfter(expiryDate!);
  double get totalValue => currentStock * unitPrice;

  factory InventoryItemModel.fromMap(Map<String, dynamic> map) {
    return InventoryItemModel(
      id: map['id'],
      itemCode: map['itemCode'],
      name: map['name'],
      description: map['description'],
      category: InventoryCategory.values.firstWhere(
        (e) => e.toString().split('.').last == map['category'],
        orElse: () => InventoryCategory.supplies,
      ),
      unit: map['unit'],
      currentStock: map['currentStock'],
      minStockLevel: map['minStockLevel'],
      maxStockLevel: map['maxStockLevel'],
      unitPrice: map['unitPrice'].toDouble(),
      supplier: map['supplier'],
      location: map['location'],
      expiryDate: map['expiryDate'] != null ? DateTime.parse(map['expiryDate']) : null,
      batchNumber: map['batchNumber'],
      status: InventoryStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => InventoryStatus.inStock,
      ),
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'],
      lastUpdated: map['lastUpdated'] != null ? DateTime.parse(map['lastUpdated']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemCode': itemCode,
      'name': name,
      'description': description,
      'category': category.toString().split('.').last,
      'unit': unit,
      'currentStock': currentStock,
      'minStockLevel': minStockLevel,
      'maxStockLevel': maxStockLevel,
      'unitPrice': unitPrice,
      'supplier': supplier,
      'location': location,
      'expiryDate': expiryDate?.toIso8601String(),
      'batchNumber': batchNumber,
      'status': status.toString().split('.').last,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
      'lastUpdated': lastUpdated?.toIso8601String(),
    };
  }
}

@HiveType(typeId: 77)
class MaintenanceRecordModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String assetId;
  
  @HiveField(2)
  String assetName;
  
  @HiveField(3)
  MaintenanceType type;
  
  @HiveField(4)
  DateTime scheduledDate;
  
  @HiveField(5)
  DateTime? completedDate;
  
  @HiveField(6)
  MaintenanceStatus status;
  
  @HiveField(7)
  String description;
  
  @HiveField(8)
  String? workPerformed;
  
  @HiveField(9)
  String? partsReplaced;
  
  @HiveField(10)
  double cost;
  
  @HiveField(11)
  String? technician;
  
  @HiveField(12)
  String? vendorCompany;
  
  @HiveField(13)
  MaintenancePriority priority;
  
  @HiveField(14)
  String? notes;
  
  @HiveField(15)
  List<String> beforeImages;
  
  @HiveField(16)
  List<String> afterImages;
  
  @HiveField(17)
  DateTime? nextMaintenanceDate;
  
  @HiveField(18)
  DateTime createdAt;
  
  @HiveField(19)
  String createdBy;

  MaintenanceRecordModel({
    this.id,
    required this.assetId,
    required this.assetName,
    required this.type,
    required this.scheduledDate,
    this.completedDate,
    this.status = MaintenanceStatus.scheduled,
    required this.description,
    this.workPerformed,
    this.partsReplaced,
    this.cost = 0.0,
    this.technician,
    this.vendorCompany,
    this.priority = MaintenancePriority.medium,
    this.notes,
    this.beforeImages = const [],
    this.afterImages = const [],
    this.nextMaintenanceDate,
    required this.createdAt,
    required this.createdBy,
  });

  bool get isCompleted => status == MaintenanceStatus.completed;
  bool get isOverdue => status != MaintenanceStatus.completed && 
      DateTime.now().isAfter(scheduledDate);
  int get daysOverdue => isOverdue ? DateTime.now().difference(scheduledDate).inDays : 0;

  factory MaintenanceRecordModel.fromMap(Map<String, dynamic> map) {
    return MaintenanceRecordModel(
      id: map['id'],
      assetId: map['assetId'],
      assetName: map['assetName'],
      type: MaintenanceType.values.firstWhere(
        (e) => e.toString().split('.').last == map['type'],
        orElse: () => MaintenanceType.preventive,
      ),
      scheduledDate: DateTime.parse(map['scheduledDate']),
      completedDate: map['completedDate'] != null ? DateTime.parse(map['completedDate']) : null,
      status: MaintenanceStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => MaintenanceStatus.scheduled,
      ),
      description: map['description'],
      workPerformed: map['workPerformed'],
      partsReplaced: map['partsReplaced'],
      cost: map['cost']?.toDouble() ?? 0.0,
      technician: map['technician'],
      vendorCompany: map['vendorCompany'],
      priority: MaintenancePriority.values.firstWhere(
        (e) => e.toString().split('.').last == map['priority'],
        orElse: () => MaintenancePriority.medium,
      ),
      notes: map['notes'],
      beforeImages: List<String>.from(map['beforeImages'] ?? []),
      afterImages: List<String>.from(map['afterImages'] ?? []),
      nextMaintenanceDate: map['nextMaintenanceDate'] != null ? DateTime.parse(map['nextMaintenanceDate']) : null,
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'assetId': assetId,
      'assetName': assetName,
      'type': type.toString().split('.').last,
      'scheduledDate': scheduledDate.toIso8601String(),
      'completedDate': completedDate?.toIso8601String(),
      'status': status.toString().split('.').last,
      'description': description,
      'workPerformed': workPerformed,
      'partsReplaced': partsReplaced,
      'cost': cost,
      'technician': technician,
      'vendorCompany': vendorCompany,
      'priority': priority.toString().split('.').last,
      'notes': notes,
      'beforeImages': beforeImages,
      'afterImages': afterImages,
      'nextMaintenanceDate': nextMaintenanceDate?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }
}

@HiveType(typeId: 78)
class StockMovementModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String itemId;
  
  @HiveField(2)
  String itemName;
  
  @HiveField(3)
  MovementType type;
  
  @HiveField(4)
  int quantity;
  
  @HiveField(5)
  String reason;
  
  @HiveField(6)
  String? reference;
  
  @HiveField(7)
  String? issuedTo;
  
  @HiveField(8)
  String? issuedToName;
  
  @HiveField(9)
  String? receivedFrom;
  
  @HiveField(10)
  double unitPrice;
  
  @HiveField(11)
  DateTime transactionDate;
  
  @HiveField(12)
  String performedBy;
  
  @HiveField(13)
  String? notes;

  StockMovementModel({
    this.id,
    required this.itemId,
    required this.itemName,
    required this.type,
    required this.quantity,
    required this.reason,
    this.reference,
    this.issuedTo,
    this.issuedToName,
    this.receivedFrom,
    required this.unitPrice,
    required this.transactionDate,
    required this.performedBy,
    this.notes,
  });

  double get totalValue => quantity * unitPrice;
  bool get isInward => type == MovementType.inward;
  bool get isOutward => type == MovementType.outward;

  factory StockMovementModel.fromMap(Map<String, dynamic> map) {
    return StockMovementModel(
      id: map['id'],
      itemId: map['itemId'],
      itemName: map['itemName'],
      type: MovementType.values.firstWhere(
        (e) => e.toString().split('.').last == map['type'],
        orElse: () => MovementType.inward,
      ),
      quantity: map['quantity'],
      reason: map['reason'],
      reference: map['reference'],
      issuedTo: map['issuedTo'],
      issuedToName: map['issuedToName'],
      receivedFrom: map['receivedFrom'],
      unitPrice: map['unitPrice'].toDouble(),
      transactionDate: DateTime.parse(map['transactionDate']),
      performedBy: map['performedBy'],
      notes: map['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemId': itemId,
      'itemName': itemName,
      'type': type.toString().split('.').last,
      'quantity': quantity,
      'reason': reason,
      'reference': reference,
      'issuedTo': issuedTo,
      'issuedToName': issuedToName,
      'receivedFrom': receivedFrom,
      'unitPrice': unitPrice,
      'transactionDate': transactionDate.toIso8601String(),
      'performedBy': performedBy,
      'notes': notes,
    };
  }
}

@HiveType(typeId: 79)
class PurchaseRequestModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String requestNumber;
  
  @HiveField(2)
  String requestedBy;
  
  @HiveField(3)
  String requestedByName;
  
  @HiveField(4)
  String department;
  
  @HiveField(5)
  DateTime requestDate;
  
  @HiveField(6)
  DateTime requiredDate;
  
  @HiveField(7)
  PurchaseRequestStatus status;
  
  @HiveField(8)
  String justification;
  
  @HiveField(9)
  List<PurchaseItemModel> items;
  
  @HiveField(10)
  double totalAmount;
  
  @HiveField(11)
  String? approvedBy;
  
  @HiveField(12)
  DateTime? approvedDate;
  
  @HiveField(13)
  String? rejectionReason;
  
  @HiveField(14)
  PurchasePriority priority;
  
  @HiveField(15)
  String? notes;

  PurchaseRequestModel({
    this.id,
    required this.requestNumber,
    required this.requestedBy,
    required this.requestedByName,
    required this.department,
    required this.requestDate,
    required this.requiredDate,
    this.status = PurchaseRequestStatus.pending,
    required this.justification,
    this.items = const [],
    this.totalAmount = 0.0,
    this.approvedBy,
    this.approvedDate,
    this.rejectionReason,
    this.priority = PurchasePriority.medium,
    this.notes,
  });

  bool get isPending => status == PurchaseRequestStatus.pending;
  bool get isApproved => status == PurchaseRequestStatus.approved;
  bool get isRejected => status == PurchaseRequestStatus.rejected;
  bool get isUrgent => priority == PurchasePriority.high;
  int get itemCount => items.length;

  factory PurchaseRequestModel.fromMap(Map<String, dynamic> map) {
    return PurchaseRequestModel(
      id: map['id'],
      requestNumber: map['requestNumber'],
      requestedBy: map['requestedBy'],
      requestedByName: map['requestedByName'],
      department: map['department'],
      requestDate: DateTime.parse(map['requestDate']),
      requiredDate: DateTime.parse(map['requiredDate']),
      status: PurchaseRequestStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => PurchaseRequestStatus.pending,
      ),
      justification: map['justification'],
      items: (map['items'] as List?)
          ?.map((item) => PurchaseItemModel.fromMap(item))
          .toList() ?? [],
      totalAmount: map['totalAmount']?.toDouble() ?? 0.0,
      approvedBy: map['approvedBy'],
      approvedDate: map['approvedDate'] != null ? DateTime.parse(map['approvedDate']) : null,
      rejectionReason: map['rejectionReason'],
      priority: PurchasePriority.values.firstWhere(
        (e) => e.toString().split('.').last == map['priority'],
        orElse: () => PurchasePriority.medium,
      ),
      notes: map['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'requestNumber': requestNumber,
      'requestedBy': requestedBy,
      'requestedByName': requestedByName,
      'department': department,
      'requestDate': requestDate.toIso8601String(),
      'requiredDate': requiredDate.toIso8601String(),
      'status': status.toString().split('.').last,
      'justification': justification,
      'items': items.map((item) => item.toMap()).toList(),
      'totalAmount': totalAmount,
      'approvedBy': approvedBy,
      'approvedDate': approvedDate?.toIso8601String(),
      'rejectionReason': rejectionReason,
      'priority': priority.toString().split('.').last,
      'notes': notes,
    };
  }
}

@HiveType(typeId: 80)
class PurchaseItemModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String itemName;
  
  @HiveField(2)
  String description;
  
  @HiveField(3)
  int quantity;
  
  @HiveField(4)
  String unit;
  
  @HiveField(5)
  double estimatedPrice;
  
  @HiveField(6)
  String? preferredSupplier;
  
  @HiveField(7)
  String? specifications;

  PurchaseItemModel({
    this.id,
    required this.itemName,
    required this.description,
    required this.quantity,
    required this.unit,
    required this.estimatedPrice,
    this.preferredSupplier,
    this.specifications,
  });

  double get totalEstimatedCost => quantity * estimatedPrice;

  factory PurchaseItemModel.fromMap(Map<String, dynamic> map) {
    return PurchaseItemModel(
      id: map['id'],
      itemName: map['itemName'],
      description: map['description'],
      quantity: map['quantity'],
      unit: map['unit'],
      estimatedPrice: map['estimatedPrice'].toDouble(),
      preferredSupplier: map['preferredSupplier'],
      specifications: map['specifications'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemName': itemName,
      'description': description,
      'quantity': quantity,
      'unit': unit,
      'estimatedPrice': estimatedPrice,
      'preferredSupplier': preferredSupplier,
      'specifications': specifications,
    };
  }
}

// Enums
@HiveType(typeId: 81)
enum AssetCategory {
  @HiveField(0)
  equipment,
  
  @HiveField(1)
  furniture,
  
  @HiveField(2)
  electronics,
  
  @HiveField(3)
  vehicles,
  
  @HiveField(4)
  buildings,
  
  @HiveField(5)
  computer,
  
  @HiveField(6)
  laboratory,
  
  @HiveField(7)
  sports,
  
  @HiveField(8)
  library,
}

@HiveType(typeId: 82)
enum AssetCondition {
  @HiveField(0)
  excellent,
  
  @HiveField(1)
  good,
  
  @HiveField(2)
  fair,
  
  @HiveField(3)
  poor,
  
  @HiveField(4)
  damaged,
}

@HiveType(typeId: 83)
enum AssetStatus {
  @HiveField(0)
  available,
  
  @HiveField(1)
  in_use,
  
  @HiveField(2)
  maintenance,
  
  @HiveField(3)
  repair,
  
  @HiveField(4)
  retired,
  
  @HiveField(5)
  disposed,
}

@HiveType(typeId: 84)
enum InventoryCategory {
  @HiveField(0)
  supplies,
  
  @HiveField(1)
  consumables,
  
  @HiveField(2)
  chemicals,
  
  @HiveField(3)
  stationery,
  
  @HiveField(4)
  cleaning,
  
  @HiveField(5)
  food,
  
  @HiveField(6)
  medical,
  
  @HiveField(7)
  maintenance,
}

@HiveType(typeId: 85)
enum InventoryStatus {
  @HiveField(0)
  inStock,
  
  @HiveField(1)
  lowStock,
  
  @HiveField(2)
  outOfStock,
  
  @HiveField(3)
  expired,
  
  @HiveField(4)
  damaged,
}

@HiveType(typeId: 86)
enum MaintenanceType {
  @HiveField(0)
  preventive,
  
  @HiveField(1)
  corrective,
  
  @HiveField(2)
  emergency,
  
  @HiveField(3)
  inspection,
  
  @HiveField(4)
  calibration,
}

@HiveType(typeId: 87)
enum MaintenanceStatus {
  @HiveField(0)
  scheduled,
  
  @HiveField(1)
  in_progress,
  
  @HiveField(2)
  completed,
  
  @HiveField(3)
  cancelled,
  
  @HiveField(4)
  overdue,
}

@HiveType(typeId: 88)
enum MaintenancePriority {
  @HiveField(0)
  low,
  
  @HiveField(1)
  medium,
  
  @HiveField(2)
  high,
  
  @HiveField(3)
  critical,
}

@HiveType(typeId: 89)
enum MovementType {
  @HiveField(0)
  inward,
  
  @HiveField(1)
  outward,
  
  @HiveField(2)
  transfer,
  
  @HiveField(3)
  adjustment,
}

@HiveType(typeId: 90)
enum PurchaseRequestStatus {
  @HiveField(0)
  pending,
  
  @HiveField(1)
  approved,
  
  @HiveField(2)
  rejected,
  
  @HiveField(3)
  ordered,
  
  @HiveField(4)
  received,
}

@HiveType(typeId: 91)
enum PurchasePriority {
  @HiveField(0)
  low,
  
  @HiveField(1)
  medium,
  
  @HiveField(2)
  high,
  
  @HiveField(3)
  urgent,
}

// Extensions
extension AssetCategoryExtension on AssetCategory {
  String get displayName {
    switch (this) {
      case AssetCategory.equipment:
        return 'Equipment';
      case AssetCategory.furniture:
        return 'Furniture';
      case AssetCategory.electronics:
        return 'Electronics';
      case AssetCategory.vehicles:
        return 'Vehicles';
      case AssetCategory.buildings:
        return 'Buildings';
      case AssetCategory.computer:
        return 'Computer';
      case AssetCategory.laboratory:
        return 'Laboratory';
      case AssetCategory.sports:
        return 'Sports';
      case AssetCategory.library:
        return 'Library';
    }
  }

  String get icon {
    switch (this) {
      case AssetCategory.equipment:
        return '⚙️';
      case AssetCategory.furniture:
        return '🪑';
      case AssetCategory.electronics:
        return '📱';
      case AssetCategory.vehicles:
        return '🚗';
      case AssetCategory.buildings:
        return '🏢';
      case AssetCategory.computer:
        return '💻';
      case AssetCategory.laboratory:
        return '🧪';
      case AssetCategory.sports:
        return '⚽';
      case AssetCategory.library:
        return '📚';
    }
  }

  Color get color {
    switch (this) {
      case AssetCategory.equipment:
        return const Color(0xFF2196F3);
      case AssetCategory.furniture:
        return const Color(0xFF795548);
      case AssetCategory.electronics:
        return const Color(0xFF9C27B0);
      case AssetCategory.vehicles:
        return const Color(0xFFFF9800);
      case AssetCategory.buildings:
        return const Color(0xFF607D8B);
      case AssetCategory.computer:
        return const Color(0xFF4CAF50);
      case AssetCategory.laboratory:
        return const Color(0xFFE91E63);
      case AssetCategory.sports:
        return const Color(0xFFFF5722);
      case AssetCategory.library:
        return const Color(0xFF3F51B5);
    }
  }
}

extension AssetConditionExtension on AssetCondition {
  String get displayName {
    switch (this) {
      case AssetCondition.excellent:
        return 'Excellent';
      case AssetCondition.good:
        return 'Good';
      case AssetCondition.fair:
        return 'Fair';
      case AssetCondition.poor:
        return 'Poor';
      case AssetCondition.damaged:
        return 'Damaged';
    }
  }

  Color get color {
    switch (this) {
      case AssetCondition.excellent:
        return Colors.green;
      case AssetCondition.good:
        return Colors.lightGreen;
      case AssetCondition.fair:
        return Colors.orange;
      case AssetCondition.poor:
        return Colors.red;
      case AssetCondition.damaged:
        return Colors.red.shade800;
    }
  }
}

extension AssetStatusExtension on AssetStatus {
  String get displayName {
    switch (this) {
      case AssetStatus.available:
        return 'Available';
      case AssetStatus.in_use:
        return 'In Use';
      case AssetStatus.maintenance:
        return 'Under Maintenance';
      case AssetStatus.repair:
        return 'Under Repair';
      case AssetStatus.retired:
        return 'Retired';
      case AssetStatus.disposed:
        return 'Disposed';
    }
  }

  Color get color {
    switch (this) {
      case AssetStatus.available:
        return Colors.green;
      case AssetStatus.in_use:
        return Colors.blue;
      case AssetStatus.maintenance:
      case AssetStatus.repair:
        return Colors.orange;
      case AssetStatus.retired:
        return Colors.grey;
      case AssetStatus.disposed:
        return Colors.red;
    }
  }
}

extension InventoryCategoryExtension on InventoryCategory {
  String get displayName {
    switch (this) {
      case InventoryCategory.supplies:
        return 'Supplies';
      case InventoryCategory.consumables:
        return 'Consumables';
      case InventoryCategory.chemicals:
        return 'Chemicals';
      case InventoryCategory.stationery:
        return 'Stationery';
      case InventoryCategory.cleaning:
        return 'Cleaning';
      case InventoryCategory.food:
        return 'Food';
      case InventoryCategory.medical:
        return 'Medical';
      case InventoryCategory.maintenance:
        return 'Maintenance';
    }
  }

  String get icon {
    switch (this) {
      case InventoryCategory.supplies:
        return '📦';
      case InventoryCategory.consumables:
        return '🔋';
      case InventoryCategory.chemicals:
        return '🧪';
      case InventoryCategory.stationery:
        return '✏️';
      case InventoryCategory.cleaning:
        return '🧹';
      case InventoryCategory.food:
        return '🍽️';
      case InventoryCategory.medical:
        return '💊';
      case InventoryCategory.maintenance:
        return '🔧';
    }
  }
}