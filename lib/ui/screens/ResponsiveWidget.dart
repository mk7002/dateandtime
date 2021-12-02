import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  ResponsiveWidget({Key? key, this.mobile, this.tablet, this.web})
      : super(key: key);
  Widget? mobile;
  Widget? web;
  Widget? tablet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, snapshot) {
      if (snapshot.maxWidth > 900) {
        return web!;
      } else if (snapshot.maxWidth > 768) {
        //TODO : add table widget here
        return tablet!;
      } else {
        return mobile!;
      }
    });
  }
}
