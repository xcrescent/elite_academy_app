// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:elite_academy/features/auth/account_creation/view/account_creation_page.dart'
    deferred as _i1;
import 'package:elite_academy/features/auth/phone/view/phone_auth_page.dart'
    as _i10;
import 'package:elite_academy/features/auth/phone/view/phone_verify_page.dart'
    as _i11;
import 'package:elite_academy/features/auth/sign_in/view/sign_in_page.dart'
    as _i13;
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
import 'package:elite_academy/features/home/home_page.dart' as _i9;
import 'package:elite_academy/features/home/quiz/web_view_page.dart'
    deferred as _i12;
import 'package:elite_academy/features/splash/view/splash_page.dart' as _i14;
import 'package:flutter/material.dart' as _i16;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AccountCreationRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.AccountCreationScreen(),
        ),
      );
    },
    AddBatchRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.AddBatchPage(),
        ),
      );
    },
    AddEnquiryRoute.name: (routeData) {
      final args = routeData.argsAs<AddEnquiryRouteArgs>(
          orElse: () => const AddEnquiryRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.AddEnquiryPage(key: args.key),
        ),
      );
    },
    AddExamRoute.name: (routeData) {
      final args = routeData.argsAs<AddExamRouteArgs>(
          orElse: () => const AddExamRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.AddExamPage(key: args.key),
        ),
      );
    },
    AddExpenseRoute.name: (routeData) {
      final args = routeData.argsAs<AddExpenseRouteArgs>(
          orElse: () => const AddExpenseRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.AddExpensePage(key: args.key),
        ),
      );
    },
    AddStaffRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.AddStaffPage(),
        ),
      );
    },
    AddStudentRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.DeferredWidget(
          _i7.loadLibrary,
          () => _i7.AddStudentPage(),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomePage(),
      );
    },
    PhoneAuthRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PhoneAuthPage(),
      );
    },
    PhoneVerificationRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.PhoneVerificationPage(),
      );
    },
    QuizWebView.name: (routeData) {
      final args = routeData.argsAs<QuizWebViewArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.DeferredWidget(
          _i12.loadLibrary,
          () => _i12.QuizWebView(
            key: args.key,
            url: args.url,
          ),
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SignInScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountCreationScreen]
class AccountCreationRoute extends _i15.PageRouteInfo<void> {
  const AccountCreationRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AccountCreationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountCreationRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddBatchPage]
class AddBatchRoute extends _i15.PageRouteInfo<void> {
  const AddBatchRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AddBatchRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddBatchRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddEnquiryPage]
class AddEnquiryRoute extends _i15.PageRouteInfo<AddEnquiryRouteArgs> {
  AddEnquiryRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          AddEnquiryRoute.name,
          args: AddEnquiryRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddEnquiryRoute';

  static const _i15.PageInfo<AddEnquiryRouteArgs> page =
      _i15.PageInfo<AddEnquiryRouteArgs>(name);
}

class AddEnquiryRouteArgs {
  const AddEnquiryRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'AddEnquiryRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.AddExamPage]
class AddExamRoute extends _i15.PageRouteInfo<AddExamRouteArgs> {
  AddExamRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          AddExamRoute.name,
          args: AddExamRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddExamRoute';

  static const _i15.PageInfo<AddExamRouteArgs> page =
      _i15.PageInfo<AddExamRouteArgs>(name);
}

class AddExamRouteArgs {
  const AddExamRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'AddExamRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.AddExpensePage]
class AddExpenseRoute extends _i15.PageRouteInfo<AddExpenseRouteArgs> {
  AddExpenseRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          AddExpenseRoute.name,
          args: AddExpenseRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddExpenseRoute';

  static const _i15.PageInfo<AddExpenseRouteArgs> page =
      _i15.PageInfo<AddExpenseRouteArgs>(name);
}

class AddExpenseRouteArgs {
  const AddExpenseRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'AddExpenseRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.AddStaffPage]
class AddStaffRoute extends _i15.PageRouteInfo<void> {
  const AddStaffRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AddStaffRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddStaffRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AddStudentPage]
class AddStudentRoute extends _i15.PageRouteInfo<void> {
  const AddStudentRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AddStudentRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddStudentRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CounterPage]
class CounterRoute extends _i15.PageRouteInfo<void> {
  const CounterRoute({List<_i15.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomePage]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PhoneAuthPage]
class PhoneAuthRoute extends _i15.PageRouteInfo<void> {
  const PhoneAuthRoute({List<_i15.PageRouteInfo>? children})
      : super(
          PhoneAuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneAuthRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.PhoneVerificationPage]
class PhoneVerificationRoute extends _i15.PageRouteInfo<void> {
  const PhoneVerificationRoute({List<_i15.PageRouteInfo>? children})
      : super(
          PhoneVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneVerificationRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.QuizWebView]
class QuizWebView extends _i15.PageRouteInfo<QuizWebViewArgs> {
  QuizWebView({
    _i16.Key? key,
    required String url,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          QuizWebView.name,
          args: QuizWebViewArgs(
            key: key,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizWebView';

  static const _i15.PageInfo<QuizWebViewArgs> page =
      _i15.PageInfo<QuizWebViewArgs>(name);
}

class QuizWebViewArgs {
  const QuizWebViewArgs({
    this.key,
    required this.url,
  });

  final _i16.Key? key;

  final String url;

  @override
  String toString() {
    return 'QuizWebViewArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i13.SignInScreen]
class SignInRoute extends _i15.PageRouteInfo<void> {
  const SignInRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SplashScreen]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
