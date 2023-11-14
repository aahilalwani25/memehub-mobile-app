import 'package:flutter/material.dart';
import 'package:memehub_mobile_app/Views/request_list.dart';
import 'package:memehub_mobile_app/global/components/button.dart';

class HomiesScreen extends StatefulWidget {
  final int id;

  HomiesScreen({required this.id, super.key});

  @override
  State<HomiesScreen> createState() => _Homies_ScreenState();
}

class _Homies_ScreenState extends State<HomiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Homies')),
      body: Column(
        children: [
          Text('Requested'),
          RequestList(id: 4,)
        ],
      ),
    );
  }
}
