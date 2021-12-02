
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberWidget extends StatefulWidget {
  NumberWidget(
      {Key? key,
      this.number = 0,
      this.durationName = ""})
      : super(key: key);

  int number;
  String durationName;

  @override
  _NumberWidgetState createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "${widget.number}",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            widget.number > 1 ? "${widget.durationName}s" : widget.durationName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal,letterSpacing: 3),
          ),
        )
      ],
    );
  }
}
