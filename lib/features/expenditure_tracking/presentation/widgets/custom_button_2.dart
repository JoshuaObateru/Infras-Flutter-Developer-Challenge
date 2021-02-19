import 'package:flutter/material.dart';
import 'package:infras_flutter_developer_challenge/values/colors.dart';

class CustomButton2 extends StatelessWidget {
  final String label;
  final Function onPressed;

  const CustomButton2({Key key, this.label, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: secondaryColor, width: 1.0),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                label,
                style: (TextStyle(
                  color: accentColor,
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
