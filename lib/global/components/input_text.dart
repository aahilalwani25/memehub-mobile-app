import 'package:flutter/material.dart';
import '../styles.dart';

class Input {
  String? hintText;
  TextEditingController controller;
  String? Function(String?)? validator;
  BuildContext context;
  TextInputType? textInputType;
  bool? obscureText;
  Styles styles;
  Icon? icon;

  Input(
      {required this.context,
      required this.controller,
      this.hintText,
      this.validator,
      this.textInputType,
      this.obscureText = false,
      required this.styles,
      this.icon});

  Widget show() {
    InputDecorationTheme inputDecorationTheme =
        Theme.of(context).inputDecorationTheme;

    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 15,
      ),
      width: styles.getWidth(0.58),
      height: styles.getHeight(0.07),
      child: TextFormField(
        style: TextStyle(
          fontSize: styles.getHeight(0.02),
        ),
        obscureText: obscureText!,
        controller: controller,
        keyboardType: textInputType ?? TextInputType.name,
        validator: validator,
        decoration: InputDecoration(
          
          prefixIcon: icon,
          hintText: hintText,
          fillColor: inputDecorationTheme.fillColor,
          filled: inputDecorationTheme.filled,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}
