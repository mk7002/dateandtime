import 'package:dateandtime/ui/screens/ResponsiveWidget.dart';
import 'package:dateandtime/ui/screens/home/components/option_type_view_holder.dart';
import 'package:dateandtime/ui/screens/home/components/screens_type.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        mobile: BuildMobile(),
        web: BuildWeb(),
        tablet: BuildWeb(),
      ),
    );
  }
}
