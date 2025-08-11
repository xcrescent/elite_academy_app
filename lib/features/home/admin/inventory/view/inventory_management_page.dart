import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/inventory_model.dart';

// Sample data providers
final assetsProvider = FutureProvider<List<AssetModel>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  
  return [
    AssetModel(
      id: '1',
      assetId: 'AST-001',
      name: 'Dell OptiPlex 7090',
      description: 'Desktop computer for computer lab',
      category: AssetCategory.computer,
      brand: 'Dell',
      model: 'OptiPlex 7090',
      serialNumber: 'DL7090001',
      purchasePrice: 45000.0,
      purchaseDate: DateTime(2022, 6, 15),
      supplier: 'Tech Solutions Pvt Ltd',
      condition: AssetCondition.excellent,
      status: AssetStatus.in_use,
      location: 'Computer Lab 1',
      department: 'IT Department',
      assignedTo: 'teacher1',
      assignedToName: 'Mr. Rajesh Kumar',
      assignedDate: DateTime(2022, 6, 20),
      warrantyExpiry: DateTime(2025, 6, 15),
      nextMaintenanceDate: DateTime.now().add(const Duration(days: 30)),
      currentValue: 35000.0,
      depreciationRate: 15.0,
      attachments: [],
      createdAt: DateTime(2022, 6, 15),
      createdBy: 'Admin',
    ),
    AssetModel(
      id: '2',
      assetId: 'AST-002',
      name: 'Interactive Smart Board',
      description: '75-inch interactive display for classrooms',
      category: AssetCategory.electronics,
      brand: 'Smart Technologies',
      model: 'SMART Board MX275',
      serialNumber: 'SM275002',
      purchasePrice: 120000.0,
      purchaseDate: DateTime(2023, 1, 10),
      supplier: 'Education Tech Solutions',
      condition: AssetCondition.good,
      status: AssetStatus.in_use,
      location: 'Classroom 10A',
      department: 'Academic',
      assignedTo: 'teacher2',
      assignedToName: 'Mrs. Sarah Johnson',
      assignedDate: DateTime(2023, 1, 15),
      warrantyExpiry: DateTime(2026, 1, 10),
      lastMaintenanceDate: DateTime.now().subtract(const Duration(days: 60)),
      nextMaintenanceDate: DateTime.now().add(const Duration(days: 60)),
      currentValue: 110000.0,
      depreciationRate: 10.0,
      attachments: [],
      createdAt: DateTime(2023, 1, 10),
      createdBy: 'Admin',
    ),
    AssetModel(
      id: '3',
      assetId: 'AST-003',
      name: 'Laboratory Microscope',
      description: 'Digital microscope for biology lab',
      category: AssetCategory.laboratory,
      brand: 'Olympus',
      model: 'CX23 LED',
      serialNumber: 'OL-CX23-003',
      purchasePrice: 25000.0,
      purchaseDate: DateTime(2021, 8, 5),
      supplier: 'Scientific Instruments Ltd',
      condition: AssetCondition.good,
      status: AssetStatus.maintenance,
      location: 'Biology Lab',
      department: 'Science',
      warrantyExpiry: DateTime(2024, 8, 5),
      lastMaintenanceDate: DateTime.now().subtract(const Duration(days: 10)),
      currentValue: 18000.0,
      depreciationRate: 12.0,
      attachments: [],
      notes: 'Currently under routine maintenance - lens cleaning and calibration',
      createdAt: DateTime(2021, 8, 5),
      createdBy: 'Lab Administrator',
    ),
    AssetModel(
      id: '4',
      assetId: 'AST-004',
      name: 'School Bus - Mahindra',
      description: '32-seater school bus for student transport',
      category: AssetCategory.vehicles,
      brand: 'Mahindra',
      model: 'Tourister COSMO School Bus',
      serialNumber: 'MH-BUS-004',
      purchasePrice: 1200000.0,
      purchaseDate: DateTime(2020, 3, 1),
      supplier: 'Mahindra Automotive',
      condition: AssetCondition.fair,
      status: AssetStatus.in_use,
      location: 'School Parking',
      department: 'Transport',
      assignedTo: 'driver1',
      assignedToName: 'Mr. Ramesh Singh',
      assignedDate: DateTime(2020, 3, 5),
      lastMaintenanceDate: DateTime.now().subtract(const Duration(days: 15)),
      nextMaintenanceDate: DateTime.now().add(const Duration(days: 45)),
      currentValue: 850000.0,
      depreciationRate: 20.0,
      attachments: [],
      notes: 'Regular servicing required every 3 months',
      createdAt: DateTime(2020, 3, 1),
      createdBy: 'Transport Manager',
    ),
  ];
});

final inventoryItemsProvider = FutureProvider<List<InventoryItemModel>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 800));
  
  return [
    InventoryItemModel(
      id: '1',
      itemCode: 'STA-001',
      name: 'A4 Paper',
      description: 'White A4 printing paper, 80 GSM',
      category: InventoryCategory.stationery,
      unit: 'Ream',
      currentStock: 45,
      minStockLevel: 20,
      maxStockLevel: 100,
      unitPrice: 250.0,
      supplier: 'Paper Mills Ltd',
      location: 'Store Room A',
      status: InventoryStatus.inStock,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      createdBy: 'Store Keeper',
    ),
    InventoryItemModel(
      id: '2',
      itemCode: 'CHM-001',
      name: 'Sodium Chloride',
      description: 'Laboratory grade NaCl for experiments',
      category: InventoryCategory.chemicals,
      unit: 'Kg',
      currentStock: 5,
      minStockLevel: 10,
      maxStockLevel: 50,
      unitPrice: 150.0,
      supplier: 'Chemical Suppliers Co',
      location: 'Chemistry Lab Store',
      expiryDate: DateTime.now().add(const Duration(days: 365)),
      batchNumber: 'BATCH-2024-001',
      status: InventoryStatus.lowStock,
      createdAt: DateTime.now().subtract(const Duration(days: 60)),
      createdBy: 'Lab Assistant',
    ),
    InventoryItemModel(
      id: '3',
      itemCode: 'CLN-001',
      name: 'Floor Cleaner',
      description: 'Multi-surface floor cleaning liquid',
      category: InventoryCategory.cleaning,
      unit: 'Litre',
      currentStock: 0,
      minStockLevel: 15,
      maxStockLevel: 50,
      unitPrice: 120.0,
      supplier: 'Cleaning Solutions Pvt Ltd',
      location: 'Maintenance Store',
      status: InventoryStatus.outOfStock,
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
      createdBy: 'Maintenance Staff',
    ),
    InventoryItemModel(
      id: '4',
      itemCode: 'MED-001',
      name: 'First Aid Kit',
      description: 'Complete first aid kit with bandages and medicines',
      category: InventoryCategory.medical,
      unit: 'Kit',
      currentStock: 8,
      minStockLevel: 5,
      maxStockLevel: 20,
      unitPrice: 850.0,
      supplier: 'Medical Supplies Co',
      location: 'Medical Room',
      expiryDate: DateTime.now().add(const Duration(days: 180)),
      status: InventoryStatus.inStock,
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
      createdBy: 'School Nurse',
    ),
  ];
});

final maintenanceRecordsProvider = FutureProvider<List<MaintenanceRecordModel>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 600));
  
  return [
    MaintenanceRecordModel(
      id: '1',
      assetId: 'AST-001',
      assetName: 'Dell OptiPlex 7090',
      type: MaintenanceType.preventive,
      scheduledDate: DateTime.now().add(const Duration(days: 15)),
      status: MaintenanceStatus.scheduled,
      description: 'Routine computer maintenance - dust cleaning and software updates',
      cost: 500.0,
      technician: 'IT Technician',
      priority: MaintenancePriority.medium,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      createdBy: 'IT Manager',
    ),
    MaintenanceRecordModel(
      id: '2',
      assetId: 'AST-003',
      assetName: 'Laboratory Microscope',
      type: MaintenanceType.corrective,
      scheduledDate: DateTime.now().subtract(const Duration(days: 2)),
      completedDate: DateTime.now(),
      status: MaintenanceStatus.completed,
      description: 'Lens cleaning and calibration',
      workPerformed: 'Cleaned objective lenses, calibrated focus mechanism, replaced LED bulb',
      cost: 1200.0,
      technician: 'Lab Technician',
      vendorCompany: 'Scientific Service Co',
      priority: MaintenancePriority.high,
      nextMaintenanceDate: DateTime.now().add(const Duration(days: 90)),
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      createdBy: 'Science HOD',
    ),
    MaintenanceRecordModel(
      id: '3',
      assetId: 'AST-004',
      assetName: 'School Bus - Mahindra',
      type: MaintenanceType.preventive,
      scheduledDate: DateTime.now().subtract(const Duration(days: 5)),
      status: MaintenanceStatus.overdue,
      description: 'Quarterly vehicle servicing and safety inspection',
      cost: 8000.0,
      vendorCompany: 'Auto Service Center',
      priority: MaintenancePriority.high,
      notes: 'Overdue by 5 days - needs immediate attention',
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
      createdBy: 'Transport Manager',
    ),
  ];
});

final purchaseRequestsProvider = FutureProvider<List<PurchaseRequestModel>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 500));
  
  return [
    PurchaseRequestModel(
      id: '1',
      requestNumber: 'PR-2024-001',
      requestedBy: 'teacher1',
      requestedByName: 'Dr. Sarah Johnson',
      department: 'Mathematics',
      requestDate: DateTime.now().subtract(const Duration(days: 3)),
      requiredDate: DateTime.now().add(const Duration(days: 10)),
      status: PurchaseRequestStatus.pending,
      justification: 'Required for new batch of students in advanced mathematics course',
      items: [
        PurchaseItemModel(
          itemName: 'Scientific Calculators',
          description: 'Casio fx-991EX advanced scientific calculator',
          quantity: 30,
          unit: 'Pieces',
          estimatedPrice: 1200.0,
          preferredSupplier: 'Electronics Store',
        ),
        PurchaseItemModel(
          itemName: 'Geometry Sets',
          description: 'Complete geometry set with compass and protractor',
          quantity: 30,
          unit: 'Sets',
          estimatedPrice: 150.0,
          preferredSupplier: 'Stationery Supplies',
        ),
      ],
      totalAmount: 40500.0,
      priority: PurchasePriority.medium,
      notes: 'Items needed before next semester starts',
    ),
    PurchaseRequestModel(
      id: '2',
      requestNumber: 'PR-2024-002',
      requestedBy: 'maintenance1',
      requestedByName: 'Mr. Raj Kumar',
      department: 'Maintenance',
      requestDate: DateTime.now().subtract(const Duration(days: 1)),
      requiredDate: DateTime.now().add(const Duration(days: 3)),
      status: PurchaseRequestStatus.approved,
      justification: 'Urgent replacement needed for broken equipment',
      items: [
        PurchaseItemModel(
          itemName: 'Water Pump Motor',
          description: '1 HP submersible water pump motor',
          quantity: 1,
          unit: 'Unit',
          estimatedPrice: 8500.0,
          preferredSupplier: 'Electrical Equipment Co',
        ),
      ],
      totalAmount: 8500.0,
      approvedBy: 'Principal',
      approvedDate: DateTime.now().subtract(const Duration(hours: 6)),
      priority: PurchasePriority.urgent,
      notes: 'Critical for school water supply system',
    ),
  ];
});

@RoutePage()
class InventoryManagementPage extends ConsumerStatefulWidget {
  const InventoryManagementPage({super.key});

  @override
  ConsumerState<InventoryManagementPage> createState() => _InventoryManagementPageState();
}

class _InventoryManagementPageState extends ConsumerState<InventoryManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedCategory = 'All';
  String selectedStatus = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final assetsAsync = ref.watch(assetsProvider);
    final inventoryAsync = ref.watch(inventoryItemsProvider);
    final maintenanceAsync = ref.watch(maintenanceRecordsProvider);
    final purchaseAsync = ref.watch(purchaseRequestsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory & Assets'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.devices), text: 'Assets'),
            Tab(icon: Icon(Icons.inventory), text: 'Inventory'),
            Tab(icon: Icon(Icons.build), text: 'Maintenance'),
            Tab(icon: Icon(Icons.shopping_cart), text: 'Purchases'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: _scanAssetCode,
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'asset_report',
                child: Row(
                  children: [
                    Icon(Icons.assessment, size: 20),
                    SizedBox(width: 8),
                    Text('Asset Report'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'stock_report',
                child: Row(
                  children: [
                    Icon(Icons.inventory_2, size: 20),
                    SizedBox(width: 8),
                    Text('Stock Report'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'maintenance_schedule',
                child: Row(
                  children: [
                    Icon(Icons.schedule, size: 20),
                    SizedBox(width: 8),
                    Text('Maintenance Schedule'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'depreciation_report',
                child: Row(
                  children: [
                    Icon(Icons.trending_down, size: 20),
                    SizedBox(width: 8),
                    Text('Depreciation Report'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAssetsTab(assetsAsync),
          _buildInventoryTab(inventoryAsync),
          _buildMaintenanceTab(maintenanceAsync),
          _buildPurchaseTab(purchaseAsync),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildFloatingActionButton() {
    switch (_tabController.index) {
      case 0:
        return FloatingActionButton.extended(
          onPressed: _showAddAssetDialog,
          icon: const Icon(Icons.add),
          label: const Text('Add Asset'),
        );
      case 1:
        return FloatingActionButton.extended(
          onPressed: _showAddInventoryDialog,
          icon: const Icon(Icons.add_box),
          label: const Text('Add Item'),
        );
      case 2:
        return FloatingActionButton.extended(
          onPressed: _showScheduleMaintenanceDialog,
          icon: const Icon(Icons.build_circle),
          label: const Text('Schedule'),
        );
      case 3:
        return FloatingActionButton.extended(
          onPressed: _showCreatePurchaseRequestDialog,
          icon: const Icon(Icons.add_shopping_cart),
          label: const Text('New Request'),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildAssetsTab(AsyncValue<List<AssetModel>> assetsAsync) {
    return Column(
      children: [
        _buildAssetFilters(),
        _buildAssetStats(assetsAsync),
        Expanded(
          child: assetsAsync.when(
            data: (assets) => _buildAssetsList(assets),
            loading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading assets...'),
                ],
              ),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading assets: ${error.toString()}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.refresh(assetsProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInventoryTab(AsyncValue<List<InventoryItemModel>> inventoryAsync) {
    return Column(
      children: [
        _buildInventoryStats(inventoryAsync),
        Expanded(
          child: inventoryAsync.when(
            data: (inventory) => _buildInventoryList(inventory),
            loading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading inventory...'),
                ],
              ),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading inventory: ${error.toString()}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.refresh(inventoryItemsProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMaintenanceTab(AsyncValue<List<MaintenanceRecordModel>> maintenanceAsync) {
    return Column(
      children: [
        _buildMaintenanceStats(maintenanceAsync),
        Expanded(
          child: maintenanceAsync.when(
            data: (maintenance) => _buildMaintenanceList(maintenance),
            loading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading maintenance records...'),
                ],
              ),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading maintenance: ${error.toString()}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.refresh(maintenanceRecordsProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPurchaseTab(AsyncValue<List<PurchaseRequestModel>> purchaseAsync) {
    return Column(
      children: [
        _buildPurchaseStats(purchaseAsync),
        Expanded(
          child: purchaseAsync.when(
            data: (purchases) => _buildPurchaseList(purchases),
            loading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading purchase requests...'),
                ],
              ),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading purchases: ${error.toString()}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.refresh(purchaseRequestsProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAssetFilters() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filters',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedCategory,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                    items: ['All', 'Computer', 'Electronics', 'Laboratory', 'Furniture', 'Vehicles']
                        .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedStatus,
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(),
                    ),
                    items: ['All', 'Available', 'In Use', 'Maintenance', 'Repair', 'Retired']
                        .map((status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedStatus = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetStats(AsyncValue<List<AssetModel>> assetsAsync) {
    return assetsAsync.when(
      data: (assets) {
        final totalAssets = assets.length;
        final inUseAssets = assets.where((a) => a.status == AssetStatus.in_use).length;
        final maintenanceAssets = assets.where((a) => a.needsMaintenance).length;
        final totalValue = assets.fold<double>(0, (sum, asset) => sum + asset.currentValue);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Total Assets',
                  value: '$totalAssets',
                  icon: Icons.devices,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'In Use',
                  value: '$inUseAssets',
                  icon: Icons.assignment,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Maintenance',
                  value: '$maintenanceAssets',
                  icon: Icons.build,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Total Value',
                  value: '₹${_formatAmount(totalValue)}',
                  icon: Icons.account_balance_wallet,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildInventoryStats(AsyncValue<List<InventoryItemModel>> inventoryAsync) {
    return inventoryAsync.when(
      data: (inventory) {
        final totalItems = inventory.length;
        final lowStockItems = inventory.where((i) => i.isLowStock).length;
        final outOfStockItems = inventory.where((i) => i.isOutOfStock).length;
        final totalValue = inventory.fold<double>(0, (sum, item) => sum + item.totalValue);

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Total Items',
                  value: '$totalItems',
                  icon: Icons.inventory,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Low Stock',
                  value: '$lowStockItems',
                  icon: Icons.warning,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Out of Stock',
                  value: '$outOfStockItems',
                  icon: Icons.remove_circle,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Total Value',
                  value: '₹${_formatAmount(totalValue)}',
                  icon: Icons.currency_rupee,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildMaintenanceStats(AsyncValue<List<MaintenanceRecordModel>> maintenanceAsync) {
    return maintenanceAsync.when(
      data: (maintenance) {
        final totalRecords = maintenance.length;
        final scheduledMaintenance = maintenance.where((m) => m.status == MaintenanceStatus.scheduled).length;
        final overdueMaintenance = maintenance.where((m) => m.isOverdue).length;
        final totalCost = maintenance.fold<double>(0, (sum, m) => sum + m.cost);

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Total',
                  value: '$totalRecords',
                  icon: Icons.build,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Scheduled',
                  value: '$scheduledMaintenance',
                  icon: Icons.schedule,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Overdue',
                  value: '$overdueMaintenance',
                  icon: Icons.warning,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Total Cost',
                  value: '₹${_formatAmount(totalCost)}',
                  icon: Icons.account_balance_wallet,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildPurchaseStats(AsyncValue<List<PurchaseRequestModel>> purchaseAsync) {
    return purchaseAsync.when(
      data: (purchases) {
        final totalRequests = purchases.length;
        final pendingRequests = purchases.where((p) => p.isPending).length;
        final approvedRequests = purchases.where((p) => p.isApproved).length;
        final totalAmount = purchases.fold<double>(0, (sum, p) => sum + p.totalAmount);

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Total',
                  value: '$totalRequests',
                  icon: Icons.shopping_cart,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Pending',
                  value: '$pendingRequests',
                  icon: Icons.hourglass_empty,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Approved',
                  value: '$approvedRequests',
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Total Value',
                  value: '₹${_formatAmount(totalAmount)}',
                  icon: Icons.account_balance_wallet,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 20),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetsList(List<AssetModel> assets) {
    final filteredAssets = _filterAssets(assets);

    if (filteredAssets.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.devices, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No assets found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Add your first asset using the + button',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredAssets.length,
      itemBuilder: (context, index) {
        final asset = filteredAssets[index];
        return _buildAssetCard(asset);
      },
    );
  }

  Widget _buildAssetCard(AssetModel asset) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _showAssetDetails(asset),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: asset.category.color.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        asset.category.icon,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          asset.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${asset.brand} ${asset.model} • ${asset.assetId}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          asset.location,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) => _handleAssetAction(value, asset),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'view',
                        child: Row(
                          children: [
                            Icon(Icons.visibility, size: 20),
                            SizedBox(width: 8),
                            Text('View Details'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit, size: 20),
                            SizedBox(width: 8),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'maintenance',
                        child: Row(
                          children: [
                            Icon(Icons.build, size: 20),
                            SizedBox(width: 8),
                            Text('Schedule Maintenance'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'transfer',
                        child: Row(
                          children: [
                            Icon(Icons.swap_horiz, size: 20),
                            SizedBox(width: 8),
                            Text('Transfer'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'qr_code',
                        child: Row(
                          children: [
                            Icon(Icons.qr_code, size: 20),
                            SizedBox(width: 8),
                            Text('Generate QR Code'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildAssetInfoChip(
                      Icons.account_balance_wallet,
                      '₹${_formatAmount(asset.currentValue)}',
                      Colors.green,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildAssetInfoChip(
                      Icons.calendar_today,
                      '${asset.ageInYears} years',
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildAssetInfoChip(
                      Icons.star,
                      asset.condition.displayName,
                      asset.condition.color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: asset.status.color.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      asset.status.displayName,
                      style: TextStyle(
                        fontSize: 10,
                        color: asset.status.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (asset.isAssigned) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Assigned to ${asset.assignedToName}',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                  const Spacer(),
                  if (asset.needsMaintenance)
                    const Icon(
                      Icons.warning,
                      color: Colors.red,
                      size: 16,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAssetInfoChip(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInventoryList(List<InventoryItemModel> inventory) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: inventory.length,
      itemBuilder: (context, index) {
        final item = inventory[index];
        return _buildInventoryCard(item);
      },
    );
  }

  Widget _buildInventoryCard(InventoryItemModel item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _showInventoryDetails(item),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _getInventoryStatusColor(item.status).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        item.category.icon,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${item.itemCode} • ${item.category.displayName}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          item.location,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${item.currentStock} ${item.unit}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _getInventoryStatusColor(item.status),
                        ),
                      ),
                      Text(
                        '₹${_formatAmount(item.totalValue)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildInventoryInfoChip(
                      'Min Stock',
                      '${item.minStockLevel}',
                      Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildInventoryInfoChip(
                      'Max Stock',
                      '${item.maxStockLevel}',
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildInventoryInfoChip(
                      'Unit Price',
                      '₹${item.unitPrice.toStringAsFixed(0)}',
                      Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getInventoryStatusColor(item.status).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      item.status.toString().split('.').last.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        color: _getInventoryStatusColor(item.status),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (item.expiryDate != null) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: (item.isExpired ? Colors.red : Colors.blue).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Exp: ${DateFormat('MMM yyyy').format(item.expiryDate!)}',
                        style: TextStyle(
                          fontSize: 10,
                          color: item.isExpired ? Colors.red : Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                  const Spacer(),
                  if (item.isLowStock)
                    const Icon(
                      Icons.warning,
                      color: Colors.orange,
                      size: 16,
                    ),
                  if (item.isOutOfStock)
                    const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 16,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInventoryInfoChip(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMaintenanceList(List<MaintenanceRecordModel> maintenance) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: maintenance.length,
      itemBuilder: (context, index) {
        final record = maintenance[index];
        return _buildMaintenanceCard(record);
      },
    );
  }

  Widget _buildMaintenanceCard(MaintenanceRecordModel record) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getMaintenanceStatusColor(record.status).withValues(alpha: 0.2),
          child: Icon(
            _getMaintenanceIcon(record.type),
            color: _getMaintenanceStatusColor(record.status),
          ),
        ),
        title: Text(
          record.assetName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${record.type.toString().split('.').last.toUpperCase()} Maintenance'),
            Text('Scheduled: ${DateFormat('MMM dd, yyyy').format(record.scheduledDate)}'),
            Text(record.description, maxLines: 1, overflow: TextOverflow.ellipsis),
            if (record.isOverdue)
              Text(
                'Overdue by ${record.daysOverdue} days',
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getMaintenanceStatusColor(record.status).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                record.status.toString().split('.').last.toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: _getMaintenanceStatusColor(record.status),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '₹${record.cost.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        onTap: () => _showMaintenanceDetails(record),
      ),
    );
  }

  Widget _buildPurchaseList(List<PurchaseRequestModel> purchases) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: purchases.length,
      itemBuilder: (context, index) {
        final request = purchases[index];
        return _buildPurchaseCard(request);
      },
    );
  }

  Widget _buildPurchaseCard(PurchaseRequestModel request) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _showPurchaseDetails(request),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _getPurchaseStatusColor(request.status).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.shopping_cart,
                        color: _getPurchaseStatusColor(request.status),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          request.requestNumber,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Requested by ${request.requestedByName}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          request.department,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₹${_formatAmount(request.totalAmount)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getPurchaseStatusColor(request.status).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          request.status.toString().split('.').last.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: _getPurchaseStatusColor(request.status),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                request.justification,
                style: const TextStyle(fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    '${request.itemCount} items',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Required: ${DateFormat('MMM dd, yyyy').format(request.requiredDate)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  if (request.isUrgent)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'URGENT',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<AssetModel> _filterAssets(List<AssetModel> assets) {
    return assets.where((asset) {
      // Category filter
      if (selectedCategory != 'All') {
        if (selectedCategory == 'Computer' && asset.category != AssetCategory.computer) return false;
        if (selectedCategory == 'Electronics' && asset.category != AssetCategory.electronics) return false;
        if (selectedCategory == 'Laboratory' && asset.category != AssetCategory.laboratory) return false;
        if (selectedCategory == 'Furniture' && asset.category != AssetCategory.furniture) return false;
        if (selectedCategory == 'Vehicles' && asset.category != AssetCategory.vehicles) return false;
      }
      
      // Status filter
      if (selectedStatus != 'All') {
        if (selectedStatus == 'Available' && asset.status != AssetStatus.available) return false;
        if (selectedStatus == 'In Use' && asset.status != AssetStatus.in_use) return false;
        if (selectedStatus == 'Maintenance' && asset.status != AssetStatus.maintenance) return false;
        if (selectedStatus == 'Repair' && asset.status != AssetStatus.repair) return false;
        if (selectedStatus == 'Retired' && asset.status != AssetStatus.retired) return false;
      }
      
      return true;
    }).toList();
  }

  String _formatAmount(double amount) {
    if (amount >= 10000000) return '${(amount / 10000000).toStringAsFixed(1)}Cr';
    if (amount >= 100000) return '${(amount / 100000).toStringAsFixed(1)}L';
    if (amount >= 1000) return '${(amount / 1000).toStringAsFixed(1)}K';
    return amount.toStringAsFixed(0);
  }

  Color _getInventoryStatusColor(InventoryStatus status) {
    switch (status) {
      case InventoryStatus.inStock:
        return Colors.green;
      case InventoryStatus.lowStock:
        return Colors.orange;
      case InventoryStatus.outOfStock:
        return Colors.red;
      case InventoryStatus.expired:
        return Colors.red.shade800;
      case InventoryStatus.damaged:
        return Colors.grey;
    }
  }

  Color _getMaintenanceStatusColor(MaintenanceStatus status) {
    switch (status) {
      case MaintenanceStatus.scheduled:
        return Colors.blue;
      case MaintenanceStatus.in_progress:
        return Colors.orange;
      case MaintenanceStatus.completed:
        return Colors.green;
      case MaintenanceStatus.cancelled:
        return Colors.grey;
      case MaintenanceStatus.overdue:
        return Colors.red;
    }
  }

  IconData _getMaintenanceIcon(MaintenanceType type) {
    switch (type) {
      case MaintenanceType.preventive:
        return Icons.schedule;
      case MaintenanceType.corrective:
        return Icons.build;
      case MaintenanceType.emergency:
        return Icons.warning;
      case MaintenanceType.inspection:
        return Icons.search;
      case MaintenanceType.calibration:
        return Icons.tune;
    }
  }

  Color _getPurchaseStatusColor(PurchaseRequestStatus status) {
    switch (status) {
      case PurchaseRequestStatus.pending:
        return Colors.orange;
      case PurchaseRequestStatus.approved:
        return Colors.green;
      case PurchaseRequestStatus.rejected:
        return Colors.red;
      case PurchaseRequestStatus.ordered:
        return Colors.blue;
      case PurchaseRequestStatus.received:
        return Colors.purple;
    }
  }

  void _handleAssetAction(String action, AssetModel asset) {
    switch (action) {
      case 'view':
        _showAssetDetails(asset);
        break;
      case 'edit':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Edit asset feature coming soon!')),
        );
        break;
      case 'maintenance':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Schedule maintenance for ${asset.name} coming soon!')),
        );
        break;
      case 'transfer':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Transfer ${asset.name} coming soon!')),
        );
        break;
      case 'qr_code':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('QR code for ${asset.name} generated!')),
        );
        break;
    }
  }

  void _showAssetDetails(AssetModel asset) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Text(asset.category.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 8),
            Expanded(child: Text(asset.name)),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Asset ID', asset.assetId),
              _buildDetailRow('Category', asset.category.displayName),
              _buildDetailRow('Brand', asset.brand),
              _buildDetailRow('Model', asset.model),
              _buildDetailRow('Serial Number', asset.serialNumber),
              _buildDetailRow('Purchase Price', '₹${asset.purchasePrice}'),
              _buildDetailRow('Current Value', '₹${asset.currentValue}'),
              _buildDetailRow('Purchase Date', DateFormat('MMM dd, yyyy').format(asset.purchaseDate)),
              _buildDetailRow('Age', '${asset.ageInYears} years'),
              _buildDetailRow('Condition', asset.condition.displayName),
              _buildDetailRow('Status', asset.status.displayName),
              _buildDetailRow('Location', asset.location),
              _buildDetailRow('Department', asset.department),
              if (asset.isAssigned) ...[
                _buildDetailRow('Assigned To', asset.assignedToName!),
                _buildDetailRow('Assigned Date', DateFormat('MMM dd, yyyy').format(asset.assignedDate!)),
              ],
              if (asset.warrantyExpiry != null)
                _buildDetailRow('Warranty Expiry', DateFormat('MMM dd, yyyy').format(asset.warrantyExpiry!)),
              if (asset.nextMaintenanceDate != null)
                _buildDetailRow('Next Maintenance', DateFormat('MMM dd, yyyy').format(asset.nextMaintenanceDate!)),
              _buildDetailRow('Supplier', asset.supplier),
              if (asset.notes != null)
                _buildDetailRow('Notes', asset.notes!),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showInventoryDetails(InventoryItemModel item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Inventory details for ${item.name} coming soon!')),
    );
  }

  void _showMaintenanceDetails(MaintenanceRecordModel record) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Maintenance details for ${record.assetName} coming soon!')),
    );
  }

  void _showPurchaseDetails(PurchaseRequestModel request) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Purchase request details for ${request.requestNumber} coming soon!')),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  void _showAddAssetDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add asset feature coming soon!')),
    );
  }

  void _showAddInventoryDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add inventory item feature coming soon!')),
    );
  }

  void _showScheduleMaintenanceDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Schedule maintenance feature coming soon!')),
    );
  }

  void _showCreatePurchaseRequestDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Create purchase request feature coming soon!')),
    );
  }

  void _scanAssetCode() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Asset QR code scanner coming soon!')),
    );
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'asset_report':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Asset report feature coming soon!')),
        );
        break;
      case 'stock_report':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Stock report feature coming soon!')),
        );
        break;
      case 'maintenance_schedule':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Maintenance schedule feature coming soon!')),
        );
        break;
      case 'depreciation_report':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Depreciation report feature coming soon!')),
        );
        break;
    }
  }
}