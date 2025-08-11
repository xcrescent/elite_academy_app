// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssetModelAdapter extends TypeAdapter<AssetModel> {
  @override
  final int typeId = 75;

  @override
  AssetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AssetModel(
      id: fields[0] as String?,
      assetId: fields[1] as String,
      name: fields[2] as String,
      description: fields[3] as String,
      category: fields[4] as AssetCategory,
      brand: fields[5] as String,
      model: fields[6] as String,
      serialNumber: fields[7] as String,
      purchasePrice: fields[8] as double,
      purchaseDate: fields[9] as DateTime,
      supplier: fields[10] as String,
      condition: fields[11] as AssetCondition,
      status: fields[12] as AssetStatus,
      location: fields[13] as String,
      department: fields[14] as String,
      assignedTo: fields[15] as String?,
      assignedToName: fields[16] as String?,
      assignedDate: fields[17] as DateTime?,
      warrantyExpiry: fields[18] as DateTime?,
      lastMaintenanceDate: fields[19] as DateTime?,
      nextMaintenanceDate: fields[20] as DateTime?,
      currentValue: fields[21] as double,
      depreciationRate: fields[22] as double,
      attachments: (fields[23] as List).cast<String>(),
      notes: fields[24] as String?,
      createdAt: fields[25] as DateTime,
      createdBy: fields[26] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AssetModel obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.assetId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.brand)
      ..writeByte(6)
      ..write(obj.model)
      ..writeByte(7)
      ..write(obj.serialNumber)
      ..writeByte(8)
      ..write(obj.purchasePrice)
      ..writeByte(9)
      ..write(obj.purchaseDate)
      ..writeByte(10)
      ..write(obj.supplier)
      ..writeByte(11)
      ..write(obj.condition)
      ..writeByte(12)
      ..write(obj.status)
      ..writeByte(13)
      ..write(obj.location)
      ..writeByte(14)
      ..write(obj.department)
      ..writeByte(15)
      ..write(obj.assignedTo)
      ..writeByte(16)
      ..write(obj.assignedToName)
      ..writeByte(17)
      ..write(obj.assignedDate)
      ..writeByte(18)
      ..write(obj.warrantyExpiry)
      ..writeByte(19)
      ..write(obj.lastMaintenanceDate)
      ..writeByte(20)
      ..write(obj.nextMaintenanceDate)
      ..writeByte(21)
      ..write(obj.currentValue)
      ..writeByte(22)
      ..write(obj.depreciationRate)
      ..writeByte(23)
      ..write(obj.attachments)
      ..writeByte(24)
      ..write(obj.notes)
      ..writeByte(25)
      ..write(obj.createdAt)
      ..writeByte(26)
      ..write(obj.createdBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InventoryItemModelAdapter extends TypeAdapter<InventoryItemModel> {
  @override
  final int typeId = 76;

  @override
  InventoryItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InventoryItemModel(
      id: fields[0] as String?,
      itemCode: fields[1] as String,
      name: fields[2] as String,
      description: fields[3] as String,
      category: fields[4] as InventoryCategory,
      unit: fields[5] as String,
      currentStock: fields[6] as int,
      minStockLevel: fields[7] as int,
      maxStockLevel: fields[8] as int,
      unitPrice: fields[9] as double,
      supplier: fields[10] as String,
      location: fields[11] as String,
      expiryDate: fields[12] as DateTime?,
      batchNumber: fields[13] as String?,
      status: fields[14] as InventoryStatus,
      createdAt: fields[15] as DateTime,
      createdBy: fields[16] as String,
      lastUpdated: fields[17] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, InventoryItemModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.itemCode)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.unit)
      ..writeByte(6)
      ..write(obj.currentStock)
      ..writeByte(7)
      ..write(obj.minStockLevel)
      ..writeByte(8)
      ..write(obj.maxStockLevel)
      ..writeByte(9)
      ..write(obj.unitPrice)
      ..writeByte(10)
      ..write(obj.supplier)
      ..writeByte(11)
      ..write(obj.location)
      ..writeByte(12)
      ..write(obj.expiryDate)
      ..writeByte(13)
      ..write(obj.batchNumber)
      ..writeByte(14)
      ..write(obj.status)
      ..writeByte(15)
      ..write(obj.createdAt)
      ..writeByte(16)
      ..write(obj.createdBy)
      ..writeByte(17)
      ..write(obj.lastUpdated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InventoryItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MaintenanceRecordModelAdapter
    extends TypeAdapter<MaintenanceRecordModel> {
  @override
  final int typeId = 77;

  @override
  MaintenanceRecordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MaintenanceRecordModel(
      id: fields[0] as String?,
      assetId: fields[1] as String,
      assetName: fields[2] as String,
      type: fields[3] as MaintenanceType,
      scheduledDate: fields[4] as DateTime,
      completedDate: fields[5] as DateTime?,
      status: fields[6] as MaintenanceStatus,
      description: fields[7] as String,
      workPerformed: fields[8] as String?,
      partsReplaced: fields[9] as String?,
      cost: fields[10] as double,
      technician: fields[11] as String?,
      vendorCompany: fields[12] as String?,
      priority: fields[13] as MaintenancePriority,
      notes: fields[14] as String?,
      beforeImages: (fields[15] as List).cast<String>(),
      afterImages: (fields[16] as List).cast<String>(),
      nextMaintenanceDate: fields[17] as DateTime?,
      createdAt: fields[18] as DateTime,
      createdBy: fields[19] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MaintenanceRecordModel obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.assetId)
      ..writeByte(2)
      ..write(obj.assetName)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.scheduledDate)
      ..writeByte(5)
      ..write(obj.completedDate)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.workPerformed)
      ..writeByte(9)
      ..write(obj.partsReplaced)
      ..writeByte(10)
      ..write(obj.cost)
      ..writeByte(11)
      ..write(obj.technician)
      ..writeByte(12)
      ..write(obj.vendorCompany)
      ..writeByte(13)
      ..write(obj.priority)
      ..writeByte(14)
      ..write(obj.notes)
      ..writeByte(15)
      ..write(obj.beforeImages)
      ..writeByte(16)
      ..write(obj.afterImages)
      ..writeByte(17)
      ..write(obj.nextMaintenanceDate)
      ..writeByte(18)
      ..write(obj.createdAt)
      ..writeByte(19)
      ..write(obj.createdBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaintenanceRecordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StockMovementModelAdapter extends TypeAdapter<StockMovementModel> {
  @override
  final int typeId = 78;

  @override
  StockMovementModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StockMovementModel(
      id: fields[0] as String?,
      itemId: fields[1] as String,
      itemName: fields[2] as String,
      type: fields[3] as MovementType,
      quantity: fields[4] as int,
      reason: fields[5] as String,
      reference: fields[6] as String?,
      issuedTo: fields[7] as String?,
      issuedToName: fields[8] as String?,
      receivedFrom: fields[9] as String?,
      unitPrice: fields[10] as double,
      transactionDate: fields[11] as DateTime,
      performedBy: fields[12] as String,
      notes: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StockMovementModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.itemId)
      ..writeByte(2)
      ..write(obj.itemName)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.reason)
      ..writeByte(6)
      ..write(obj.reference)
      ..writeByte(7)
      ..write(obj.issuedTo)
      ..writeByte(8)
      ..write(obj.issuedToName)
      ..writeByte(9)
      ..write(obj.receivedFrom)
      ..writeByte(10)
      ..write(obj.unitPrice)
      ..writeByte(11)
      ..write(obj.transactionDate)
      ..writeByte(12)
      ..write(obj.performedBy)
      ..writeByte(13)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockMovementModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PurchaseRequestModelAdapter extends TypeAdapter<PurchaseRequestModel> {
  @override
  final int typeId = 79;

  @override
  PurchaseRequestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseRequestModel(
      id: fields[0] as String?,
      requestNumber: fields[1] as String,
      requestedBy: fields[2] as String,
      requestedByName: fields[3] as String,
      department: fields[4] as String,
      requestDate: fields[5] as DateTime,
      requiredDate: fields[6] as DateTime,
      status: fields[7] as PurchaseRequestStatus,
      justification: fields[8] as String,
      items: (fields[9] as List).cast<PurchaseItemModel>(),
      totalAmount: fields[10] as double,
      approvedBy: fields[11] as String?,
      approvedDate: fields[12] as DateTime?,
      rejectionReason: fields[13] as String?,
      priority: fields[14] as PurchasePriority,
      notes: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PurchaseRequestModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.requestNumber)
      ..writeByte(2)
      ..write(obj.requestedBy)
      ..writeByte(3)
      ..write(obj.requestedByName)
      ..writeByte(4)
      ..write(obj.department)
      ..writeByte(5)
      ..write(obj.requestDate)
      ..writeByte(6)
      ..write(obj.requiredDate)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.justification)
      ..writeByte(9)
      ..write(obj.items)
      ..writeByte(10)
      ..write(obj.totalAmount)
      ..writeByte(11)
      ..write(obj.approvedBy)
      ..writeByte(12)
      ..write(obj.approvedDate)
      ..writeByte(13)
      ..write(obj.rejectionReason)
      ..writeByte(14)
      ..write(obj.priority)
      ..writeByte(15)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseRequestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PurchaseItemModelAdapter extends TypeAdapter<PurchaseItemModel> {
  @override
  final int typeId = 80;

  @override
  PurchaseItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseItemModel(
      id: fields[0] as String?,
      itemName: fields[1] as String,
      description: fields[2] as String,
      quantity: fields[3] as int,
      unit: fields[4] as String,
      estimatedPrice: fields[5] as double,
      preferredSupplier: fields[6] as String?,
      specifications: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PurchaseItemModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.itemName)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.unit)
      ..writeByte(5)
      ..write(obj.estimatedPrice)
      ..writeByte(6)
      ..write(obj.preferredSupplier)
      ..writeByte(7)
      ..write(obj.specifications);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AssetCategoryAdapter extends TypeAdapter<AssetCategory> {
  @override
  final int typeId = 81;

  @override
  AssetCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AssetCategory.equipment;
      case 1:
        return AssetCategory.furniture;
      case 2:
        return AssetCategory.electronics;
      case 3:
        return AssetCategory.vehicles;
      case 4:
        return AssetCategory.buildings;
      case 5:
        return AssetCategory.computer;
      case 6:
        return AssetCategory.laboratory;
      case 7:
        return AssetCategory.sports;
      case 8:
        return AssetCategory.library;
      default:
        return AssetCategory.equipment;
    }
  }

  @override
  void write(BinaryWriter writer, AssetCategory obj) {
    switch (obj) {
      case AssetCategory.equipment:
        writer.writeByte(0);
        break;
      case AssetCategory.furniture:
        writer.writeByte(1);
        break;
      case AssetCategory.electronics:
        writer.writeByte(2);
        break;
      case AssetCategory.vehicles:
        writer.writeByte(3);
        break;
      case AssetCategory.buildings:
        writer.writeByte(4);
        break;
      case AssetCategory.computer:
        writer.writeByte(5);
        break;
      case AssetCategory.laboratory:
        writer.writeByte(6);
        break;
      case AssetCategory.sports:
        writer.writeByte(7);
        break;
      case AssetCategory.library:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssetCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AssetConditionAdapter extends TypeAdapter<AssetCondition> {
  @override
  final int typeId = 82;

  @override
  AssetCondition read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AssetCondition.excellent;
      case 1:
        return AssetCondition.good;
      case 2:
        return AssetCondition.fair;
      case 3:
        return AssetCondition.poor;
      case 4:
        return AssetCondition.damaged;
      default:
        return AssetCondition.excellent;
    }
  }

  @override
  void write(BinaryWriter writer, AssetCondition obj) {
    switch (obj) {
      case AssetCondition.excellent:
        writer.writeByte(0);
        break;
      case AssetCondition.good:
        writer.writeByte(1);
        break;
      case AssetCondition.fair:
        writer.writeByte(2);
        break;
      case AssetCondition.poor:
        writer.writeByte(3);
        break;
      case AssetCondition.damaged:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssetConditionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AssetStatusAdapter extends TypeAdapter<AssetStatus> {
  @override
  final int typeId = 83;

  @override
  AssetStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AssetStatus.available;
      case 1:
        return AssetStatus.in_use;
      case 2:
        return AssetStatus.maintenance;
      case 3:
        return AssetStatus.repair;
      case 4:
        return AssetStatus.retired;
      case 5:
        return AssetStatus.disposed;
      default:
        return AssetStatus.available;
    }
  }

  @override
  void write(BinaryWriter writer, AssetStatus obj) {
    switch (obj) {
      case AssetStatus.available:
        writer.writeByte(0);
        break;
      case AssetStatus.in_use:
        writer.writeByte(1);
        break;
      case AssetStatus.maintenance:
        writer.writeByte(2);
        break;
      case AssetStatus.repair:
        writer.writeByte(3);
        break;
      case AssetStatus.retired:
        writer.writeByte(4);
        break;
      case AssetStatus.disposed:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssetStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InventoryCategoryAdapter extends TypeAdapter<InventoryCategory> {
  @override
  final int typeId = 84;

  @override
  InventoryCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return InventoryCategory.supplies;
      case 1:
        return InventoryCategory.consumables;
      case 2:
        return InventoryCategory.chemicals;
      case 3:
        return InventoryCategory.stationery;
      case 4:
        return InventoryCategory.cleaning;
      case 5:
        return InventoryCategory.food;
      case 6:
        return InventoryCategory.medical;
      case 7:
        return InventoryCategory.maintenance;
      default:
        return InventoryCategory.supplies;
    }
  }

  @override
  void write(BinaryWriter writer, InventoryCategory obj) {
    switch (obj) {
      case InventoryCategory.supplies:
        writer.writeByte(0);
        break;
      case InventoryCategory.consumables:
        writer.writeByte(1);
        break;
      case InventoryCategory.chemicals:
        writer.writeByte(2);
        break;
      case InventoryCategory.stationery:
        writer.writeByte(3);
        break;
      case InventoryCategory.cleaning:
        writer.writeByte(4);
        break;
      case InventoryCategory.food:
        writer.writeByte(5);
        break;
      case InventoryCategory.medical:
        writer.writeByte(6);
        break;
      case InventoryCategory.maintenance:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InventoryCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InventoryStatusAdapter extends TypeAdapter<InventoryStatus> {
  @override
  final int typeId = 85;

  @override
  InventoryStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return InventoryStatus.inStock;
      case 1:
        return InventoryStatus.lowStock;
      case 2:
        return InventoryStatus.outOfStock;
      case 3:
        return InventoryStatus.expired;
      case 4:
        return InventoryStatus.damaged;
      default:
        return InventoryStatus.inStock;
    }
  }

  @override
  void write(BinaryWriter writer, InventoryStatus obj) {
    switch (obj) {
      case InventoryStatus.inStock:
        writer.writeByte(0);
        break;
      case InventoryStatus.lowStock:
        writer.writeByte(1);
        break;
      case InventoryStatus.outOfStock:
        writer.writeByte(2);
        break;
      case InventoryStatus.expired:
        writer.writeByte(3);
        break;
      case InventoryStatus.damaged:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InventoryStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MaintenanceTypeAdapter extends TypeAdapter<MaintenanceType> {
  @override
  final int typeId = 86;

  @override
  MaintenanceType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MaintenanceType.preventive;
      case 1:
        return MaintenanceType.corrective;
      case 2:
        return MaintenanceType.emergency;
      case 3:
        return MaintenanceType.inspection;
      case 4:
        return MaintenanceType.calibration;
      default:
        return MaintenanceType.preventive;
    }
  }

  @override
  void write(BinaryWriter writer, MaintenanceType obj) {
    switch (obj) {
      case MaintenanceType.preventive:
        writer.writeByte(0);
        break;
      case MaintenanceType.corrective:
        writer.writeByte(1);
        break;
      case MaintenanceType.emergency:
        writer.writeByte(2);
        break;
      case MaintenanceType.inspection:
        writer.writeByte(3);
        break;
      case MaintenanceType.calibration:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaintenanceTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MaintenanceStatusAdapter extends TypeAdapter<MaintenanceStatus> {
  @override
  final int typeId = 87;

  @override
  MaintenanceStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MaintenanceStatus.scheduled;
      case 1:
        return MaintenanceStatus.in_progress;
      case 2:
        return MaintenanceStatus.completed;
      case 3:
        return MaintenanceStatus.cancelled;
      case 4:
        return MaintenanceStatus.overdue;
      default:
        return MaintenanceStatus.scheduled;
    }
  }

  @override
  void write(BinaryWriter writer, MaintenanceStatus obj) {
    switch (obj) {
      case MaintenanceStatus.scheduled:
        writer.writeByte(0);
        break;
      case MaintenanceStatus.in_progress:
        writer.writeByte(1);
        break;
      case MaintenanceStatus.completed:
        writer.writeByte(2);
        break;
      case MaintenanceStatus.cancelled:
        writer.writeByte(3);
        break;
      case MaintenanceStatus.overdue:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaintenanceStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MaintenancePriorityAdapter extends TypeAdapter<MaintenancePriority> {
  @override
  final int typeId = 88;

  @override
  MaintenancePriority read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MaintenancePriority.low;
      case 1:
        return MaintenancePriority.medium;
      case 2:
        return MaintenancePriority.high;
      case 3:
        return MaintenancePriority.critical;
      default:
        return MaintenancePriority.low;
    }
  }

  @override
  void write(BinaryWriter writer, MaintenancePriority obj) {
    switch (obj) {
      case MaintenancePriority.low:
        writer.writeByte(0);
        break;
      case MaintenancePriority.medium:
        writer.writeByte(1);
        break;
      case MaintenancePriority.high:
        writer.writeByte(2);
        break;
      case MaintenancePriority.critical:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaintenancePriorityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MovementTypeAdapter extends TypeAdapter<MovementType> {
  @override
  final int typeId = 89;

  @override
  MovementType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MovementType.inward;
      case 1:
        return MovementType.outward;
      case 2:
        return MovementType.transfer;
      case 3:
        return MovementType.adjustment;
      default:
        return MovementType.inward;
    }
  }

  @override
  void write(BinaryWriter writer, MovementType obj) {
    switch (obj) {
      case MovementType.inward:
        writer.writeByte(0);
        break;
      case MovementType.outward:
        writer.writeByte(1);
        break;
      case MovementType.transfer:
        writer.writeByte(2);
        break;
      case MovementType.adjustment:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovementTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PurchaseRequestStatusAdapter extends TypeAdapter<PurchaseRequestStatus> {
  @override
  final int typeId = 90;

  @override
  PurchaseRequestStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PurchaseRequestStatus.pending;
      case 1:
        return PurchaseRequestStatus.approved;
      case 2:
        return PurchaseRequestStatus.rejected;
      case 3:
        return PurchaseRequestStatus.ordered;
      case 4:
        return PurchaseRequestStatus.received;
      default:
        return PurchaseRequestStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, PurchaseRequestStatus obj) {
    switch (obj) {
      case PurchaseRequestStatus.pending:
        writer.writeByte(0);
        break;
      case PurchaseRequestStatus.approved:
        writer.writeByte(1);
        break;
      case PurchaseRequestStatus.rejected:
        writer.writeByte(2);
        break;
      case PurchaseRequestStatus.ordered:
        writer.writeByte(3);
        break;
      case PurchaseRequestStatus.received:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseRequestStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PurchasePriorityAdapter extends TypeAdapter<PurchasePriority> {
  @override
  final int typeId = 91;

  @override
  PurchasePriority read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PurchasePriority.low;
      case 1:
        return PurchasePriority.medium;
      case 2:
        return PurchasePriority.high;
      case 3:
        return PurchasePriority.urgent;
      default:
        return PurchasePriority.low;
    }
  }

  @override
  void write(BinaryWriter writer, PurchasePriority obj) {
    switch (obj) {
      case PurchasePriority.low:
        writer.writeByte(0);
        break;
      case PurchasePriority.medium:
        writer.writeByte(1);
        break;
      case PurchasePriority.high:
        writer.writeByte(2);
        break;
      case PurchasePriority.urgent:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchasePriorityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
