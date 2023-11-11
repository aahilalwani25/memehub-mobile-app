import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class dob extends StatefulWidget {
  @override
  _dobState createState() => new _dobState();
}

class _dobState extends State<dob> {
  DateTime _selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat.yMd().format(_selectedDateTime);
    final selectedText = Text('You selected: $formattedDate');

    final birthdayTile = new Material(
      color: Colors.transparent,
      child: CupertinoDateTextBox(
          initialValue: _selectedDateTime,
          onDateChange: onBirthdayChange,
          hintText: DateFormat.yMd().format(_selectedDateTime)),
    );

    return new Scaffold(
      body: birthdayTile,
    );
  }

  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
    });
  }
}
