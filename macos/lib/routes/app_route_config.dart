import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:megabank/screens/authentication/forgot_password/reset.dart';
import 'package:megabank/screens/transactions/transaction_screen/transactions_screen.dart';

import '../screens/authentication/change_password/change_password.dart';
import '../screens/authentication/login/login.dart';
import '../screens/authentication/splash_screen.dart';
import '../screens/base_screen.dart';
import '../screens/profile/profile.dart';
import 'app_route_constants.dart';

//!GoRouter route definitions

class NyAppRouter {
  static GoRouter returnRouter(bool isAuth) {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: MyAppRouteConstants.initialRouteName,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(child: LoginPage()); //home screen set to Login screen
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.homeRouteName,
          path: '/home',
          pageBuilder: (context, state) {
            return const MaterialPage(child: BaseScreen());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.profileRouteName,
          path: '/profile',
          pageBuilder: (context, state) {
            return const MaterialPage(child: Profile());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.transactionsRouteName,
          path: '/transactions',
          pageBuilder: (context, state) {
            return const MaterialPage(child: TransactionsScreen());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.loginPageRouteName,
          path: '/loginPage',
          pageBuilder: (context, state) {
            return const MaterialPage(child: LoginPage());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.splashScreenRouteName,
          path: '/splashScreen',
          pageBuilder: (context, state) {
            return const MaterialPage(child: SplashScreen());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.changePasswordRouteName,
          path: '/changePassword',
          pageBuilder: (context, state) {
            return const MaterialPage(child: ChangePassword());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.forgotPasswordRouteName,
          path: '/forgotPassword',
          pageBuilder: (context, state) {
            return const MaterialPage(child: ForgotPassword());
          },
        )
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: BaseScreen());
      },
    );
    return router;
  }
}