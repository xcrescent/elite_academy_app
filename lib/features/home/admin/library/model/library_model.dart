import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'library_model.g.dart';

@HiveType(typeId: 40)
class BookModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String title;
  
  @HiveField(2)
  String author;
  
  @HiveField(3)
  String isbn;
  
  @HiveField(4)
  String publisher;
  
  @HiveField(5)
  DateTime publicationDate;
  
  @HiveField(6)
  BookCategory category;
  
  @HiveField(7)
  String subject;
  
  @HiveField(8)
  String language;
  
  @HiveField(9)
  int totalCopies;
  
  @HiveField(10)
  int availableCopies;
  
  @HiveField(11)
  double price;
  
  @HiveField(12)
  String? description;
  
  @HiveField(13)
  String? coverImageUrl;
  
  @HiveField(14)
  BookStatus status;
  
  @HiveField(15)
  String location;
  
  @HiveField(16)
  DateTime createdAt;
  
  @HiveField(17)
  String createdBy;
  
  @HiveField(18)
  DateTime? updatedAt;

  BookModel({
    this.id,
    required this.title,
    required this.author,
    required this.isbn,
    required this.publisher,
    required this.publicationDate,
    required this.category,
    required this.subject,
    this.language = 'English',
    required this.totalCopies,
    required this.availableCopies,
    this.price = 0.0,
    this.description,
    this.coverImageUrl,
    this.status = BookStatus.available,
    required this.location,
    required this.createdAt,
    required this.createdBy,
    this.updatedAt,
  });

  bool get isAvailable => availableCopies > 0 && status == BookStatus.available;
  int get borrowedCopies => totalCopies - availableCopies;
  double get availabilityPercentage => (availableCopies / totalCopies) * 100;

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      isbn: map['isbn'],
      publisher: map['publisher'],
      publicationDate: DateTime.parse(map['publicationDate']),
      category: BookCategory.values.firstWhere(
        (e) => e.toString().split('.').last == map['category'],
        orElse: () => BookCategory.textbook,
      ),
      subject: map['subject'],
      language: map['language'] ?? 'English',
      totalCopies: map['totalCopies'],
      availableCopies: map['availableCopies'],
      price: map['price']?.toDouble() ?? 0.0,
      description: map['description'],
      coverImageUrl: map['coverImageUrl'],
      status: BookStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => BookStatus.available,
      ),
      location: map['location'],
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'],
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'isbn': isbn,
      'publisher': publisher,
      'publicationDate': publicationDate.toIso8601String(),
      'category': category.toString().split('.').last,
      'subject': subject,
      'language': language,
      'totalCopies': totalCopies,
      'availableCopies': availableCopies,
      'price': price,
      'description': description,
      'coverImageUrl': coverImageUrl,
      'status': status.toString().split('.').last,
      'location': location,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

@HiveType(typeId: 41)
class BookBorrowModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String bookId;
  
  @HiveField(2)
  String bookTitle;
  
  @HiveField(3)
  String borrowerId;
  
  @HiveField(4)
  String borrowerName;
  
  @HiveField(5)
  BorrowerType borrowerType;
  
  @HiveField(6)
  DateTime borrowDate;
  
  @HiveField(7)
  DateTime dueDate;
  
  @HiveField(8)
  DateTime? returnDate;
  
  @HiveField(9)
  BorrowStatus status;
  
  @HiveField(10)
  double? fineAmount;
  
  @HiveField(11)
  bool finePaid;
  
  @HiveField(12)
  String? notes;
  
  @HiveField(13)
  String issuedBy;
  
  @HiveField(14)
  String? returnedTo;
  
  @HiveField(15)
  int renewalCount;

  BookBorrowModel({
    this.id,
    required this.bookId,
    required this.bookTitle,
    required this.borrowerId,
    required this.borrowerName,
    required this.borrowerType,
    required this.borrowDate,
    required this.dueDate,
    this.returnDate,
    this.status = BorrowStatus.active,
    this.fineAmount,
    this.finePaid = false,
    this.notes,
    required this.issuedBy,
    this.returnedTo,
    this.renewalCount = 0,
  });

  bool get isOverdue => status == BorrowStatus.active && DateTime.now().isAfter(dueDate);
  int get daysOverdue => isOverdue ? DateTime.now().difference(dueDate).inDays : 0;
  Duration get borrowDuration => (returnDate ?? DateTime.now()).difference(borrowDate);

  double calculateFine(double finePerDay) {
    if (isOverdue) {
      return daysOverdue * finePerDay;
    }
    return 0.0;
  }

  factory BookBorrowModel.fromMap(Map<String, dynamic> map) {
    return BookBorrowModel(
      id: map['id'],
      bookId: map['bookId'],
      bookTitle: map['bookTitle'],
      borrowerId: map['borrowerId'],
      borrowerName: map['borrowerName'],
      borrowerType: BorrowerType.values.firstWhere(
        (e) => e.toString().split('.').last == map['borrowerType'],
        orElse: () => BorrowerType.student,
      ),
      borrowDate: DateTime.parse(map['borrowDate']),
      dueDate: DateTime.parse(map['dueDate']),
      returnDate: map['returnDate'] != null ? DateTime.parse(map['returnDate']) : null,
      status: BorrowStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => BorrowStatus.active,
      ),
      fineAmount: map['fineAmount']?.toDouble(),
      finePaid: map['finePaid'] ?? false,
      notes: map['notes'],
      issuedBy: map['issuedBy'],
      returnedTo: map['returnedTo'],
      renewalCount: map['renewalCount'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bookId': bookId,
      'bookTitle': bookTitle,
      'borrowerId': borrowerId,
      'borrowerName': borrowerName,
      'borrowerType': borrowerType.toString().split('.').last,
      'borrowDate': borrowDate.toIso8601String(),
      'dueDate': dueDate.toIso8601String(),
      'returnDate': returnDate?.toIso8601String(),
      'status': status.toString().split('.').last,
      'fineAmount': fineAmount,
      'finePaid': finePaid,
      'notes': notes,
      'issuedBy': issuedBy,
      'returnedTo': returnedTo,
      'renewalCount': renewalCount,
    };
  }
}

@HiveType(typeId: 42)
class LibraryMemberModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String memberId;
  
  @HiveField(2)
  String name;
  
  @HiveField(3)
  String email;
  
  @HiveField(4)
  String phoneNumber;
  
  @HiveField(5)
  MemberType memberType;
  
  @HiveField(6)
  String? classId;
  
  @HiveField(7)
  String? className;
  
  @HiveField(8)
  String? department;
  
  @HiveField(9)
  DateTime joinDate;
  
  @HiveField(10)
  DateTime? expiryDate;
  
  @HiveField(11)
  MemberStatus status;
  
  @HiveField(12)
  int maxBooksAllowed;
  
  @HiveField(13)
  int currentBooksCount;
  
  @HiveField(14)
  double totalFinesDue;
  
  @HiveField(15)
  String? profileImageUrl;
  
  @HiveField(16)
  String? address;

  LibraryMemberModel({
    this.id,
    required this.memberId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.memberType,
    this.classId,
    this.className,
    this.department,
    required this.joinDate,
    this.expiryDate,
    this.status = MemberStatus.active,
    this.maxBooksAllowed = 3,
    this.currentBooksCount = 0,
    this.totalFinesDue = 0.0,
    this.profileImageUrl,
    this.address,
  });

  bool get canBorrowBooks => 
      status == MemberStatus.active && 
      currentBooksCount < maxBooksAllowed &&
      totalFinesDue < 100.0; // Max fine limit

  bool get isExpired => expiryDate != null && DateTime.now().isAfter(expiryDate!);
  int get availableBorrowSlots => maxBooksAllowed - currentBooksCount;

  factory LibraryMemberModel.fromMap(Map<String, dynamic> map) {
    return LibraryMemberModel(
      id: map['id'],
      memberId: map['memberId'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      memberType: MemberType.values.firstWhere(
        (e) => e.toString().split('.').last == map['memberType'],
        orElse: () => MemberType.student,
      ),
      classId: map['classId'],
      className: map['className'],
      department: map['department'],
      joinDate: DateTime.parse(map['joinDate']),
      expiryDate: map['expiryDate'] != null ? DateTime.parse(map['expiryDate']) : null,
      status: MemberStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => MemberStatus.active,
      ),
      maxBooksAllowed: map['maxBooksAllowed'] ?? 3,
      currentBooksCount: map['currentBooksCount'] ?? 0,
      totalFinesDue: map['totalFinesDue']?.toDouble() ?? 0.0,
      profileImageUrl: map['profileImageUrl'],
      address: map['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'memberId': memberId,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'memberType': memberType.toString().split('.').last,
      'classId': classId,
      'className': className,
      'department': department,
      'joinDate': joinDate.toIso8601String(),
      'expiryDate': expiryDate?.toIso8601String(),
      'status': status.toString().split('.').last,
      'maxBooksAllowed': maxBooksAllowed,
      'currentBooksCount': currentBooksCount,
      'totalFinesDue': totalFinesDue,
      'profileImageUrl': profileImageUrl,
      'address': address,
    };
  }
}

@HiveType(typeId: 43)
enum BookCategory {
  @HiveField(0)
  textbook,
  
  @HiveField(1)
  reference,
  
  @HiveField(2)
  fiction,
  
  @HiveField(3)
  non_fiction,
  
  @HiveField(4)
  journal,
  
  @HiveField(5)
  magazine,
  
  @HiveField(6)
  research,
  
  @HiveField(7)
  digital,
}

@HiveType(typeId: 44)
enum BookStatus {
  @HiveField(0)
  available,
  
  @HiveField(1)
  borrowed,
  
  @HiveField(2)
  reserved,
  
  @HiveField(3)
  maintenance,
  
  @HiveField(4)
  lost,
  
  @HiveField(5)
  damaged,
}

@HiveType(typeId: 45)
enum BorrowStatus {
  @HiveField(0)
  active,
  
  @HiveField(1)
  returned,
  
  @HiveField(2)
  overdue,
  
  @HiveField(3)
  renewed,
  
  @HiveField(4)
  lost,
}

@HiveType(typeId: 46)
enum BorrowerType {
  @HiveField(0)
  student,
  
  @HiveField(1)
  teacher,
  
  @HiveField(2)
  staff,
  
  @HiveField(3)
  guest,
}

@HiveType(typeId: 47)
enum MemberType {
  @HiveField(0)
  student,
  
  @HiveField(1)
  faculty,
  
  @HiveField(2)
  staff,
  
  @HiveField(3)
  guest,
}

@HiveType(typeId: 48)
enum MemberStatus {
  @HiveField(0)
  active,
  
  @HiveField(1)
  inactive,
  
  @HiveField(2)
  suspended,
  
  @HiveField(3)
  expired,
}

extension BookCategoryExtension on BookCategory {
  String get displayName {
    switch (this) {
      case BookCategory.textbook:
        return 'Textbook';
      case BookCategory.reference:
        return 'Reference';
      case BookCategory.fiction:
        return 'Fiction';
      case BookCategory.non_fiction:
        return 'Non-Fiction';
      case BookCategory.journal:
        return 'Journal';
      case BookCategory.magazine:
        return 'Magazine';
      case BookCategory.research:
        return 'Research';
      case BookCategory.digital:
        return 'Digital';
    }
  }

  String get icon {
    switch (this) {
      case BookCategory.textbook:
        return '📚';
      case BookCategory.reference:
        return '📖';
      case BookCategory.fiction:
        return '📔';
      case BookCategory.non_fiction:
        return '📘';
      case BookCategory.journal:
        return '📰';
      case BookCategory.magazine:
        return '📑';
      case BookCategory.research:
        return '🔬';
      case BookCategory.digital:
        return '💻';
    }
  }

  Color get color {
    switch (this) {
      case BookCategory.textbook:
        return const Color(0xFF2196F3);
      case BookCategory.reference:
        return const Color(0xFF4CAF50);
      case BookCategory.fiction:
        return const Color(0xFF9C27B0);
      case BookCategory.non_fiction:
        return const Color(0xFFFF9800);
      case BookCategory.journal:
        return const Color(0xFFf44336);
      case BookCategory.magazine:
        return const Color(0xFF00BCD4);
      case BookCategory.research:
        return const Color(0xFF795548);
      case BookCategory.digital:
        return const Color(0xFF607D8B);
    }
  }
}

extension BookStatusExtension on BookStatus {
  String get displayName {
    switch (this) {
      case BookStatus.available:
        return 'Available';
      case BookStatus.borrowed:
        return 'Borrowed';
      case BookStatus.reserved:
        return 'Reserved';
      case BookStatus.maintenance:
        return 'Under Maintenance';
      case BookStatus.lost:
        return 'Lost';
      case BookStatus.damaged:
        return 'Damaged';
    }
  }

  Color get color {
    switch (this) {
      case BookStatus.available:
        return Colors.green;
      case BookStatus.borrowed:
        return Colors.blue;
      case BookStatus.reserved:
        return Colors.orange;
      case BookStatus.maintenance:
        return Colors.amber;
      case BookStatus.lost:
        return Colors.red;
      case BookStatus.damaged:
        return Colors.red.shade800;
    }
  }
}

extension MemberTypeExtension on MemberType {
  String get displayName {
    switch (this) {
      case MemberType.student:
        return 'Student';
      case MemberType.faculty:
        return 'Faculty';
      case MemberType.staff:
        return 'Staff';
      case MemberType.guest:
        return 'Guest';
    }
  }

  int get defaultMaxBooks {
    switch (this) {
      case MemberType.student:
        return 3;
      case MemberType.faculty:
        return 10;
      case MemberType.staff:
        return 5;
      case MemberType.guest:
        return 2;
    }
  }

  int get defaultBorrowDays {
    switch (this) {
      case MemberType.student:
        return 14;
      case MemberType.faculty:
        return 30;
      case MemberType.staff:
        return 21;
      case MemberType.guest:
        return 7;
    }
  }
}