import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/const/routes.dart';
import 'package:elite_academy/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: PhoneAuthRoute.page,
      path: Routes.phoneAuth,
      initial: false,
    ),
    AutoRoute(
      page: HomeRoute.page,
      path: Routes.home,
      initial: false,
    ),
    AutoRoute(
      page: SplashRoute.page,
      path: Routes.splash,
      initial: true,
    ),
    AutoRoute(
      page: SignInRoute.page,
      path: Routes.signIn,
      initial: false,
    ),
    AutoRoute(
      page: AccountCreationRoute.page,
      path: Routes.accountCreation,
      initial: false,
    ),
    AutoRoute(
      page: PhoneVerificationRoute.page,
      path: Routes.phoneVerify,
      initial: false,
    ),
    // AutoRoute(
    //   page: ContactRoute.page,
    //   path: '/contact',
    //   initial: false,
    // ),
    AutoRoute(
      page: WebViewRoute.page,
      path: '/web-view',
      initial: false,
    ),
    AutoRoute(
      page: AddStudentRoute.page,
      path: '/add-student',
      initial: false,
    ),
    AutoRoute(
      page: AddStaffRoute.page,
      path: '/add-staff',
      initial: false,
    ),
    AutoRoute(
      page: AddBatchRoute.page,
      path: '/add-batch',
      initial: false,
    ),
    // AutoRoute(
    //   page: AddFeeRoute.page,
    //   path: '/add-fee',
    //   initial: false,
    // ),
    // AutoRoute(
    //   page: AddAttendanceRoute.page,
    //   path: '/add-attendance',
    //   initial: false,
    // ),
    // AutoRoute(
    //   page: AddOrgRoute.page,
    //   path: '/add-org',
    //   initial: false,
    // ),
    // AutoRoute(
    //   page: AddAdminRoute.page,
    //   path: '/add-admin',
    //   initial: false,
    // ),
    AutoRoute(
      page: AddExamRoute.page,
      path: '/add-exam',
      initial: false,
    ),
    // AutoRoute(
    //   page: AddSubjectRoute.page,
    //   path: '/add-subject',
    //   initial: false,
    // ),
    AutoRoute(
      page: AddExpenseRoute.page,
      path: '/add-expense',
      initial: false,
    ),
    // EnquiryRoute(),
    AutoRoute(
      page: AddEnquiryRoute.page,
      path: '/add-enquiry',
      initial: false,
    ),
    AutoRoute(
      page: AnalyticsDashboardRoute.page,
      path: '/analytics-dashboard',
      initial: false,
    ),
  ];
}
