import 'package:flutter/material.dart';

import '../scenes/home/home_page.dart';
import '../scenes/auth/signin/signin_page.dart';

class AppRoute {
  factory AppRoute() => _instance;

  AppRoute._private();

  static final AppRoute _instance = AppRoute._private();

  /// Route Name
  static const String routeRoot = '/';
  static const String routeHome = '/home';
  static const String routeSignIn = '/sign_in';

  static AppRoute get I => _instance;

  /// App route observer
  final RouteObserver<Route<dynamic>> routeObserver =
      RouteObserver<Route<dynamic>>();

  /// App global navigator key
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Get app context
  BuildContext? get appContext => navigatorKey.currentContext;


  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeRoot:
      case routeHome: {
        return MaterialPageRoute<dynamic>(
            settings: settings, builder: (_) => const HomePage(title: 'Flutter Q.'));
      }

      case routeSignIn: {
        return MaterialPageRoute<dynamic>(
            settings: settings, builder: (_) => const SignInPage(title: 'Sign in',));
      }

      default: {
        return MaterialPageRoute<dynamic>(
            settings: settings, builder: (_) => const HomePage(title: 'Flutter Q.'));
      }
    }
  }
}