import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/hostel_model.dart';

// Sample data providers
final hostelsProvider = FutureProvider<List<HostelModel>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  
  return [
    HostelModel(
      id: '1',
      name: 'Sunrise Boys Hostel',
      description: 'Modern hostel facility for boys with all amenities',
      hostelType: HostelType.boys,
      address: '123 Campus Road, Education City',
      contactNumber: '9876543210',
      wardenName: 'Mr. Rajesh Kumar',
      wardenContact: '9876543211',
      totalRooms: 50,
      totalBeds: 100,
      occupiedBeds: 85,
      monthlyFee: 8000.0,
      facilities: ['WiFi', 'AC', 'Mess', 'Laundry', 'Study Hall', 'Games Room'],
      status: HostelStatus.active,
      createdAt: DateTime.now().subtract(const Duration(days: 365)),
      createdBy: 'Admin',
    ),
    HostelModel(
      id: '2',
      name: 'Moonlight Girls Hostel',
      description: 'Safe and secure accommodation for girls',
      hostelType: HostelType.girls,
      address: '456 Campus Avenue, Education City',
      contactNumber: '9876543212',
      wardenName: 'Mrs. Priya Sharma',
      wardenContact: '9876543213',
      totalRooms: 40,
      totalBeds: 80,
      occupiedBeds: 70,
      monthlyFee: 8500.0,
      facilities: ['WiFi', 'AC', 'Mess', 'Laundry', 'Study Hall', 'Security'],
      status: HostelStatus.active,
      createdAt: DateTime.now().subtract(const Duration(days: 300)),
      createdBy: 'Admin',
    ),
    HostelModel(
      id: '3',
      name: 'Faculty Quarters',
      description: 'Residential facility for teaching staff',
      hostelType: HostelType.staff,
      address: '789 Faculty Lane, Education City',
      contactNumber: '9876543214',
      wardenName: 'Mr. Suresh Patel',
      wardenContact: '9876543215',
      totalRooms: 20,
      totalBeds: 40,
      occupiedBeds: 35,
      monthlyFee: 12000.0,
      facilities: ['WiFi', 'AC', 'Kitchen', 'Parking', 'Garden'],
      status: HostelStatus.active,
      createdAt: DateTime.now().subtract(const Duration(days: 200)),
      createdBy: 'Admin',
    ),
  ];
});

final hostelAllocationsProvider = FutureProvider<List<HostelAllocationModel>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 800));
  
  return [
    HostelAllocationModel(
      id: '1',
      studentId: 'student1',
      studentName: 'John Doe',
      hostelId: '1',
      hostelName: 'Sunrise Boys Hostel',
      roomId: 'room101',
      roomNumber: '101',
      allocationDate: DateTime.now().subtract(const Duration(days: 120)),
      status: AllocationStatus.active,
      monthlyFee: 8000.0,
      securityDeposit: 5000.0,
      guardianName: 'Mr. Robert Doe',
      guardianContact: '9876543220',
      emergencyContact: '9876543221',
      createdAt: DateTime.now().subtract(const Duration(days: 120)),
      createdBy: 'Admin',
    ),
    HostelAllocationModel(
      id: '2',
      studentId: 'student2',
      studentName: 'Jane Smith',
      hostelId: '2',
      hostelName: 'Moonlight Girls Hostel',
      roomId: 'room201',
      roomNumber: '201',
      allocationDate: DateTime.now().subtract(const Duration(days: 90)),
      status: AllocationStatus.active,
      monthlyFee: 8500.0,
      securityDeposit: 5000.0,
      guardianName: 'Mrs. Mary Smith',
      guardianContact: '9876543222',
      emergencyContact: '9876543223',
      medicalInfo: 'No known allergies',
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
      createdBy: 'Admin',
    ),
  ];
});

final transportRoutesProvider = FutureProvider<List<TransportRouteModel>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 600));
  
  return [
    TransportRouteModel(
      id: '1',
      routeName: 'City Center Route',
      routeNumber: 'R001',
      stops: [
        TransportStopModel(
          id: 'stop1',
          stopName: 'Central Mall',
          address: 'Central Mall, Main Road',
          arrivalTime: '07:30',
          stopOrder: 1,
          distanceFromSchool: 5.2,
        ),
        TransportStopModel(
          id: 'stop2',
          stopName: 'Park Avenue',
          address: 'Park Avenue Junction',
          arrivalTime: '07:45',
          stopOrder: 2,
          distanceFromSchool: 3.8,
        ),
      ],
      driverId: 'driver1',
      driverName: 'Ramesh Kumar',
      driverContact: '9876543230',
      vehicleId: 'bus001',
      vehicleNumber: 'KA-01-AB-1234',
      vehicleType: VehicleType.bus,
      capacity: 50,
      currentOccupancy: 42,
      monthlyFee: 1500.0,
      startTime: '07:00',
      endTime: '08:00',
      status: RouteStatus.active,
      createdAt: DateTime.now().subtract(const Duration(days: 180)),
      createdBy: 'Admin',
    ),
    TransportRouteModel(
      id: '2',
      routeName: 'Suburb Route',
      routeNumber: 'R002',
      stops: [
        TransportStopModel(
          id: 'stop3',
          stopName: 'Green Valley',
          address: 'Green Valley Colony',
          arrivalTime: '07:15',
          stopOrder: 1,
          distanceFromSchool: 8.5,
        ),
      ],
      driverId: 'driver2',
      driverName: 'Suresh Singh',
      driverContact: '9876543231',
      vehicleId: 'van001',
      vehicleNumber: 'KA-01-CD-5678',
      vehicleType: VehicleType.van,
      capacity: 12,
      currentOccupancy: 8,
      monthlyFee: 2000.0,
      startTime: '07:00',
      endTime: '07:45',
      status: RouteStatus.active,
      createdAt: DateTime.now().subtract(const Duration(days: 150)),
      createdBy: 'Admin',
    ),
  ];
});

@RoutePage()
class HostelManagementPage extends ConsumerStatefulWidget {
  const HostelManagementPage({super.key});

  @override
  ConsumerState<HostelManagementPage> createState() => _HostelManagementPageState();
}

class _HostelManagementPageState extends ConsumerState<HostelManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedHostelType = 'All';
  String selectedStatus = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hostelsAsync = ref.watch(hostelsProvider);
    final allocationsAsync = ref.watch(hostelAllocationsProvider);
    final routesAsync = ref.watch(transportRoutesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hostel & Transport'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Hostels'),
            Tab(icon: Icon(Icons.people), text: 'Allocations'),
            Tab(icon: Icon(Icons.directions_bus), text: 'Transport'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: _showRouteMap,
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'occupancy_report',
                child: Row(
                  children: [
                    Icon(Icons.assessment, size: 20),
                    SizedBox(width: 8),
                    Text('Occupancy Report'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'fee_collection',
                child: Row(
                  children: [
                    Icon(Icons.account_balance_wallet, size: 20),
                    SizedBox(width: 8),
                    Text('Fee Collection'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'maintenance_schedule',
                child: Row(
                  children: [
                    Icon(Icons.build, size: 20),
                    SizedBox(width: 8),
                    Text('Maintenance'),
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
          _buildHostelsTab(hostelsAsync),
          _buildAllocationsTab(allocationsAsync),
          _buildTransportTab(routesAsync),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildFloatingActionButton() {
    switch (_tabController.index) {
      case 0:
        return FloatingActionButton.extended(
          onPressed: _showAddHostelDialog,
          icon: const Icon(Icons.add),
          label: const Text('Add Hostel'),
        );
      case 1:
        return FloatingActionButton.extended(
          onPressed: _showAllocateRoomDialog,
          icon: const Icon(Icons.person_add),
          label: const Text('Allocate Room'),
        );
      case 2:
        return FloatingActionButton.extended(
          onPressed: _showAddRouteDialog,
          icon: const Icon(Icons.add_road),
          label: const Text('Add Route'),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildHostelsTab(AsyncValue<List<HostelModel>> hostelsAsync) {
    return Column(
      children: [
        _buildHostelFilters(),
        _buildHostelStats(hostelsAsync),
        Expanded(
          child: hostelsAsync.when(
            data: (hostels) => _buildHostelsList(hostels),
            loading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading hostels...'),
                ],
              ),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading hostels: ${error.toString()}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.refresh(hostelsProvider),
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

  Widget _buildAllocationsTab(AsyncValue<List<HostelAllocationModel>> allocationsAsync) {
    return allocationsAsync.when(
      data: (allocations) => _buildAllocationsList(allocations),
      loading: () => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading allocations...'),
          ],
        ),
      ),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error loading allocations: ${error.toString()}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref.refresh(hostelAllocationsProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransportTab(AsyncValue<List<TransportRouteModel>> routesAsync) {
    return routesAsync.when(
      data: (routes) => _buildTransportList(routes),
      loading: () => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading transport routes...'),
          ],
        ),
      ),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error loading routes: ${error.toString()}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref.refresh(transportRoutesProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHostelFilters() {
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
                    value: selectedHostelType,
                    decoration: const InputDecoration(
                      labelText: 'Hostel Type',
                      border: OutlineInputBorder(),
                    ),
                    items: ['All', 'Boys Hostel', 'Girls Hostel', 'Mixed Hostel', 'Staff Quarters']
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedHostelType = value!;
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
                    items: ['All', 'Active', 'Inactive', 'Maintenance', 'Full']
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

  Widget _buildHostelStats(AsyncValue<List<HostelModel>> hostelsAsync) {
    return hostelsAsync.when(
      data: (hostels) {
        final totalBeds = hostels.fold<int>(0, (sum, hostel) => sum + hostel.totalBeds);
        final occupiedBeds = hostels.fold<int>(0, (sum, hostel) => sum + hostel.occupiedBeds);
        final availableBeds = totalBeds - occupiedBeds;
        final occupancyRate = totalBeds > 0 ? (occupiedBeds / totalBeds * 100) : 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Total Beds',
                  value: '$totalBeds',
                  icon: Icons.bed,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Occupied',
                  value: '$occupiedBeds',
                  icon: Icons.person,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Available',
                  value: '$availableBeds',
                  icon: Icons.bed_outlined,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Occupancy',
                  value: '${occupancyRate.toStringAsFixed(1)}%',
                  icon: Icons.pie_chart,
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

  Widget _buildHostelsList(List<HostelModel> hostels) {
    final filteredHostels = _filterHostels(hostels);

    if (filteredHostels.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No hostels found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Add your first hostel using the + button',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredHostels.length,
      itemBuilder: (context, index) {
        final hostel = filteredHostels[index];
        return _buildHostelCard(hostel);
      },
    );
  }

  Widget _buildHostelCard(HostelModel hostel) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _showHostelDetails(hostel),
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
                      color: hostel.hostelType.color.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        hostel.hostelType.icon,
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
                          hostel.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          hostel.hostelType.displayName,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Warden: ${hostel.wardenName}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) => _handleHostelAction(value, hostel),
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
                        value: 'rooms',
                        child: Row(
                          children: [
                            Icon(Icons.room, size: 20),
                            SizedBox(width: 8),
                            Text('Manage Rooms'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'allocations',
                        child: Row(
                          children: [
                            Icon(Icons.people, size: 20),
                            SizedBox(width: 8),
                            Text('View Allocations'),
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
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildHostelInfoChip(
                      Icons.bed,
                      '${hostel.occupiedBeds}/${hostel.totalBeds} Beds',
                      hostel.hasVacancy ? Colors.green : Colors.red,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildHostelInfoChip(
                      Icons.room,
                      '${hostel.totalRooms} Rooms',
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildHostelInfoChip(
                      Icons.currency_rupee,
                      '₹${hostel.monthlyFee.toStringAsFixed(0)}/month',
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
                      color: _getHostelStatusColor(hostel.status).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      hostel.status.toString().split('.').last.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        color: _getHostelStatusColor(hostel.status),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${hostel.occupancyRate.toStringAsFixed(1)}% Occupancy',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              if (hostel.facilities.isNotEmpty) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: hostel.facilities.take(4).map((facility) =>
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        facility,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ).toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHostelInfoChip(IconData icon, String text, Color color) {
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

  Widget _buildAllocationsList(List<HostelAllocationModel> allocations) {
    return Column(
      children: [
        _buildAllocationsStats(allocations),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: allocations.length,
            itemBuilder: (context, index) {
              final allocation = allocations[index];
              return _buildAllocationCard(allocation);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAllocationsStats(List<HostelAllocationModel> allocations) {
    final activeAllocations = allocations.where((a) => a.isActive).length;
    final totalDeposit = allocations.fold<double>(0, (sum, a) => sum + a.securityDeposit);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              title: 'Active',
              value: '$activeAllocations',
              icon: Icons.people,
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              title: 'Total',
              value: '${allocations.length}',
              icon: Icons.assignment,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              title: 'Deposits',
              value: '₹${totalDeposit.toStringAsFixed(0)}',
              icon: Icons.account_balance_wallet,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllocationCard(HostelAllocationModel allocation) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getAllocationStatusColor(allocation.status).withValues(alpha: 0.2),
          child: Text(
            allocation.studentName[0],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _getAllocationStatusColor(allocation.status),
            ),
          ),
        ),
        title: Text(
          allocation.studentName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${allocation.hostelName} - Room ${allocation.roomNumber}'),
            Text('Allocated: ${DateFormat('MMM dd, yyyy').format(allocation.allocationDate)}'),
            Text('Fee: ₹${allocation.monthlyFee.toStringAsFixed(0)}/month'),
            if (allocation.guardianContact != null)
              Text('Guardian: ${allocation.guardianContact}'),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getAllocationStatusColor(allocation.status).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                allocation.status.toString().split('.').last.toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: _getAllocationStatusColor(allocation.status),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${allocation.stayDuration} days',
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        onTap: () => _showAllocationDetails(allocation),
      ),
    );
  }

  Widget _buildTransportList(List<TransportRouteModel> routes) {
    return Column(
      children: [
        _buildTransportStats(routes),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: routes.length,
            itemBuilder: (context, index) {
              final route = routes[index];
              return _buildTransportCard(route);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTransportStats(List<TransportRouteModel> routes) {
    final totalCapacity = routes.fold<int>(0, (sum, route) => sum + route.capacity);
    final totalOccupancy = routes.fold<int>(0, (sum, route) => sum + route.currentOccupancy);
    final availableSeats = totalCapacity - totalOccupancy;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              title: 'Routes',
              value: '${routes.length}',
              icon: Icons.route,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              title: 'Capacity',
              value: '$totalCapacity',
              icon: Icons.airline_seat_recline_normal,
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              title: 'Occupied',
              value: '$totalOccupancy',
              icon: Icons.people,
              color: Colors.orange,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              title: 'Available',
              value: '$availableSeats',
              icon: Icons.event_seat,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransportCard(TransportRouteModel route) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _showRouteDetails(route),
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
                      color: Colors.blue.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        route.vehicleType.icon,
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
                          route.routeName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Route ${route.routeNumber} • ${route.vehicleType.displayName}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Driver: ${route.driverName}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) => _handleRouteAction(value, route),
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
                        value: 'track',
                        child: Row(
                          children: [
                            Icon(Icons.location_on, size: 20),
                            SizedBox(width: 8),
                            Text('Track Vehicle'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'students',
                        child: Row(
                          children: [
                            Icon(Icons.people, size: 20),
                            SizedBox(width: 8),
                            Text('View Students'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit, size: 20),
                            SizedBox(width: 8),
                            Text('Edit Route'),
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
                    child: _buildHostelInfoChip(
                      Icons.people,
                      '${route.currentOccupancy}/${route.capacity} Seats',
                      route.hasVacancy ? Colors.green : Colors.red,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildHostelInfoChip(
                      Icons.schedule,
                      '${route.startTime} - ${route.endTime}',
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildHostelInfoChip(
                      Icons.currency_rupee,
                      '₹${route.monthlyFee.toStringAsFixed(0)}/month',
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
                      color: _getRouteStatusColor(route.status).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      route.status.toString().split('.').last.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        color: _getRouteStatusColor(route.status),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Vehicle: ${route.vehicleNumber}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Stops: ${route.stops.map((s) => s.stopName).join(' → ')}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<HostelModel> _filterHostels(List<HostelModel> hostels) {
    return hostels.where((hostel) {
      // Type filter
      if (selectedHostelType != 'All') {
        if (selectedHostelType == 'Boys Hostel' && hostel.hostelType != HostelType.boys) return false;
        if (selectedHostelType == 'Girls Hostel' && hostel.hostelType != HostelType.girls) return false;
        if (selectedHostelType == 'Mixed Hostel' && hostel.hostelType != HostelType.mixed) return false;
        if (selectedHostelType == 'Staff Quarters' && hostel.hostelType != HostelType.staff) return false;
      }
      
      // Status filter
      if (selectedStatus != 'All') {
        final statusMatch = selectedStatus.toLowerCase() == hostel.status.toString().split('.').last;
        if (!statusMatch) return false;
      }
      
      return true;
    }).toList();
  }

  Color _getHostelStatusColor(HostelStatus status) {
    switch (status) {
      case HostelStatus.active:
        return Colors.green;
      case HostelStatus.inactive:
        return Colors.grey;
      case HostelStatus.maintenance:
        return Colors.orange;
      case HostelStatus.full:
        return Colors.red;
    }
  }

  Color _getAllocationStatusColor(AllocationStatus status) {
    switch (status) {
      case AllocationStatus.active:
        return Colors.green;
      case AllocationStatus.inactive:
        return Colors.grey;
      case AllocationStatus.terminated:
        return Colors.red;
      case AllocationStatus.suspended:
        return Colors.orange;
    }
  }

  Color _getRouteStatusColor(RouteStatus status) {
    switch (status) {
      case RouteStatus.active:
        return Colors.green;
      case RouteStatus.inactive:
        return Colors.grey;
      case RouteStatus.suspended:
        return Colors.orange;
      case RouteStatus.maintenance:
        return Colors.red;
    }
  }

  void _handleHostelAction(String action, HostelModel hostel) {
    switch (action) {
      case 'view':
        _showHostelDetails(hostel);
        break;
      case 'rooms':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Room management for ${hostel.name} coming soon!')),
        );
        break;
      case 'allocations':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Allocations for ${hostel.name} coming soon!')),
        );
        break;
      case 'edit':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Edit hostel feature coming soon!')),
        );
        break;
    }
  }

  void _handleRouteAction(String action, TransportRouteModel route) {
    switch (action) {
      case 'view':
        _showRouteDetails(route);
        break;
      case 'track':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tracking ${route.vehicleNumber} coming soon!')),
        );
        break;
      case 'students':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Students on ${route.routeName} coming soon!')),
        );
        break;
      case 'edit':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Edit route feature coming soon!')),
        );
        break;
    }
  }

  void _showHostelDetails(HostelModel hostel) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Text(hostel.hostelType.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 8),
            Expanded(child: Text(hostel.name)),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Type', hostel.hostelType.displayName),
              _buildDetailRow('Address', hostel.address),
              _buildDetailRow('Contact', hostel.contactNumber),
              _buildDetailRow('Warden', hostel.wardenName),
              _buildDetailRow('Warden Contact', hostel.wardenContact),
              _buildDetailRow('Total Rooms', '${hostel.totalRooms}'),
              _buildDetailRow('Total Beds', '${hostel.totalBeds}'),
              _buildDetailRow('Occupied Beds', '${hostel.occupiedBeds}'),
              _buildDetailRow('Available Beds', '${hostel.availableBeds}'),
              _buildDetailRow('Monthly Fee', '₹${hostel.monthlyFee}'),
              _buildDetailRow('Occupancy Rate', '${hostel.occupancyRate.toStringAsFixed(1)}%'),
              if (hostel.facilities.isNotEmpty)
                _buildDetailRow('Facilities', hostel.facilities.join(', ')),
              _buildDetailRow('Description', hostel.description),
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

  void _showRouteDetails(TransportRouteModel route) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Text(route.vehicleType.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 8),
            Expanded(child: Text(route.routeName)),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Route Number', route.routeNumber),
              _buildDetailRow('Vehicle Type', route.vehicleType.displayName),
              _buildDetailRow('Vehicle Number', route.vehicleNumber),
              _buildDetailRow('Driver', route.driverName),
              _buildDetailRow('Driver Contact', route.driverContact),
              _buildDetailRow('Capacity', '${route.capacity} seats'),
              _buildDetailRow('Occupied', '${route.currentOccupancy} seats'),
              _buildDetailRow('Available', '${route.availableSeats} seats'),
              _buildDetailRow('Monthly Fee', '₹${route.monthlyFee}'),
              _buildDetailRow('Timing', '${route.startTime} - ${route.endTime}'),
              _buildDetailRow('Status', route.status.toString().split('.').last),
              if (route.stops.isNotEmpty) ...[
                const SizedBox(height: 12),
                const Text(
                  'Stops:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...route.stops.map((stop) => Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4),
                  child: Text(
                    '${stop.stopOrder}. ${stop.stopName} (${stop.arrivalTime})',
                    style: const TextStyle(fontSize: 14),
                  ),
                )),
              ],
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

  void _showAllocationDetails(HostelAllocationModel allocation) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Allocation details for ${allocation.studentName} coming soon!')),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
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

  void _showAddHostelDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add hostel feature coming soon!')),
    );
  }

  void _showAllocateRoomDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Room allocation feature coming soon!')),
    );
  }

  void _showAddRouteDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add transport route feature coming soon!')),
    );
  }

  void _showRouteMap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Route map feature coming soon!')),
    );
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'occupancy_report':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Occupancy report feature coming soon!')),
        );
        break;
      case 'fee_collection':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Fee collection feature coming soon!')),
        );
        break;
      case 'maintenance_schedule':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Maintenance schedule feature coming soon!')),
        );
        break;
    }
  }
}