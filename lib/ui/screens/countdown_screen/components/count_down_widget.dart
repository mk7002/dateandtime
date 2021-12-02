import 'dart:async';
import 'dart:developer';

import 'package:dateandtime/models/CountDownTimer.dart';
import 'package:dateandtime/ui/screens/countdown_screen/components/number_widget.dart';
import 'package:dateandtime/utils/TimeUtils.dart';
import 'package:flutter/material.dart';

class CountDownWidget extends StatefulWidget {
  CountDownWidget({Key? key, required this.countDownTimer}) : super(key: key);
  CountDownTimer countDownTimer;

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {

  late Duration duration;
  int seconds = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void updateDuration(){
    setState(() {
      duration = TimeUtils.instance.differenceFromNowString(widget.countDownTimer.iso!);
    });
  }

  @override
  Widget build(BuildContext context) {
    duration = TimeUtils.instance.differenceFromNowString(widget.countDownTimer.iso!);
    seconds = getSeconds(duration);
    log("build");
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        color: Colors.blueGrey,
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("${widget.countDownTimer.title}",
              style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            ),
          ),
          !duration.isNegative ?
          countDownTimerScreen(
              duration) : Text("Finish"),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("${TimeUtils.instance.convertTimeStampToReadableDate(int.parse(widget.countDownTimer.iso!))}",
              style: TextStyle(color: Colors.white,fontSize: 18,letterSpacing: 5),),
            ),
          )
        ]),
      );
    });
  }

  int getSeconds(duration){
    return (duration.inSeconds - (duration.inMinutes * 60));
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (time) {
      var duration =TimeUtils.instance.differenceFromNowString(widget.countDownTimer.iso!);
      if(duration.isNegative)
        time.cancel();
      setState(() {
        seconds = getSeconds(duration);
      });
    });
  }

  Widget countDownTimerScreen(Duration duration) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NumberWidget(
            number: duration.inDays,
            durationName: "Day",
          ),
          NumberWidget(
            number: (duration.inHours - (duration.inDays * 24)),
            durationName: "Hour",
          ),
          NumberWidget(
            number: (duration.inMinutes  - (duration.inHours * 60)),
            durationName: "Minute",
          ),
          NumberWidget(
            number: seconds,
            durationName: "Second",
          ),
        ],
      );
}
