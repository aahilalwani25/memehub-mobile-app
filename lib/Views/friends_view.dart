import 'package:flutter/material.dart';

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
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/profilepicture.jpeg"),
            ), 
            title: Text("Ayub Latif"),
            trailing: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    
                  ),
                  onPressed: () {  },
                  child: Text('Confirm')),
                ElevatedButton(
                  onPressed: () {  },
                  child: Text('Confirm')),
              ],
            ),
            ),
            
            Divider(),
        ],
      ),
    );
  }
}
