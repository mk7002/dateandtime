import 'package:dateandtime/services/NavigationService.dart';
import 'package:dateandtime/ui/screens/countdown_screen/components/number_widget.dart';
import 'package:dateandtime/ui/screens/create_screen/components/time_picker.dart';
import 'package:dateandtime/utils/TimeUtils.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';

class CountDownTimerCreateScreen extends StatefulWidget {
  const CountDownTimerCreateScreen({Key? key}) : super(key: key);

  @override
  _CountDownTimerCreateScreenState createState() =>
      _CountDownTimerCreateScreenState();
}

class _CountDownTimerCreateScreenState
    extends State<CountDownTimerCreateScreen> {

  String timeStamp = "";
  final titleController = TextEditingController();
  String url = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }


  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  Widget buildBody() {
    return Center(
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xD4D2D2D5)),
            width: MediaQuery
                .of(context)
                .size
                .width * 0.6,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Title')),
                  SizedBox(
                    height: 20,
                  ),
                  TimePicker(onChanged: (val) {
                    timeStamp = TimeUtils.instance.convertDateToTimeStamp(val);
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      url = "${titleController.text} ${timeStamp}";
                    });
                  }, child: Text("Create")),
                  url.isEmpty ? SizedBox() : GestureDetector(
                    onTap: (){
                      NavigationService.instance.navigateTo("$COUNT_DOWN_TIMER_SCREEN?iso=$timeStamp&title=${titleController.text}&bg=44&location=mumbai");
                    },
                    child: Text(url),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
