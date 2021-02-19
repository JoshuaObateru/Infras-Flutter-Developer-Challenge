import 'package:flutter/material.dart';
import 'package:infras_flutter_developer_challenge/values/colors.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String hint;
  final Function validator;
  final TextEditingController controller;
  final Function onSave;
  final Function toggleObscured;

  final bool isPassword;

  const CustomInput(
      {Key key,
      this.label,
      this.hint,
      this.validator,
      this.controller,
      this.onSave,
      this.toggleObscured,
      this.isPassword})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            errorStyle: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.red,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: secondaryColor, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor, width: 2.0),
                borderRadius: BorderRadius.circular(8.0)),
            labelStyle: TextStyle(
              fontWeight: FontWeight.w300,
            ),
            labelText: hint),
      ),
    );
  }
}
