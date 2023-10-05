import 'package:flutter/material.dart';

class User with ChangeNotifier{
  String? _username;
  String? _email;
  String? _password;

  void setUsername(String username){
    _username = username;
    notifyListeners();
  }

  String? get username => _username;
  set username(String? username) => _username = username;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get password => _password;
  set password(String? password) => _password = password;
}
