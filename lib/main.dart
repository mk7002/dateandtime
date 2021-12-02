import 'package:dateandtime/services/NavigationService.dart';
import 'package:dateandtime/ui/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: HOME_SCREEN,
    );
  }
}
