import 'package:jiffy/jiffy.dart';

class TimeUtils {
  TimeUtils._privateConstructor();

  static final TimeUtils instance = TimeUtils._privateConstructor();

  String convertDateToTimeStamp(dateTime) {
    var timestamp = Jiffy(dateTime).dateTime.millisecondsSinceEpoch;
    return "$timestamp";
  }

  DateTime convertTimeStampToDate(timeStamp) {
    return DateTime.fromMillisecondsSinceEpoch(timeStamp);
  }

  String convertTimeStampToReadableDate(timeStamp) {
    return Jiffy(DateTime.fromMillisecondsSinceEpoch(timeStamp)).yMMMMEEEEdjm;
  }

  Duration differenceFromNow(int timestamp) {
    var dateTime = convertTimeStampToDate(timestamp);
    var currentTime = DateTime.now();
    return currentTime.difference(dateTime);
  }

  Duration differenceFromNowString(String timestamp) {
    var dateTime = convertTimeStampToDate(int.parse(timestamp));
    var currentTime = DateTime.now();
    return dateTime.difference(currentTime);
  }
}
