import 'package:flutter/material.dart';

class Styles{

  BuildContext context;

  Styles({required this.context});

  double getWidth(double factor){
    return MediaQuery.sizeOf(context).width*factor;
  }

  double getHeight(double factor){
    return MediaQuery.sizeOf(context).height*factor;
  }
}