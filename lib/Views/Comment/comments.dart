import 'package:flutter/material.dart';
import 'package:memehub_mobile_app/Controllers/comment_controller.dart';
import 'package:memehub_mobile_app/Views/Comment/single_comment.dart';
import 'package:memehub_mobile_app/global/components/toast_message.dart';

class Comments {

  TextEditingController commenTextController= TextEditingController();
  final _formkey= GlobalKey<FormState>();
  String? post_id_fk;
  CommentController _commentController= CommentController();

  Comments({required post_id_fk});

  List comments = [
    {
      'username': 'aahil',
      'comment': 'This is so funny',
      'date': '20 Nov 2023',
      'time': '22:22pm',
      'user_profile_image': "assets/images/profilepic1.jpg",
    },
    {
      'username': 'ayub latif',
      'comment': 'This is not funny',
      'date': '20 Nov 2023',
      'time': '22:22pm',
      'user_profile_image': "assets/images/profilepic1.jpg",
    },
    {
      'username': 'ayub latif',
      'comment': 'This is not funny',
      'date': '20 Nov 2023',
      'time': '22:22pm',
      'user_profile_image': "assets/images/profilepic1.jpg",
    },
    {
      'username': 'ayub latif',
      'comment': 'This is not funny',
      'date': '20 Nov 2023',
      'time': '22:22pm',
      'user_profile_image': "assets/images/profilepic1.jpg",
    },
    {
      'username': 'ayub latif',
      'comment': 'This is not funny',
      'date': '20 Nov 2023',
      'time': '22:22pm',
      'user_profile_image': "assets/images/profilepic1.jpg",
    }
  ];

  void show(BuildContext context, String postId) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Form(
            key: _formkey,
            child: Scaffold(
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom:50),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage('assets/images/profilepicture.jpeg'),
                  ),
                  title: TextFormField(
                    validator: (value){
                      
                      if(value!.isEmpty){
                        return "No Comment";
                      }
                      return null;
                    },
                    controller: commenTextController,
                    decoration: InputDecoration(border: OutlineInputBorder(), hintText: ('Comment')),
                  ),
                  trailing: ElevatedButton(onPressed: () { 
                    if(_formkey.currentState!.validate()){
                      //add comment
                      _commentController.addComment(commenTextController.text, post_id_fk!)
                      .then((value){
                        if(value){
                          ToastMessage(context: context, message: "Added comment", type: "success");
                        }
                      });
                    }
                   },
                  child: Text('Post')),
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
            ),
          );
        });
  }
}
