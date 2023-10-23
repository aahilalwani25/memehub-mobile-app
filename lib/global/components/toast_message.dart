import 'package:flutter/material.dart';


class ToastMessage{

  String message;
  String type;
  BuildContext context;
  ToastMessage({required this.context,required this.message, required this.type});

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(){
    Color backgroundColor= Colors.red;
    if (type=="success"){
      backgroundColor= Colors.green;
    }
    
    if(type=="warning"){
      backgroundColor= Colors.yellow;
    }


    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(
          child: Text(message,
        style: const TextStyle(color: Colors.white),
      )),
      backgroundColor: backgroundColor,
      margin: const EdgeInsets.only(bottom: 80, left: 20, right: 20),
      behavior: SnackBarBehavior.floating,
      //width: 300 * 0.9,
    ));
  }
}