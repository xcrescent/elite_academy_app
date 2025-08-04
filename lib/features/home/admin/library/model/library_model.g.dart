// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookModelAdapter extends TypeAdapter<BookModel> {
  @override
  final int typeId = 40;

  @override
  BookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookModel(
      id: fields[0] as String?,
      title: fields[1] as String,
      author: fields[2] as String,
      isbn: fields[3] as String,
      publisher: fields[4] as String,
      publicationDate: fields[5] as DateTime,
      category: fields[6] as BookCategory,
      subject: fields[7] as String,
      language: fields[8] as String,
      totalCopies: fields[9] as int,
      availableCopies: fields[10] as int,
      price: fields[11] as double,
      description: fields[12] as String?,
      coverImageUrl: fields[13] as String?,
      status: fields[14] as BookStatus,
      location: fields[15] as String,
      createdAt: fields[16] as DateTime,
      createdBy: fields[17] as String,
      updatedAt: fields[18] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, BookModel obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.isbn)
      ..writeByte(4)
      ..write(obj.publisher)
      ..writeByte(5)
      ..write(obj.publicationDate)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.subject)
      ..writeByte(8)
      ..write(obj.language)
      ..writeByte(9)
      ..write(obj.totalCopies)
      ..writeByte(10)
      ..write(obj.availableCopies)
      ..writeByte(11)
      ..write(obj.price)
      ..writeByte(12)
      ..write(obj.description)
      ..writeByte(13)
      ..write(obj.coverImageUrl)
      ..writeByte(14)
      ..write(obj.status)
      ..writeByte(15)
      ..write(obj.location)
      ..writeByte(16)
      ..write(obj.createdAt)
      ..writeByte(17)
      ..write(obj.createdBy)
      ..writeByte(18)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BookBorrowModelAdapter extends TypeAdapter<BookBorrowModel> {
  @override
  final int typeId = 41;

  @override
  BookBorrowModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookBorrowModel(
      id: fields[0] as String?,
      bookId: fields[1] as String,
      bookTitle: fields[2] as String,
      borrowerId: fields[3] as String,
      borrowerName: fields[4] as String,
      borrowerType: fields[5] as BorrowerType,
      borrowDate: fields[6] as DateTime,
      dueDate: fields[7] as DateTime,
      returnDate: fields[8] as DateTime?,
      status: fields[9] as BorrowStatus,
      fineAmount: fields[10] as double?,
      finePaid: fields[11] as bool,
      notes: fields[12] as String?,
      issuedBy: fields[13] as String,
      returnedTo: fields[14] as String?,
      renewalCount: fields[15] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BookBorrowModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.bookId)
      ..writeByte(2)
      ..write(obj.bookTitle)
      ..writeByte(3)
      ..write(obj.borrowerId)
      ..writeByte(4)
      ..write(obj.borrowerName)
      ..writeByte(5)
      ..write(obj.borrowerType)
      ..writeByte(6)
      ..write(obj.borrowDate)
      ..writeByte(7)
      ..write(obj.dueDate)
      ..writeByte(8)
      ..write(obj.returnDate)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.fineAmount)
      ..writeByte(11)
      ..write(obj.finePaid)
      ..writeByte(12)
      ..write(obj.notes)
      ..writeByte(13)
      ..write(obj.issuedBy)
      ..writeByte(14)
      ..write(obj.returnedTo)
      ..writeByte(15)
      ..write(obj.renewalCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookBorrowModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LibraryMemberModelAdapter extends TypeAdapter<LibraryMemberModel> {
  @override
  final int typeId = 42;

  @override
  LibraryMemberModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LibraryMemberModel(
      id: fields[0] as String?,
      memberId: fields[1] as String,
      name: fields[2] as String,
      email: fields[3] as String,
      phoneNumber: fields[4] as String,
      memberType: fields[5] as MemberType,
      classId: fields[6] as String?,
      className: fields[7] as String?,
      department: fields[8] as String?,
      joinDate: fields[9] as DateTime,
      expiryDate: fields[10] as DateTime?,
      status: fields[11] as MemberStatus,
      maxBooksAllowed: fields[12] as int,
      currentBooksCount: fields[13] as int,
      totalFinesDue: fields[14] as double,
      profileImageUrl: fields[15] as String?,
      address: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LibraryMemberModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.memberId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.memberType)
      ..writeByte(6)
      ..write(obj.classId)
      ..writeByte(7)
      ..write(obj.className)
      ..writeByte(8)
      ..write(obj.department)
      ..writeByte(9)
      ..write(obj.joinDate)
      ..writeByte(10)
      ..write(obj.expiryDate)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.maxBooksAllowed)
      ..writeByte(13)
      ..write(obj.currentBooksCount)
      ..writeByte(14)
      ..write(obj.totalFinesDue)
      ..writeByte(15)
      ..write(obj.profileImageUrl)
      ..writeByte(16)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LibraryMemberModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BookCategoryAdapter extends TypeAdapter<BookCategory> {
  @override
  final int typeId = 43;

  @override
  BookCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BookCategory.textbook;
      case 1:
        return BookCategory.reference;
      case 2:
        return BookCategory.fiction;
      case 3:
        return BookCategory.non_fiction;
      case 4:
        return BookCategory.journal;
      case 5:
        return BookCategory.magazine;
      case 6:
        return BookCategory.research;
      case 7:
        return BookCategory.digital;
      default:
        return BookCategory.textbook;
    }
  }

  @override
  void write(BinaryWriter writer, BookCategory obj) {
    switch (obj) {
      case BookCategory.textbook:
        writer.writeByte(0);
        break;
      case BookCategory.reference:
        writer.writeByte(1);
        break;
      case BookCategory.fiction:
        writer.writeByte(2);
        break;
      case BookCategory.non_fiction:
        writer.writeByte(3);
        break;
      case BookCategory.journal:
        writer.writeByte(4);
        break;
      case BookCategory.magazine:
        writer.writeByte(5);
        break;
      case BookCategory.research:
        writer.writeByte(6);
        break;
      case BookCategory.digital:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BookStatusAdapter extends TypeAdapter<BookStatus> {
  @override
  final int typeId = 44;

  @override
  BookStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BookStatus.available;
      case 1:
        return BookStatus.borrowed;
      case 2:
        return BookStatus.reserved;
      case 3:
        return BookStatus.maintenance;
      case 4:
        return BookStatus.lost;
      case 5:
        return BookStatus.damaged;
      default:
        return BookStatus.available;
    }
  }

  @override
  void write(BinaryWriter writer, BookStatus obj) {
    switch (obj) {
      case BookStatus.available:
        writer.writeByte(0);
        break;
      case BookStatus.borrowed:
        writer.writeByte(1);
        break;
      case BookStatus.reserved:
        writer.writeByte(2);
        break;
      case BookStatus.maintenance:
        writer.writeByte(3);
        break;
      case BookStatus.lost:
        writer.writeByte(4);
        break;
      case BookStatus.damaged:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BorrowStatusAdapter extends TypeAdapter<BorrowStatus> {
  @override
  final int typeId = 45;

  @override
  BorrowStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BorrowStatus.active;
      case 1:
        return BorrowStatus.returned;
      case 2:
        return BorrowStatus.overdue;
      case 3:
        return BorrowStatus.renewed;
      case 4:
        return BorrowStatus.lost;
      default:
        return BorrowStatus.active;
    }
  }

  @override
  void write(BinaryWriter writer, BorrowStatus obj) {
    switch (obj) {
      case BorrowStatus.active:
        writer.writeByte(0);
        break;
      case BorrowStatus.returned:
        writer.writeByte(1);
        break;
      case BorrowStatus.overdue:
        writer.writeByte(2);
        break;
      case BorrowStatus.renewed:
        writer.writeByte(3);
        break;
      case BorrowStatus.lost:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BorrowStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BorrowerTypeAdapter extends TypeAdapter<BorrowerType> {
  @override
  final int typeId = 46;

  @override
  BorrowerType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BorrowerType.student;
      case 1:
        return BorrowerType.teacher;
      case 2:
        return BorrowerType.staff;
      case 3:
        return BorrowerType.guest;
      default:
        return BorrowerType.student;
    }
  }

  @override
  void write(BinaryWriter writer, BorrowerType obj) {
    switch (obj) {
      case BorrowerType.student:
        writer.writeByte(0);
        break;
      case BorrowerType.teacher:
        writer.writeByte(1);
        break;
      case BorrowerType.staff:
        writer.writeByte(2);
        break;
      case BorrowerType.guest:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BorrowerTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MemberTypeAdapter extends TypeAdapter<MemberType> {
  @override
  final int typeId = 47;

  @override
  MemberType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MemberType.student;
      case 1:
        return MemberType.faculty;
      case 2:
        return MemberType.staff;
      case 3:
        return MemberType.guest;
      default:
        return MemberType.student;
    }
  }

  @override
  void write(BinaryWriter writer, MemberType obj) {
    switch (obj) {
      case MemberType.student:
        writer.writeByte(0);
        break;
      case MemberType.faculty:
        writer.writeByte(1);
        break;
      case MemberType.staff:
        writer.writeByte(2);
        break;
      case MemberType.guest:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MemberStatusAdapter extends TypeAdapter<MemberStatus> {
  @override
  final int typeId = 48;

  @override
  MemberStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MemberStatus.active;
      case 1:
        return MemberStatus.inactive;
      case 2:
        return MemberStatus.suspended;
      case 3:
        return MemberStatus.expired;
      default:
        return MemberStatus.active;
    }
  }

  @override
  void write(BinaryWriter writer, MemberStatus obj) {
    switch (obj) {
      case MemberStatus.active:
        writer.writeByte(0);
        break;
      case MemberStatus.inactive:
        writer.writeByte(1);
        break;
      case MemberStatus.suspended:
        writer.writeByte(2);
        break;
      case MemberStatus.expired:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
