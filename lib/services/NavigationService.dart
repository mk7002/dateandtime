
import 'package:flutter/material.dart';

class NavigationService {
  NavigationService._privateConstructor();

  static final NavigationService instance =
  NavigationService._privateConstructor();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void navigateTo(String routeNames) {
    navigatorKey.currentState!.pushNamed(routeNames);
  }

  Future<dynamic> navigateToWithArguments(
      String routeNames, Object? arguments) {
    return navigatorKey.currentState!
        .pushNamed(routeNames, arguments: arguments);
  }

  void goBack() {
    navigatorKey.currentState!.pop();
  }
}
