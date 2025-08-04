import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/library_model.dart';

// Sample data providers
final booksProvider = FutureProvider<List<BookModel>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  
  return [
    BookModel(
      id: '1',
      title: 'Advanced Mathematics for Class 10',
      author: 'Dr. R.K. Sharma',
      isbn: '978-81-259-2345-7',
      publisher: 'Oxford University Press',
      publicationDate: DateTime(2022, 1, 15),
      category: BookCategory.textbook,
      subject: 'Mathematics',
      language: 'English',
      totalCopies: 25,
      availableCopies: 18,
      price: 450.0,
      description: 'Comprehensive mathematics textbook covering CBSE syllabus',
      location: 'Section A, Shelf 12',
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
      createdBy: 'Librarian',
    ),
    BookModel(
      id: '2',
      title: 'Physics Fundamentals',
      author: 'Prof. A.K. Singh',
      isbn: '978-81-259-3456-8',
      publisher: 'McGraw Hill',
      publicationDate: DateTime(2023, 3, 20),
      category: BookCategory.textbook,
      subject: 'Physics',
      language: 'English',
      totalCopies: 20,
      availableCopies: 15,
      price: 520.0,
      location: 'Section B, Shelf 5',
      createdAt: DateTime.now().subtract(const Duration(days: 60)),
      createdBy: 'Librarian',
    ),
    BookModel(
      id: '3',
      title: 'Harry Potter and the Philosopher\'s Stone',
      author: 'J.K. Rowling',
      isbn: '978-0-7475-3269-9',
      publisher: 'Bloomsbury',
      publicationDate: DateTime(1997, 6, 26),
      category: BookCategory.fiction,
      subject: 'Literature',
      language: 'English',
      totalCopies: 8,
      availableCopies: 3,
      price: 399.0,
      description: 'Popular fantasy novel for young readers',
      location: 'Section F, Shelf 3',
      createdAt: DateTime.now().subtract(const Duration(days: 120)),
      createdBy: 'Librarian',
    ),
    BookModel(
      id: '4',
      title: 'Oxford Dictionary of English',
      author: 'Oxford University Press',
      isbn: '978-0-19-957112-3',
      publisher: 'Oxford University Press',
      publicationDate: DateTime(2021, 8, 10),
      category: BookCategory.reference,
      subject: 'English',
      language: 'English',
      totalCopies: 5,
      availableCopies: 5,
      price: 1200.0,
      description: 'Comprehensive English dictionary',
      location: 'Reference Section, Shelf 1',
      status: BookStatus.available,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      createdBy: 'Librarian',
    ),
  ];
});

final borrowRecordsProvider = FutureProvider<List<BookBorrowModel>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 800));
  
  return [
    BookBorrowModel(
      id: '1',
      bookId: '1',
      bookTitle: 'Advanced Mathematics for Class 10',
      borrowerId: 'student1',
      borrowerName: 'John Doe',
      borrowerType: BorrowerType.student,
      borrowDate: DateTime.now().subtract(const Duration(days: 10)),
      dueDate: DateTime.now().add(const Duration(days: 4)),
      status: BorrowStatus.active,
      issuedBy: 'Librarian',
      renewalCount: 0,
    ),
    BookBorrowModel(
      id: '2',
      bookId: '3',
      bookTitle: 'Harry Potter and the Philosopher\'s Stone',
      borrowerId: 'student2',
      borrowerName: 'Jane Smith',
      borrowerType: BorrowerType.student,
      borrowDate: DateTime.now().subtract(const Duration(days: 20)),
      dueDate: DateTime.now().subtract(const Duration(days: 6)),
      status: BorrowStatus.overdue,
      issuedBy: 'Librarian',
      renewalCount: 1,
      fineAmount: 30.0,
      finePaid: false,
    ),
    BookBorrowModel(
      id: '3',
      bookId: '2',
      bookTitle: 'Physics Fundamentals',
      borrowerId: 'teacher1',
      borrowerName: 'Dr. Sarah Johnson',
      borrowerType: BorrowerType.teacher,
      borrowDate: DateTime.now().subtract(const Duration(days: 15)),
      dueDate: DateTime.now().subtract(const Duration(days: 1)),
      returnDate: DateTime.now().subtract(const Duration(days: 2)),
      status: BorrowStatus.returned,
      issuedBy: 'Librarian',
      returnedTo: 'Assistant Librarian',
      renewalCount: 0,
    ),
  ];
});

final libraryMembersProvider = FutureProvider<List<LibraryMemberModel>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 600));
  
  return [
    LibraryMemberModel(
      id: '1',
      memberId: 'LIB001',
      name: 'John Doe',
      email: 'john.doe@school.edu',
      phoneNumber: '9876543210',
      memberType: MemberType.student,
      classId: 'class10a',
      className: 'Class 10-A',
      joinDate: DateTime.now().subtract(const Duration(days: 365)),
      expiryDate: DateTime.now().add(const Duration(days: 365)),
      status: MemberStatus.active,
      maxBooksAllowed: 3,
      currentBooksCount: 2,
      totalFinesDue: 0.0,
    ),
    LibraryMemberModel(
      id: '2',
      memberId: 'LIB002',
      name: 'Jane Smith',
      email: 'jane.smith@school.edu',
      phoneNumber: '9876543211',
      memberType: MemberType.student,
      classId: 'class10a',
      className: 'Class 10-A',
      joinDate: DateTime.now().subtract(const Duration(days: 300)),
      expiryDate: DateTime.now().add(const Duration(days: 365)),
      status: MemberStatus.active,
      maxBooksAllowed: 3,
      currentBooksCount: 1,
      totalFinesDue: 30.0,
    ),
    LibraryMemberModel(
      id: '3',
      memberId: 'LIB003',
      name: 'Dr. Sarah Johnson',
      email: 'sarah.johnson@school.edu',
      phoneNumber: '9876543212',
      memberType: MemberType.faculty,
      department: 'Mathematics',
      joinDate: DateTime.now().subtract(const Duration(days: 1000)),
      status: MemberStatus.active,
      maxBooksAllowed: 10,
      currentBooksCount: 3,
      totalFinesDue: 0.0,
    ),
  ];
});

@RoutePage()
class LibraryManagementPage extends ConsumerStatefulWidget {
  const LibraryManagementPage({super.key});

  @override
  ConsumerState<LibraryManagementPage> createState() => _LibraryManagementPageState();
}

class _LibraryManagementPageState extends ConsumerState<LibraryManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedCategory = 'All';
  String selectedStatus = 'All';
  String selectedMemberType = 'All';

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
    final booksAsync = ref.watch(booksProvider);
    final borrowsAsync = ref.watch(borrowRecordsProvider);
    final membersAsync = ref.watch(libraryMembersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Library Management'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.library_books), text: 'Books'),
            Tab(icon: Icon(Icons.assignment_return), text: 'Borrow/Return'),
            Tab(icon: Icon(Icons.people), text: 'Members'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: _scanBook,
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'catalog_report',
                child: Row(
                  children: [
                    Icon(Icons.library_books, size: 20),
                    SizedBox(width: 8),
                    Text('Catalog Report'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'overdue_report',
                child: Row(
                  children: [
                    Icon(Icons.warning, size: 20),
                    SizedBox(width: 8),
                    Text('Overdue Report'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'fine_collection',
                child: Row(
                  children: [
                    Icon(Icons.account_balance_wallet, size: 20),
                    SizedBox(width: 8),
                    Text('Fine Collection'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'import_books',
                child: Row(
                  children: [
                    Icon(Icons.upload_file, size: 20),
                    SizedBox(width: 8),
                    Text('Import Books'),
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
          _buildBooksTab(booksAsync),
          _buildBorrowReturnTab(borrowsAsync),
          _buildMembersTab(membersAsync),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildFloatingActionButton() {
    switch (_tabController.index) {
      case 0:
        return FloatingActionButton.extended(
          onPressed: _showAddBookDialog,
          icon: const Icon(Icons.add),
          label: const Text('Add Book'),
        );
      case 1:
        return FloatingActionButton.extended(
          onPressed: _showIssueBookDialog,
          icon: const Icon(Icons.assignment_return),
          label: const Text('Issue Book'),
        );
      case 2:
        return FloatingActionButton.extended(
          onPressed: _showAddMemberDialog,
          icon: const Icon(Icons.person_add),
          label: const Text('Add Member'),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildBooksTab(AsyncValue<List<BookModel>> booksAsync) {
    return Column(
      children: [
        _buildBookFilters(),
        _buildBooksStats(booksAsync),
        Expanded(
          child: booksAsync.when(
            data: (books) => _buildBooksList(books),
            loading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading books...'),
                ],
              ),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading books: ${error.toString()}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.refresh(booksProvider),
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

  Widget _buildBorrowReturnTab(AsyncValue<List<BookBorrowModel>> borrowsAsync) {
    return borrowsAsync.when(
      data: (borrows) => _buildBorrowsList(borrows),
      loading: () => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading borrow records...'),
          ],
        ),
      ),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error loading records: ${error.toString()}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref.refresh(borrowRecordsProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMembersTab(AsyncValue<List<LibraryMemberModel>> membersAsync) {
    return Column(
      children: [
        _buildMemberFilters(),
        Expanded(
          child: membersAsync.when(
            data: (members) => _buildMembersList(members),
            loading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading members...'),
                ],
              ),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading members: ${error.toString()}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.refresh(libraryMembersProvider),
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

  Widget _buildBookFilters() {
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
                    items: ['All', 'Textbook', 'Reference', 'Fiction', 'Non-Fiction']
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
                    items: ['All', 'Available', 'Borrowed', 'Reserved', 'Maintenance']
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

  Widget _buildMemberFilters() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Member Filters',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedMemberType,
              decoration: const InputDecoration(
                labelText: 'Member Type',
                border: OutlineInputBorder(),
              ),
              items: ['All', 'Student', 'Faculty', 'Staff', 'Guest']
                  .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedMemberType = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBooksStats(AsyncValue<List<BookModel>> booksAsync) {
    return booksAsync.when(
      data: (books) {
        final totalBooks = books.fold<int>(0, (sum, book) => sum + book.totalCopies);
        final availableBooks = books.fold<int>(0, (sum, book) => sum + book.availableCopies);
        final borrowedBooks = totalBooks - availableBooks;
        final categories = books.map((book) => book.category).toSet().length;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Total',
                  value: '$totalBooks',
                  icon: Icons.library_books,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Available',
                  value: '$availableBooks',
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Borrowed',
                  value: '$borrowedBooks',
                  icon: Icons.assignment_return,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Categories',
                  value: '$categories',
                  icon: Icons.category,
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

  Widget _buildBooksList(List<BookModel> books) {
    final filteredBooks = _filterBooks(books);

    if (filteredBooks.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.library_books, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No books found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Add your first book using the + button',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredBooks.length,
      itemBuilder: (context, index) {
        final book = filteredBooks[index];
        return _buildBookCard(book);
      },
    );
  }

  Widget _buildBookCard(BookModel book) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _showBookDetails(book),
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
                    height: 60,
                    decoration: BoxDecoration(
                      color: book.category.color.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        book.category.icon,
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
                          book.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'by ${book.author}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${book.publisher} • ${book.subject}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) => _handleBookAction(value, book),
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
                      if (book.isAvailable)
                        const PopupMenuItem(
                          value: 'issue',
                          child: Row(
                            children: [
                              Icon(Icons.assignment_return, size: 20),
                              SizedBox(width: 8),
                              Text('Issue Book'),
                            ],
                          ),
                        ),
                      const PopupMenuItem(
                        value: 'history',
                        child: Row(
                          children: [
                            Icon(Icons.history, size: 20),
                            SizedBox(width: 8),
                            Text('Borrow History'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildBookInfoChip(
                      Icons.inventory,
                      '${book.availableCopies}/${book.totalCopies} Available',
                      book.isAvailable ? Colors.green : Colors.red,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildBookInfoChip(
                      Icons.category,
                      book.category.displayName,
                      book.category.color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: book.status.color.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      book.status.displayName,
                      style: TextStyle(
                        fontSize: 10,
                        color: book.status.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '₹${book.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
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

  Widget _buildBookInfoChip(String text, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.info_outline, size: 14, color: color),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              label,
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

  Widget _buildBorrowsList(List<BookBorrowModel> borrows) {
    return Column(
      children: [
        _buildBorrowsStats(borrows),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: borrows.length,
            itemBuilder: (context, index) {
              final borrow = borrows[index];
              return _buildBorrowCard(borrow);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBorrowsStats(List<BookBorrowModel> borrows) {
    final activeBooks = borrows.where((b) => b.status == BorrowStatus.active).length;
    final overdueBooks = borrows.where((b) => b.status == BorrowStatus.overdue).length;
    final totalFines = borrows.fold<double>(0, (sum, b) => sum + (b.fineAmount ?? 0));

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              title: 'Active',
              value: '$activeBooks',
              icon: Icons.assignment_return,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              title: 'Overdue',
              value: '$overdueBooks',
              icon: Icons.warning,
              color: Colors.red,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              title: 'Total Fines',
              value: '₹${totalFines.toStringAsFixed(0)}',
              icon: Icons.account_balance_wallet,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBorrowCard(BookBorrowModel borrow) {
    final statusColor = _getBorrowStatusColor(borrow.status);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: statusColor.withValues(alpha: 0.2),
          child: Icon(
            borrow.status == BorrowStatus.overdue ? Icons.warning :
            borrow.status == BorrowStatus.returned ? Icons.check :
            Icons.assignment_return,
            color: statusColor,
          ),
        ),
        title: Text(
          borrow.bookTitle,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Borrowed by: ${borrow.borrowerName}'),
            Text('Due: ${DateFormat('MMM dd, yyyy').format(borrow.dueDate)}'),
            if (borrow.isOverdue)
              Text(
                '${borrow.daysOverdue} days overdue',
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            if (borrow.fineAmount != null && borrow.fineAmount! > 0)
              Text(
                'Fine: ₹${borrow.fineAmount!.toStringAsFixed(0)} ${borrow.finePaid ? "(Paid)" : "(Due)"}',
                style: TextStyle(
                  color: borrow.finePaid ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) => _handleBorrowAction(value, borrow),
          itemBuilder: (context) => [
            if (borrow.status == BorrowStatus.active || borrow.status == BorrowStatus.overdue)
              const PopupMenuItem(
                value: 'return',
                child: Row(
                  children: [
                    Icon(Icons.assignment_turned_in, size: 20),
                    SizedBox(width: 8),
                    Text('Return Book'),
                  ],
                ),
              ),
            if (borrow.status == BorrowStatus.active && borrow.renewalCount < 2)
              const PopupMenuItem(
                value: 'renew',
                child: Row(
                  children: [
                    Icon(Icons.refresh, size: 20),
                    SizedBox(width: 8),
                    Text('Renew'),
                  ],
                ),
              ),
            const PopupMenuItem(
              value: 'details',
              child: Row(
                children: [
                  Icon(Icons.visibility, size: 20),
                  SizedBox(width: 8),
                  Text('View Details'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMembersList(List<LibraryMemberModel> members) {
    final filteredMembers = _filterMembers(members);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredMembers.length,
      itemBuilder: (context, index) {
        final member = filteredMembers[index];
        return _buildMemberCard(member);
      },
    );
  }

  Widget _buildMemberCard(LibraryMemberModel member) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getMemberTypeColor(member.memberType).withValues(alpha: 0.2),
          child: Text(
            member.name[0],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _getMemberTypeColor(member.memberType),
            ),
          ),
        ),
        title: Text(
          member.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${member.memberType.displayName} • ${member.memberId}'),
            if (member.className != null)
              Text('Class: ${member.className}'),
            if (member.department != null)
              Text('Department: ${member.department}'),
            Text('Books: ${member.currentBooksCount}/${member.maxBooksAllowed}'),
            if (member.totalFinesDue > 0)
              Text(
                'Fine Due: ₹${member.totalFinesDue.toStringAsFixed(0)}',
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
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
                color: _getMemberStatusColor(member.status).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                member.status.toString().split('.').last.toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: _getMemberStatusColor(member.status),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              member.canBorrowBooks ? 'Can Borrow' : 'Cannot Borrow',
              style: TextStyle(
                fontSize: 10,
                color: member.canBorrowBooks ? Colors.green : Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        onTap: () => _showMemberDetails(member),
      ),
    );
  }

  List<BookModel> _filterBooks(List<BookModel> books) {
    return books.where((book) {
      // Category filter
      if (selectedCategory != 'All') {
        if (selectedCategory == 'Textbook' && book.category != BookCategory.textbook) return false;
        if (selectedCategory == 'Reference' && book.category != BookCategory.reference) return false;
        if (selectedCategory == 'Fiction' && book.category != BookCategory.fiction) return false;
        if (selectedCategory == 'Non-Fiction' && book.category != BookCategory.non_fiction) return false;
      }
      
      // Status filter
      if (selectedStatus != 'All') {
        if (selectedStatus == 'Available' && book.status != BookStatus.available) return false;
        if (selectedStatus == 'Borrowed' && book.status != BookStatus.borrowed) return false;
        if (selectedStatus == 'Reserved' && book.status != BookStatus.reserved) return false;
        if (selectedStatus == 'Maintenance' && book.status != BookStatus.maintenance) return false;
      }
      
      return true;
    }).toList();
  }

  List<LibraryMemberModel> _filterMembers(List<LibraryMemberModel> members) {
    return members.where((member) {
      // Member type filter
      if (selectedMemberType != 'All') {
        if (selectedMemberType == 'Student' && member.memberType != MemberType.student) return false;
        if (selectedMemberType == 'Faculty' && member.memberType != MemberType.faculty) return false;
        if (selectedMemberType == 'Staff' && member.memberType != MemberType.staff) return false;
        if (selectedMemberType == 'Guest' && member.memberType != MemberType.guest) return false;
      }
      
      return true;
    }).toList();
  }

  Color _getBorrowStatusColor(BorrowStatus status) {
    switch (status) {
      case BorrowStatus.active:
        return Colors.blue;
      case BorrowStatus.returned:
        return Colors.green;
      case BorrowStatus.overdue:
        return Colors.red;
      case BorrowStatus.renewed:
        return Colors.orange;
      case BorrowStatus.lost:
        return Colors.red.shade800;
    }
  }

  Color _getMemberTypeColor(MemberType type) {
    switch (type) {
      case MemberType.student:
        return Colors.blue;
      case MemberType.faculty:
        return Colors.green;
      case MemberType.staff:
        return Colors.orange;
      case MemberType.guest:
        return Colors.purple;
    }
  }

  Color _getMemberStatusColor(MemberStatus status) {
    switch (status) {
      case MemberStatus.active:
        return Colors.green;
      case MemberStatus.inactive:
        return Colors.grey;
      case MemberStatus.suspended:
        return Colors.red;
      case MemberStatus.expired:
        return Colors.orange;
    }
  }

  void _handleBookAction(String action, BookModel book) {
    switch (action) {
      case 'view':
        _showBookDetails(book);
        break;
      case 'edit':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Edit book feature coming soon!')),
        );
        break;
      case 'issue':
        _showIssueBookDialog(bookId: book.id);
        break;
      case 'history':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Borrow history for "${book.title}" coming soon!')),
        );
        break;
    }
  }

  void _handleBorrowAction(String action, BookBorrowModel borrow) {
    switch (action) {
      case 'return':
        _returnBook(borrow);
        break;
      case 'renew':
        _renewBook(borrow);
        break;
      case 'details':
        _showBorrowDetails(borrow);
        break;
    }
  }

  void _showBookDetails(BookModel book) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Text(book.category.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 8),
            Expanded(child: Text(book.title)),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Author', book.author),
              _buildDetailRow('ISBN', book.isbn),
              _buildDetailRow('Publisher', book.publisher),
              _buildDetailRow('Publication Date', DateFormat('MMM dd, yyyy').format(book.publicationDate)),
              _buildDetailRow('Category', book.category.displayName),
              _buildDetailRow('Subject', book.subject),
              _buildDetailRow('Language', book.language),
              _buildDetailRow('Total Copies', '${book.totalCopies}'),
              _buildDetailRow('Available', '${book.availableCopies}'),
              _buildDetailRow('Price', '₹${book.price}'),
              _buildDetailRow('Location', book.location),
              if (book.description != null)
                _buildDetailRow('Description', book.description!),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          if (book.isAvailable)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showIssueBookDialog(bookId: book.id);
              },
              child: const Text('Issue Book'),
            ),
        ],
      ),
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

  void _showMemberDetails(LibraryMemberModel member) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Member details for ${member.name} coming soon!')),
    );
  }

  void _showBorrowDetails(BookBorrowModel borrow) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Borrow details for "${borrow.bookTitle}" coming soon!')),
    );
  }

  void _returnBook(BookBorrowModel borrow) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Returned "${borrow.bookTitle}" successfully!')),
    );
  }

  void _renewBook(BookBorrowModel borrow) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Renewed "${borrow.bookTitle}" for 14 more days!')),
    );
  }

  void _showAddBookDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add book feature coming soon!')),
    );
  }

  void _showIssueBookDialog({String? bookId}) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Issue book feature coming soon!')),
    );
  }

  void _showAddMemberDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add member feature coming soon!')),
    );
  }

  void _scanBook() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Book barcode scanner coming soon!')),
    );
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'catalog_report':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Catalog report feature coming soon!')),
        );
        break;
      case 'overdue_report':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Overdue report feature coming soon!')),
        );
        break;
      case 'fine_collection':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Fine collection feature coming soon!')),
        );
        break;
      case 'import_books':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Import books feature coming soon!')),
        );
        break;
    }
  }
}