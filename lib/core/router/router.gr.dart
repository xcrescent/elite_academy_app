// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:elite_academy/features/auth/account_creation/view/account_creation_page.dart'
    as _i1;
import 'package:elite_academy/features/auth/phone/view/phone_auth_page.dart'
    as _i4;
import 'package:elite_academy/features/auth/phone/view/phone_verify_page.dart'
    as _i5;
import 'package:elite_academy/features/auth/sign_in/view/sign_in_page.dart'
    as _i6;
import 'package:elite_academy/features/counter/view/counter_page.dart'
    deferred as _i2;
import 'package:elite_academy/features/home/home.dart' as _i3;
import 'package:elite_academy/features/splash/view/splash_page.dart' as _i7;
import 'package:flutter/foundation.dart' as _i10;
import 'package:flutter/material.dart' as _i9;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AccountCreationRoute.name: (routeData) {
      final args = routeData.argsAs<AccountCreationRouteArgs>(
          orElse: () => const AccountCreationRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AccountCreationScreen(key: args.key),
      );
    },
    CounterRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.CounterPage(),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    PhoneAuthRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PhoneAuthPage(),
      );
    },
    PhoneVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<PhoneVerificationRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.PhoneVerificationPage(
          key: args.key,
          verificationId: args.verificationId,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.SignInScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountCreationScreen]
class AccountCreationRoute extends _i8.PageRouteInfo<AccountCreationRouteArgs> {
  AccountCreationRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          AccountCreationRoute.name,
          args: AccountCreationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AccountCreationRoute';

  static const _i8.PageInfo<AccountCreationRouteArgs> page =
      _i8.PageInfo<AccountCreationRouteArgs>(name);
}

class AccountCreationRouteArgs {
  const AccountCreationRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'AccountCreationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.CounterPage]
class CounterRoute extends _i8.PageRouteInfo<void> {
  const CounterRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PhoneAuthPage]
class PhoneAuthRoute extends _i8.PageRouteInfo<void> {
  const PhoneAuthRoute({List<_i8.PageRouteInfo>? children})
      : super(
          PhoneAuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneAuthRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PhoneVerificationPage]
class PhoneVerificationRoute
    extends _i8.PageRouteInfo<PhoneVerificationRouteArgs> {
  PhoneVerificationRoute({
    _i10.Key? key,
    required String verificationId,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          PhoneVerificationRoute.name,
          args: PhoneVerificationRouteArgs(
            key: key,
            verificationId: verificationId,
          ),
          initialChildren: children,
        );

  static const String name = 'PhoneVerificationRoute';

  static const _i8.PageInfo<PhoneVerificationRouteArgs> page =
      _i8.PageInfo<PhoneVerificationRouteArgs>(name);
}

class PhoneVerificationRouteArgs {
  const PhoneVerificationRouteArgs({
    this.key,
    required this.verificationId,
  });

  final _i10.Key? key;

  final String verificationId;

  @override
  String toString() {
    return 'PhoneVerificationRouteArgs{key: $key, verificationId: $verificationId}';
  }
}

/// generated route for
/// [_i6.SignInScreen]
class SignInRoute extends _i8.PageRouteInfo<void> {
  const SignInRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
