import 'package:flutter/material.dart';
import 'package:infras_flutter_developer_challenge/values/colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final bool isLoading;

  const CustomButton({Key key, this.label, this.onPressed, this.isLoading})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.white),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Processing......",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  : Text(
                      label,
                      style: (TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold)),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
