import 'package:flutter/material.dart';
import 'package:memehub_mobile_app/Views/Comment/single_comment.dart';

class Comments {

  TextEditingController commentController= TextEditingController();
  List comments = [
    {
      'username': 'aahil',
      'comment': 'This is so funny',
      'date': '20 Nov 2023',
      'time': '22:22pm',
      'image': "assets/images/profilepic1.jpg",
    },
    {
      'username': 'ayub latif',
      'comment': 'This is not funny',
      'date': '20 Nov 2023',
      'time': '22:22pm',
      'image': "assets/images/profilepic1.jpg",
    },
    {
      'username': 'ayub latif',
      'comment': 'This is not funny',
      'date': '20 Nov 2023',
      'time': '22:22pm',
      'image': "assets/images/profilepic1.jpg",
    },
    {
      'username': 'ayub latif',
      'comment': 'This is not funny',
      'date': '20 Nov 2023',
      'time': '22:22pm',
      'image': "assets/images/profilepic1.jpg",
    },
    {
      'username': 'ayub latif',
      'comment': 'This is not funny',
      'date': '20 Nov 2023',
      'time': '22:22pm',
      'image': "assets/images/profilepic1.jpg",
    }
  ];

  void show(BuildContext context, String post_id) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom:50),
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      AssetImage('assets/images/profilepicture.jpeg'),
                ),
                title: TextField(
                  
                  controller: commentController,
                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: ('Comment')),
                ),
                trailing: ElevatedButton(onPressed: () {  },
                child: Text('Add')),
              ),
            ),
            appBar: AppBar(
              title: Text("Comments"),
            ),

            //bottomNavigationBar: ,
            body: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (itemBuilder, index) {
                  return Comment(
                      profileIdFk: 0,
                      username: comments[index]['username'],
                      comment: comments[index]['comment'],
                      date: comments[index]['date'],
                      time: comments[index]['time']);
                }),
          );
        });
  }
}
