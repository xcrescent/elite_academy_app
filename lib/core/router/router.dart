import 'package:auto_route/auto_route.dart';

import '../../../core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: CounterRoute.page,
      path: '/counter',
      initial: false,
    ),
    AutoRoute(
      page: PhoneAuthRoute.page,
      path: '/phone-auth',
      initial: false,
    ),
    AutoRoute(
      page: HomeRoute.page,
      path: '/home',
      initial: false,
    ),
    AutoRoute(
      page: SplashRoute.page,
      path: '/splash',
      initial: true,
    ),
    AutoRoute(
      page: SignInRoute.page,
      path: '/sign-in',
      initial: false,
    ),
    AutoRoute(
      page: AccountCreationRoute.page,
      path: '/account-creation',
      initial: false,
    ),
    AutoRoute(
      page: PhoneVerificationRoute.page,
      path: '/phone-verify',
      initial: false,
    ),
    AutoRoute(
      page: ContactRoute.page,
      path: '/contact',
      initial: false,
    ),
  ];
}
