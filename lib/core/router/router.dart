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
      page: AuthRoute.page,
      path: '/',
      initial: true,
    )
  ];
}
