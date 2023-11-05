import 'package:flutter/material.dart';

class Settingpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        actions: [
          IconButton(
            icon: Icon(Icons.power_settings_new,color: Colors.red,),
            onPressed: () {
              _showSettingsBottomSheet(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Your app content goes here'),
      ),
    );
  }

  void _showSettingsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.security),
                title: Text('Privacy'),
                onTap: () {
                  // Handle the privacy action here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  // Handle the logout action here
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
