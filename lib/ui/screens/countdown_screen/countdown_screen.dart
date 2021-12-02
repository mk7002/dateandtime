import 'package:dateandtime/models/CountDownTimer.dart';
import 'package:dateandtime/services/NavigationService.dart';
import 'package:dateandtime/ui/routes.dart';
import 'package:dateandtime/ui/screens/countdown_screen/components/count_down_widget.dart';
import 'package:dateandtime/ui/screens/countdown_screen/components/number_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountDownTimerScreen extends StatefulWidget {
  CountDownTimerScreen({Key? key, required this.countDownTimer})
      : super(key: key);

  CountDownTimer countDownTimer;

  @override
  _CountDownTimerScreenState createState() => _CountDownTimerScreenState();
}

class _CountDownTimerScreenState extends State<CountDownTimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              checkIfCountDownTimerIsFilled()
                  ? CountDownWidget(countDownTimer: widget.countDownTimer)
                  : SizedBox(),
              SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  NavigationService.instance
                      .navigateTo(COUNT_DOWN_TIMER_CREATE_SCREEN);
                },
                child: Text(
                  "Create Timer",
                  style: new TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  bool checkIfCountDownTimerIsFilled() {
    var timer = widget.countDownTimer;
    if (timer.title == null || timer.title!.isEmpty) return false;
    if (timer.location == null || timer.location!.isEmpty) return false;
    if (timer.iso == null || timer.iso!.isEmpty) return false;
    if (timer.design == null || timer.design!.isEmpty) return false;
    return true;
  }
}
