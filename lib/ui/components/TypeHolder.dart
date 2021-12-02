import 'package:dateandtime/assets/images.dart';
import 'package:dateandtime/models/type_details.dart';
import 'package:flutter/material.dart';

class TypeHolder extends StatelessWidget {
  TypeHolder({Key? key, required this.details, required this.onPressed})
      : super(key: key);

  TypeDetails details;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return InkWell(
        onTap: () {
          onPressed(details);
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(details.icon_path),
                ),
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.8,
              ),
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.2,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Colors.blue),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        details.title,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.red),
        ),
      );
    });
  }
}
