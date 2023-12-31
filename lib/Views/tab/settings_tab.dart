import 'package:flutter/material.dart';
import 'package:memehub_mobile_app/global/styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Styles styles = Styles(context: context);
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.power_settings_new,
                color: Colors.red,
              ),
              onPressed: () {
                _showSettingsBottomSheet(context);
              },
            ),
          ],
        ),
        body: const Center(
          child: Text('Your app content goes here'),
        ),
      ),
    );
  }

  void _showSettingsBottomSheet(BuildContext context) {
    Styles styles = Styles(context: context);
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
          
          width: styles.getWidth(1),
          height: styles.getHeight(0.2),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(vertical:8.0),
                child: Text(
                  "Are you sure you want to Log out?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: styles.getWidth(0.35),
                    
                    child: TextButton(
                      
                        onPressed: () {
                          //logout the user

                        },
                        style: TextButton.styleFrom(backgroundColor: Colors.red),
                        child: Text("Yes", style: TextStyle(color: Colors.white),)),
                  ),

                  Container(
                    width: styles.getWidth(0.35),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        style: TextButton.styleFrom(backgroundColor: Colors.green),
                        child: Text("No", style: TextStyle(color: Colors.white),)),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
