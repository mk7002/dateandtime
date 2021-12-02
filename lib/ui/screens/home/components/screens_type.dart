import 'package:dateandtime/services/NavigationService.dart';
import 'package:dateandtime/ui/components/TypeHolder.dart';
import 'package:dateandtime/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildMobile extends StatefulWidget {
  const BuildMobile({Key? key}) : super(key: key);

  @override
  _BuildMobileState createState() => _BuildMobileState();
}

class _BuildMobileState extends State<BuildMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildCommonWidget(0.8, context),
    );
  }
}

class BuildWeb extends StatefulWidget {
  const BuildWeb({Key? key}) : super(key: key);

  @override
  _BuildWebState createState() => _BuildWebState();
}

class _BuildWebState extends State<BuildWeb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildCommonWidget(0.4, context),
    );
  }
}

Widget buildCommonWidget(width, context) {
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: buildScreens()),
            ),
          ),
        ],
      ),
    ),
  );
}

List<Widget> buildScreens() => types_of_screens
    .map((e) => TypeHolder(
          details: e,
          onPressed: (details) {
            NavigationService.instance.navigateTo(details.navigationPath);
          },
        ))
    .toList();
