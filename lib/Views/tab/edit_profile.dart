import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: bioController,
              decoration: InputDecoration(labelText: 'Bio'),
            ),
            TextField(
              controller: linkController,
              decoration: InputDecoration(labelText: 'Link'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Save the edited profile data here
                String name = nameController.text;
                String username = usernameController.text;
                String bio = bioController.text;
                String link = linkController.text;

                // You can now use the 'name', 'username', 'bio', and 'link' variables to save or update the user's profile data.
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
