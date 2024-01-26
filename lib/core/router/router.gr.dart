// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:elite_academy/features/auth/account_creation/view/account_creation_page.dart'
    deferred as _i1;
import 'package:elite_academy/features/auth/phone/view/phone_auth_page.dart'
    as _i6;
import 'package:elite_academy/features/auth/phone/view/phone_verify_page.dart'
    as _i7;
import 'package:elite_academy/features/auth/sign_in/view/sign_in_page.dart'
    as _i9;
import 'package:elite_academy/features/counter/view/counter_page.dart'
    deferred as _i4;
import 'package:elite_academy/features/home/admin/add_student/view/add_student_page.dart'
    deferred as _i2;
import 'package:elite_academy/features/home/developer/contact/view/contact_page.dart'
    as _i3;
import 'package:elite_academy/features/home/home_page.dart' as _i5;
import 'package:elite_academy/features/home/quiz/web_view_page.dart'
    deferred as _i8;
import 'package:elite_academy/features/splash/view/splash_page.dart' as _i10;
import 'package:flutter/material.dart' as _i12;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AccountCreationRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.AccountCreationScreen(),
        ),
      );
    },
    AddStudentRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.AddStudentPage(),
        ),
      );
    },
    ContactRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ContactPage(),
      );
    },
    CounterRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.CounterPage(),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    PhoneAuthRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PhoneAuthPage(),
      );
    },
    PhoneVerificationRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PhoneVerificationPage(),
      );
    },
    QuizWebView.name: (routeData) {
      final args = routeData.argsAs<QuizWebViewArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.DeferredWidget(
          _i8.loadLibrary,
          () => _i8.QuizWebView(
            key: args.key,
            url: args.url,
          ),
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SignInScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountCreationScreen]
class AccountCreationRoute extends _i11.PageRouteInfo<void> {
  const AccountCreationRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AccountCreationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountCreationRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddStudentPage]
class AddStudentRoute extends _i11.PageRouteInfo<void> {
  const AddStudentRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AddStudentRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddStudentRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ContactPage]
class ContactRoute extends _i11.PageRouteInfo<void> {
  const ContactRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ContactRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CounterPage]
class CounterRoute extends _i11.PageRouteInfo<void> {
  const CounterRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.PhoneAuthPage]
class PhoneAuthRoute extends _i11.PageRouteInfo<void> {
  const PhoneAuthRoute({List<_i11.PageRouteInfo>? children})
      : super(
          PhoneAuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneAuthRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PhoneVerificationPage]
class PhoneVerificationRoute extends _i11.PageRouteInfo<void> {
  const PhoneVerificationRoute({List<_i11.PageRouteInfo>? children})
      : super(
          PhoneVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneVerificationRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.QuizWebView]
class QuizWebView extends _i11.PageRouteInfo<QuizWebViewArgs> {
  QuizWebView({
    _i12.Key? key,
    required String url,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          QuizWebView.name,
          args: QuizWebViewArgs(
            key: key,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizWebView';

  static const _i11.PageInfo<QuizWebViewArgs> page =
      _i11.PageInfo<QuizWebViewArgs>(name);
}

class QuizWebViewArgs {
  const QuizWebViewArgs({
    this.key,
    required this.url,
  });

  final _i12.Key? key;

  final String url;

  @override
  String toString() {
    return 'QuizWebViewArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i9.SignInScreen]
class SignInRoute extends _i11.PageRouteInfo<void> {
  const SignInRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
