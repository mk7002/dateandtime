import 'dart:developer';
import 'package:dateandtime/models/CountDownTimer.dart';
import 'package:dateandtime/models/appmodels/routing_data.dart';
import 'package:dateandtime/ui/screens/countdown_screen/countdown_screen.dart';
import 'package:dateandtime/ui/screens/create_screen/create_screen.dart';
import 'package:dateandtime/ui/screens/home/home_screen.dart';
import 'package:dateandtime/utils/extensions.dart';
import 'package:flutter/material.dart';

const String HOME_SCREEN = "/home";
const String COUNT_DOWN_TIMER_SCREEN = "/countdowntimer";
const String COUNT_DOWN_TIMER_CREATE_SCREEN = "/countdowntimer_create";

Route<dynamic> generateRoute(RouteSettings settings) {
  var data = settings.name!.routingData;
  switch (data.route) {
    case COUNT_DOWN_TIMER_CREATE_SCREEN:
      return _getPageRoute(CountDownTimerCreateScreen(), settings);
    case COUNT_DOWN_TIMER_SCREEN:
      var iso = data['iso'];
      var title = data['title'];
      var design = data['bg'];
      var location = data['location'];
      var countDownTimer = CountDownTimer();
      countDownTimer.title = title;
      countDownTimer.iso = iso;
      countDownTimer.design = design;
      countDownTimer.location = location;
      return _getPageRoute(
          CountDownTimerScreen(
            countDownTimer: countDownTimer,
          ),
          settings);
    default:
      return _getPageRoute(HomeScreen(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String? routeName;

  _FadeRoute({required this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
