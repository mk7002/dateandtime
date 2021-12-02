import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionTypeViewHolder extends StatelessWidget {
  const OptionTypeViewHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.width / 5,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
