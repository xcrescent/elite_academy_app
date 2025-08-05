// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i29;
import 'package:elite_academy/features/auth/account_creation/view/account_creation_page.dart'
    deferred as _i1;
import 'package:elite_academy/features/auth/phone/view/phone_auth_page.dart'
    as _i21;
import 'package:elite_academy/features/auth/phone/view/phone_verify_page.dart'
    as _i22;
import 'package:elite_academy/features/auth/sign_in/view/sign_in_page.dart'
    as _i24;
import 'package:elite_academy/features/home/admin/add_batch/view/add_batch_page.dart'
    deferred as _i2;
import 'package:elite_academy/features/home/admin/add_enquiry/view/add_enquiry_page.dart'
    deferred as _i3;
import 'package:elite_academy/features/home/admin/add_exam/view/add_exam_page.dart'
    deferred as _i4;
import 'package:elite_academy/features/home/admin/add_expense/view/add_expense_page.dart'
    deferred as _i5;
import 'package:elite_academy/features/home/admin/add_staff/view/add_staff_page.dart'
    deferred as _i6;
import 'package:elite_academy/features/home/admin/add_student/view/add_student_page.dart'
    deferred as _i7;
import 'package:elite_academy/features/home/admin/analytics/view/analytics_dashboard_page.dart'
    as _i8;
import 'package:elite_academy/features/home/admin/assignments/view/assignments_page.dart'
    as _i9;
import 'package:elite_academy/features/home/admin/attendance/view/attendance_page.dart'
    as _i10;
import 'package:elite_academy/features/home/admin/exam_management/view/exam_management_page.dart'
    as _i11;
import 'package:elite_academy/features/home/admin/fee_management/view/fee_management_page.dart'
    as _i12;
import 'package:elite_academy/features/home/admin/grades/view/grades_page.dart'
    as _i13;
import 'package:elite_academy/features/home/admin/hostel/view/hostel_management_page.dart'
    as _i15;
import 'package:elite_academy/features/home/admin/inventory/view/inventory_management_page.dart'
    as _i16;
import 'package:elite_academy/features/home/admin/library/view/library_management_page.dart'
    as _i17;
import 'package:elite_academy/features/home/admin/manage_student/view/manage_student_page.dart'
    as _i18;
import 'package:elite_academy/features/home/admin/notifications/view/notifications_page.dart'
    as _i19;
import 'package:elite_academy/features/home/admin/staff/view/staff_management_page.dart'
    as _i26;
import 'package:elite_academy/features/home/admin/timetable/view/timetable_page.dart'
    as _i28;
import 'package:elite_academy/features/home/home_page.dart' as _i14;
import 'package:elite_academy/features/home/parent/dashboard/view/parent_dashboard_page.dart'
    deferred as _i20;
import 'package:elite_academy/features/home/quiz/web_view_page.dart'
    deferred as _i23;
import 'package:elite_academy/features/home/student/dashboard/dashboard_page.dart'
    deferred as _i27;
import 'package:elite_academy/features/splash/view/splash_page.dart' as _i25;
import 'package:flutter/material.dart' as _i30;

abstract class $AppRouter extends _i29.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i29.PageFactory> pagesMap = {
    AccountCreationRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.AccountCreationScreen(),
        ),
      );
    },
    AddBatchRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.AddBatchPage(),
        ),
      );
    },
    AddEnquiryRoute.name: (routeData) {
      final args = routeData.argsAs<AddEnquiryRouteArgs>(
          orElse: () => const AddEnquiryRouteArgs());
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.AddEnquiryPage(key: args.key),
        ),
      );
    },
    AddExamRoute.name: (routeData) {
      final args = routeData.argsAs<AddExamRouteArgs>(
          orElse: () => const AddExamRouteArgs());
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.AddExamPage(key: args.key),
        ),
      );
    },
    AddExpenseRoute.name: (routeData) {
      final args = routeData.argsAs<AddExpenseRouteArgs>(
          orElse: () => const AddExpenseRouteArgs());
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.AddExpensePage(key: args.key),
        ),
      );
    },
    AddStaffRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.AddStaffPage(),
        ),
      );
    },
    AddStudentRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.DeferredWidget(
          _i7.loadLibrary,
          () => _i7.AddStudentPage(),
        ),
      );
    },
    AnalyticsDashboardRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.AnalyticsDashboardPage(),
      );
    },
    AssignmentsRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.AssignmentsPage(),
      );
    },
    AttendanceRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.AttendancePage(),
      );
    },
    ExamManagementRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ExamManagementPage(),
      );
    },
    FeeManagementRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.FeeManagementPage(),
      );
    },
    GradesRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.GradesPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.HomePage(),
      );
    },
    HostelManagementRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.HostelManagementPage(),
      );
    },
    InventoryManagementRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.InventoryManagementPage(),
      );
    },
    LibraryManagementRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.LibraryManagementPage(),
      );
    },
    ManageStudentRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ManageStudentPage(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.NotificationsPage(),
      );
    },
    ParentDashboardRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.DeferredWidget(
          _i20.loadLibrary,
          () => _i20.ParentDashboardPage(),
        ),
      );
    },
    PhoneAuthRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.PhoneAuthPage(),
      );
    },
    PhoneVerificationRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.PhoneVerificationPage(),
      );
    },
    QuizWebView.name: (routeData) {
      final args = routeData.argsAs<QuizWebViewArgs>();
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.DeferredWidget(
          _i23.loadLibrary,
          () => _i23.QuizWebView(
            key: args.key,
            url: args.url,
          ),
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.SignInScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.SplashScreen(),
      );
    },
    StaffManagementRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.StaffManagementPage(),
      );
    },
    StudentDashboardRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.DeferredWidget(
          _i27.loadLibrary,
          () => _i27.StudentDashboardPage(),
        ),
      );
    },
    TimetableRoute.name: (routeData) {
      return _i29.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.TimetablePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountCreationScreen]
class AccountCreationRoute extends _i29.PageRouteInfo<void> {
  const AccountCreationRoute({List<_i29.PageRouteInfo>? children})
      : super(
          AccountCreationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountCreationRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddBatchPage]
class AddBatchRoute extends _i29.PageRouteInfo<void> {
  const AddBatchRoute({List<_i29.PageRouteInfo>? children})
      : super(
          AddBatchRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddBatchRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddEnquiryPage]
class AddEnquiryRoute extends _i29.PageRouteInfo<AddEnquiryRouteArgs> {
  AddEnquiryRoute({
    _i30.Key? key,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          AddEnquiryRoute.name,
          args: AddEnquiryRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddEnquiryRoute';

  static const _i29.PageInfo<AddEnquiryRouteArgs> page =
      _i29.PageInfo<AddEnquiryRouteArgs>(name);
}

class AddEnquiryRouteArgs {
  const AddEnquiryRouteArgs({this.key});

  final _i30.Key? key;

  @override
  String toString() {
    return 'AddEnquiryRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.AddExamPage]
class AddExamRoute extends _i29.PageRouteInfo<AddExamRouteArgs> {
  AddExamRoute({
    _i30.Key? key,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          AddExamRoute.name,
          args: AddExamRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddExamRoute';

  static const _i29.PageInfo<AddExamRouteArgs> page =
      _i29.PageInfo<AddExamRouteArgs>(name);
}

class AddExamRouteArgs {
  const AddExamRouteArgs({this.key});

  final _i30.Key? key;

  @override
  String toString() {
    return 'AddExamRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.AddExpensePage]
class AddExpenseRoute extends _i29.PageRouteInfo<AddExpenseRouteArgs> {
  AddExpenseRoute({
    _i30.Key? key,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          AddExpenseRoute.name,
          args: AddExpenseRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddExpenseRoute';

  static const _i29.PageInfo<AddExpenseRouteArgs> page =
      _i29.PageInfo<AddExpenseRouteArgs>(name);
}

class AddExpenseRouteArgs {
  const AddExpenseRouteArgs({this.key});

  final _i30.Key? key;

  @override
  String toString() {
    return 'AddExpenseRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.AddStaffPage]
class AddStaffRoute extends _i29.PageRouteInfo<void> {
  const AddStaffRoute({List<_i29.PageRouteInfo>? children})
      : super(
          AddStaffRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddStaffRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AddStudentPage]
class AddStudentRoute extends _i29.PageRouteInfo<void> {
  const AddStudentRoute({List<_i29.PageRouteInfo>? children})
      : super(
          AddStudentRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddStudentRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i8.AnalyticsDashboardPage]
class AnalyticsDashboardRoute extends _i29.PageRouteInfo<void> {
  const AnalyticsDashboardRoute({List<_i29.PageRouteInfo>? children})
      : super(
          AnalyticsDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnalyticsDashboardRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i9.AssignmentsPage]
class AssignmentsRoute extends _i29.PageRouteInfo<void> {
  const AssignmentsRoute({List<_i29.PageRouteInfo>? children})
      : super(
          AssignmentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AssignmentsRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i10.AttendancePage]
class AttendanceRoute extends _i29.PageRouteInfo<void> {
  const AttendanceRoute({List<_i29.PageRouteInfo>? children})
      : super(
          AttendanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AttendanceRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ExamManagementPage]
class ExamManagementRoute extends _i29.PageRouteInfo<void> {
  const ExamManagementRoute({List<_i29.PageRouteInfo>? children})
      : super(
          ExamManagementRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExamManagementRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i12.FeeManagementPage]
class FeeManagementRoute extends _i29.PageRouteInfo<void> {
  const FeeManagementRoute({List<_i29.PageRouteInfo>? children})
      : super(
          FeeManagementRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeeManagementRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i13.GradesPage]
class GradesRoute extends _i29.PageRouteInfo<void> {
  const GradesRoute({List<_i29.PageRouteInfo>? children})
      : super(
          GradesRoute.name,
          initialChildren: children,
        );

  static const String name = 'GradesRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i14.HomePage]
class HomeRoute extends _i29.PageRouteInfo<void> {
  const HomeRoute({List<_i29.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i15.HostelManagementPage]
class HostelManagementRoute extends _i29.PageRouteInfo<void> {
  const HostelManagementRoute({List<_i29.PageRouteInfo>? children})
      : super(
          HostelManagementRoute.name,
          initialChildren: children,
        );

  static const String name = 'HostelManagementRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i16.InventoryManagementPage]
class InventoryManagementRoute extends _i29.PageRouteInfo<void> {
  const InventoryManagementRoute({List<_i29.PageRouteInfo>? children})
      : super(
          InventoryManagementRoute.name,
          initialChildren: children,
        );

  static const String name = 'InventoryManagementRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i17.LibraryManagementPage]
class LibraryManagementRoute extends _i29.PageRouteInfo<void> {
  const LibraryManagementRoute({List<_i29.PageRouteInfo>? children})
      : super(
          LibraryManagementRoute.name,
          initialChildren: children,
        );

  static const String name = 'LibraryManagementRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ManageStudentPage]
class ManageStudentRoute extends _i29.PageRouteInfo<void> {
  const ManageStudentRoute({List<_i29.PageRouteInfo>? children})
      : super(
          ManageStudentRoute.name,
          initialChildren: children,
        );

  static const String name = 'ManageStudentRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i19.NotificationsPage]
class NotificationsRoute extends _i29.PageRouteInfo<void> {
  const NotificationsRoute({List<_i29.PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i20.ParentDashboardPage]
class ParentDashboardRoute extends _i29.PageRouteInfo<void> {
  const ParentDashboardRoute({List<_i29.PageRouteInfo>? children})
      : super(
          ParentDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'ParentDashboardRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i21.PhoneAuthPage]
class PhoneAuthRoute extends _i29.PageRouteInfo<void> {
  const PhoneAuthRoute({List<_i29.PageRouteInfo>? children})
      : super(
          PhoneAuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneAuthRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i22.PhoneVerificationPage]
class PhoneVerificationRoute extends _i29.PageRouteInfo<void> {
  const PhoneVerificationRoute({List<_i29.PageRouteInfo>? children})
      : super(
          PhoneVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneVerificationRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i23.QuizWebView]
class QuizWebView extends _i29.PageRouteInfo<QuizWebViewArgs> {
  QuizWebView({
    _i30.Key? key,
    required String url,
    List<_i29.PageRouteInfo>? children,
  }) : super(
          QuizWebView.name,
          args: QuizWebViewArgs(
            key: key,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizWebView';

  static const _i29.PageInfo<QuizWebViewArgs> page =
      _i29.PageInfo<QuizWebViewArgs>(name);
}

class QuizWebViewArgs {
  const QuizWebViewArgs({
    this.key,
    required this.url,
  });

  final _i30.Key? key;

  final String url;

  @override
  String toString() {
    return 'QuizWebViewArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i24.SignInScreen]
class SignInRoute extends _i29.PageRouteInfo<void> {
  const SignInRoute({List<_i29.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i25.SplashScreen]
class SplashRoute extends _i29.PageRouteInfo<void> {
  const SplashRoute({List<_i29.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i26.StaffManagementPage]
class StaffManagementRoute extends _i29.PageRouteInfo<void> {
  const StaffManagementRoute({List<_i29.PageRouteInfo>? children})
      : super(
          StaffManagementRoute.name,
          initialChildren: children,
        );

  static const String name = 'StaffManagementRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i27.StudentDashboardPage]
class StudentDashboardRoute extends _i29.PageRouteInfo<void> {
  const StudentDashboardRoute({List<_i29.PageRouteInfo>? children})
      : super(
          StudentDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentDashboardRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}

/// generated route for
/// [_i28.TimetablePage]
class TimetableRoute extends _i29.PageRouteInfo<void> {
  const TimetableRoute({List<_i29.PageRouteInfo>? children})
      : super(
          TimetableRoute.name,
          initialChildren: children,
        );

  static const String name = 'TimetableRoute';

  static const _i29.PageInfo<void> page = _i29.PageInfo<void>(name);
}
