// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:elite_academy/features/auth/account_creation/view/account_creation_page.dart'
    deferred as _i1;
import 'package:elite_academy/features/auth/phone/view/phone_auth_page.dart'
    as _i11;
import 'package:elite_academy/features/auth/phone/view/phone_verify_page.dart'
    as _i12;
import 'package:elite_academy/features/auth/sign_in/view/sign_in_page.dart'
    as _i14;
import 'package:elite_academy/features/counter/view/counter_page.dart'
    deferred as _i9;
import 'package:elite_academy/features/home/admin/add_batch/view/add_batch_page.dart'
    deferred as _i2;
import 'package:elite_academy/features/home/admin/add_enquiry/view/add_enquiry_page.dart'
    deferred as _i3;
import 'package:elite_academy/features/home/admin/add_exam/view/add_exam_page.dart'
    deferred as _i4;
import 'package:elite_academy/features/home/admin/add_expense/view/add_expense_page.dart'
    deferred as _i5;
import 'package:elite_academy/features/home/admin/add_fee/view/add_fee_page.dart'
    deferred as _i6;
import 'package:elite_academy/features/home/admin/add_staff/view/add_staff_page.dart'
    deferred as _i7;
import 'package:elite_academy/features/home/admin/add_student/view/add_student_page.dart'
    deferred as _i8;
import 'package:elite_academy/features/home/home_page.dart' as _i10;
import 'package:elite_academy/features/home/quiz/web_view_page.dart'
    deferred as _i13;
import 'package:elite_academy/features/splash/view/splash_page.dart' as _i15;
import 'package:flutter/material.dart' as _i17;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    AccountCreationRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.AccountCreationScreen(),
        ),
      );
    },
    AddBatchRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.AddBatchPage(),
        ),
      );
    },
    AddEnquiryRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.AddEnquiryPage(),
        ),
      );
    },
    AddExamRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.AddExamPage(),
        ),
      );
    },
    AddExpenseRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.AddExpensePage(),
        ),
      );
    },
    AddFeeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.AddFeePage(),
        ),
      );
    },
    AddStaffRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.DeferredWidget(
          _i7.loadLibrary,
          () => _i7.AddStaffPage(),
        ),
      );
    },
    AddStudentRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.DeferredWidget(
          _i8.loadLibrary,
          () => _i8.AddStudentPage(),
        ),
      );
    },
    CounterRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.DeferredWidget(
          _i9.loadLibrary,
          () => _i9.CounterPage(),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.HomePage(),
      );
    },
    PhoneAuthRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.PhoneAuthPage(),
      );
    },
    PhoneVerificationRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.PhoneVerificationPage(),
      );
    },
    QuizWebView.name: (routeData) {
      final args = routeData.argsAs<QuizWebViewArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.DeferredWidget(
          _i13.loadLibrary,
          () => _i13.QuizWebView(
            key: args.key,
            url: args.url,
          ),
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SignInScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountCreationScreen]
class AccountCreationRoute extends _i16.PageRouteInfo<void> {
  const AccountCreationRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AccountCreationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountCreationRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddBatchPage]
class AddBatchRoute extends _i16.PageRouteInfo<void> {
  const AddBatchRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AddBatchRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddBatchRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddEnquiryPage]
class AddEnquiryRoute extends _i16.PageRouteInfo<void> {
  const AddEnquiryRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AddEnquiryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddEnquiryRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AddExamPage]
class AddExamRoute extends _i16.PageRouteInfo<void> {
  const AddExamRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AddExamRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddExamRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AddExpensePage]
class AddExpenseRoute extends _i16.PageRouteInfo<void> {
  const AddExpenseRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AddExpenseRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddExpenseRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AddFeePage]
class AddFeeRoute extends _i16.PageRouteInfo<void> {
  const AddFeeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AddFeeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddFeeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AddStaffPage]
class AddStaffRoute extends _i16.PageRouteInfo<void> {
  const AddStaffRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AddStaffRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddStaffRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.AddStudentPage]
class AddStudentRoute extends _i16.PageRouteInfo<void> {
  const AddStudentRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AddStudentRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddStudentRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.CounterPage]
class CounterRoute extends _i16.PageRouteInfo<void> {
  const CounterRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.HomePage]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.PhoneAuthPage]
class PhoneAuthRoute extends _i16.PageRouteInfo<void> {
  const PhoneAuthRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PhoneAuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneAuthRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.PhoneVerificationPage]
class PhoneVerificationRoute extends _i16.PageRouteInfo<void> {
  const PhoneVerificationRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PhoneVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneVerificationRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.QuizWebView]
class QuizWebView extends _i16.PageRouteInfo<QuizWebViewArgs> {
  QuizWebView({
    _i17.Key? key,
    required String url,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          QuizWebView.name,
          args: QuizWebViewArgs(
            key: key,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizWebView';

  static const _i16.PageInfo<QuizWebViewArgs> page =
      _i16.PageInfo<QuizWebViewArgs>(name);
}

class QuizWebViewArgs {
  const QuizWebViewArgs({
    this.key,
    required this.url,
  });

  final _i17.Key? key;

  final String url;

  @override
  String toString() {
    return 'QuizWebViewArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i14.SignInScreen]
class SignInRoute extends _i16.PageRouteInfo<void> {
  const SignInRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SplashScreen]
class SplashRoute extends _i16.PageRouteInfo<void> {
  const SplashRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
