import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          
         TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: bioController,
            decoration: const InputDecoration(labelText: 'Bio'),
            maxLines: 4,
          ),
          TextField(
            controller: linkController,
            decoration: const InputDecoration(labelText: 'Link'),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Save the edited profile data here
              String name = nameController.text;
              String username = usernameController.text;
              String bio = bioController.text;
              String link = linkController.text;

              // You can now use the 'name', 'username', 'bio', and 'link' variables to save or update the user's profile data.
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

