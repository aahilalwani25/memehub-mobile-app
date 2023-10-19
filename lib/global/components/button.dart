import 'package:flutter/material.dart';

class Button {
  BuildContext context;
  void Function() onPressed;
  String title;
  ButtonStyle? style;

  Button({required this.context, required this.onPressed, required this.title, this.style});

  Widget show() {
    return Container(
        width: 151,
        height: 45,
        margin: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            onPressed: onPressed,
            child: Text(
              title,
              style: const TextStyle(color: Colors.white),
            )));
  }
}
