import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  TimePicker({Key? key, required this.onChanged}) : super(key: key);
  Function onChanged;

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final _controller1 = TextEditingController(text: DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DateTimePicker(
          type: DateTimePickerType.dateTimeSeparate,
          dateMask: 'd MMM, yyyy',
          controller: _controller1,
          //initialValue: _initialValue,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          icon: const Icon(Icons.event),
          dateLabelText: 'Date',

          timeLabelText: "Hour",
          // use24HourFormat: false,
          //locale: Locale('pt', 'BR'),
          selectableDayPredicate: (date) {
            if (date.weekday == 6 || date.weekday == 7) {
              return false;
            }
            return true;
          },
          onChanged: (val) => {widget.onChanged(val)},
        ),
      ),
    );
  }
}
