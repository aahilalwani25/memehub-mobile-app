import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memehub_mobile_app/Controllers/comment_controller.dart';
import 'package:memehub_mobile_app/Views/Comment/single_comment.dart';
import 'package:memehub_mobile_app/global/components/toast_message.dart';

class Comments {
  TextEditingController commenTextController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  int post_id_fk, profile_id;
  CommentController _commentController = CommentController();
  bool is_loading_fetch_comments = true;

  Comments({required this.post_id_fk, required this.profile_id});

  List<dynamic>? comments = [
    // {
    //   'username': 'aahil',
    //   'comment': 'This is so funny',
    //   'date': '20 Nov 2023',
    //   'time': '22:22pm',
    //   'user_profile_image': "assets/images/profilepic1.jpg",
    // },
    // {
    //   'username': 'ayub latif',
    //   'comment': 'This is not funny',
    //   'date': '20 Nov 2023',
    //   'time': '22:22pm',
    //   'user_profile_image': "assets/images/profilepic1.jpg",
    // },
    // {
    //   'username': 'ayub latif',
    //   'comment': 'This is not funny',
    //   'date': '20 Nov 2023',
    //   'time': '22:22pm',
    //   'user_profile_image': "assets/images/profilepic1.jpg",
    // },
    // {
    //   'username': 'ayub latif',
    //   'comment': 'This is not funny',
    //   'date': '20 Nov 2023',
    //   'time': '22:22pm',
    //   'user_profile_image': "assets/images/profilepic1.jpg",
    // },
    // {
    //   'username': 'ayub latif',
    //   'comment': 'This is not funny',
    //   'date': '20 Nov 2023',
    //   'time': '22:22pm',
    //   'user_profile_image': "assets/images/profilepic1.jpg",
    // }
  ];

  void show(BuildContext context) {
    print(post_id_fk);
    _commentController.fetchComments(post_id_fk.toString()).then((value) {
      print(value);
      comments = value;
      is_loading_fetch_comments = false;
    });
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Form(
            key: _formkey,
            child: Scaffold(
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage('assets/images/profilepicture.jpeg'),
                  ),
                  title: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "No Comment";
                      }
                      return null;
                    },
                    controller: commenTextController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: ('Comment')),
                  ),
                  trailing: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          //add comment
                          print(commenTextController.text);
                          print(post_id_fk);
                          print(profile_id);
                          _commentController
                              .addComment(commenTextController.text, post_id_fk,
                                  profile_id)
                              .then((value) {
                            if (value) {
                              ToastMessage(
                                      context: context,
                                      message: "Added comment",
                                      type: "success")
                                  .show();
                            }
                          });
                          _commentController
                              .fetchComments(post_id_fk.toString())
                              .then((value) {
                            comments = value;
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
              body: (comments!.isNotEmpty)
                  ? ListView.builder(
                      itemCount: comments!.length,
                      itemBuilder: (itemBuilder, index) {
                        return Comment(
                            profileIdFk: 0,
                            username: comments![index]['username'],
                            comment: comments![index]['description'],
                            date: comments![index]['updated_at'],
                            time: comments![index]['updated_at']);
                      })
                  : (is_loading_fetch_comments)
                      ? Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                CircularProgressIndicator(),
                                Text("Loading...")
                              ]),
                      )
                      : Center(
                          child: Text("No Comments"),
                        ),
            ),
          );
        });
  }


}
