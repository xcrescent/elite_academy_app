// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:elite_academy/features/auth/account_creation/view/account_creation_page.dart'
    as _i1;
import 'package:elite_academy/features/auth/phone/view/phone_auth_page.dart'
    as _i2;
import 'package:elite_academy/features/auth/sign_in/view/sign_in_page.dart'
    as _i5;
import 'package:elite_academy/features/counter/view/counter_page.dart'
    deferred as _i3;
import 'package:elite_academy/features/home/home.dart' as _i4;
import 'package:elite_academy/features/splash/view/splash_page.dart' as _i6;
import 'package:flutter/material.dart' as _i8;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AccountCreationRoute.name: (routeData) {
      final args = routeData.argsAs<AccountCreationRouteArgs>(
          orElse: () => const AccountCreationRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AccountCreationScreen(key: args.key),
      );
    },
    AuthRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthPage(),
      );
    },
    CounterRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.CounterPage(),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.SignInScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountCreationScreen]
class AccountCreationRoute extends _i7.PageRouteInfo<AccountCreationRouteArgs> {
  AccountCreationRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AccountCreationRoute.name,
          args: AccountCreationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AccountCreationRoute';

  static const _i7.PageInfo<AccountCreationRouteArgs> page =
      _i7.PageInfo<AccountCreationRouteArgs>(name);
}

class AccountCreationRouteArgs {
  const AccountCreationRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'AccountCreationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i7.PageRouteInfo<void> {
  const AuthRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CounterPage]
class CounterRoute extends _i7.PageRouteInfo<void> {
  const CounterRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignInScreen]
class SignInRoute extends _i7.PageRouteInfo<void> {
  const SignInRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
