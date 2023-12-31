//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memehub_mobile_app/Bloc/post/post_bloc.dart';
import 'package:memehub_mobile_app/Controllers/reaction_controller.dart';
import 'package:memehub_mobile_app/Views/shared_post_view.dart';
import 'package:memehub_mobile_app/global/styles.dart';
//import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../Controllers/comment_controller.dart';
import '../../Views/Comment/comments.dart';
import '../../Views/Comment/single_comment.dart';
import 'toast_message.dart';

class SinglePost extends StatefulWidget {
  final ReactionController reactionController = ReactionController();
  String? imageUrl, description, username, updated_at, reaction_type_id_fk;
  final int post_id_fk, profile_id_fk, my_profile_id;

  //final String name;
  //final int id;
  TextEditingController descriptionController = TextEditingController();
  int reaction = 0;
  //final privacies = ['Public', 'Private'];

  SinglePost(
      {Key? key,
      this.description,
      this.imageUrl,
      required this.post_id_fk,
      required this.profile_id_fk,
      required this.reaction_type_id_fk,
      //required this.name,
      //required this.id,
      required this.username,
      required this.my_profile_id,
      required this.updated_at})
      : super(key: key);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  CommentController _commentController = CommentController();
  bool is_loading_fetch_comments = true;
  List<dynamic>? comments = [];
  TextEditingController commenTextController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fetchComments();
  }

  void fetchComments() {
    _commentController
        .fetchComments(widget.post_id_fk.toString())
        .then((value) {
      setState(() {
        comments = value;
        is_loading_fetch_comments = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (BuildContext context, PostState state) {
        return Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              ListTile(
                title: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage('assets/images/profilepicture.jpeg'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.username.toString()),
                            Row(
                              children: [
                                Text(formatDate(widget.updated_at!)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: const Icon(Icons.more_horiz),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(widget.description!),
              ),
              Image.network(
                widget.imageUrl!,
                width: 300,
                height: 300,
              ),
              Row(
                children: [
                  Expanded(
                    //width: 125,
                    child: InkWell(
                      onTap: () {
                        // Show loading state
                        setState(() {
                          widget.reaction_type_id_fk =
                              '-1'; // Use a value that represents loading
                        });

                        widget.reactionController
                            .addReaction(
                                1, widget.post_id_fk, widget.profile_id_fk)
                            .then((value) {
                          setState(() {
                            widget.reaction_type_id_fk = value.toString();
                          });
                        });
                      },
                      onDoubleTap: () {
                        // Show loading state
                        setState(() {
                          widget.reaction_type_id_fk =
                              '-1'; // Use a value that represents loading
                        });

                        widget.reactionController
                            .addReaction(
                                2, widget.post_id_fk, widget.profile_id_fk)
                            .then((value) {
                          setState(() {
                            widget.reaction_type_id_fk = value.toString();
                          });
                        });
                      },
                      child: buildReactionIcon(widget.reaction_type_id_fk),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.chat_bubble_outline_sharp),
                      onPressed: () {
                        show(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.send_sharp),
                      onPressed: () {
                        Shared_Post(
                          postId: widget.post_id_fk,
                          username: widget.username!,
                          originalPostDescription: widget.description,
                          image: Image.network(
                            widget.imageUrl!,
                            width: 50,
                            height: 50,
                          ),
                        ).show(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  String formatDate(String dateTime) {
    String originalDateString = dateTime;

    // Parse the original date string
    DateTime originalDate = DateTime.parse(originalDateString);

    // Format the date and time in the desired format
    String formattedDateTime =
        DateFormat('dd MMMM yyyy, HH:mm:ss').format(originalDate);

    return (formattedDateTime); // Output: 24 October 2023, 00:43:45
  }

  Widget buildReactionIcon(String? reaction_type_id_fk) {
    if (widget.reaction_type_id_fk == '1') {
      return Icon(
        Icons.emoji_emotions_outlined,
        color: Colors.yellow,
      );
    } else if (widget.reaction_type_id_fk == '2') {
      return Icon(Icons.heart_broken);
    } else if (widget.reaction_type_id_fk == '-1') {
      return SizedBox(
          width: 2,
          height: 50,
          child: CircularProgressIndicator()); // Loading indicator
    } else {
      return Icon(Icons.emoji_emotions_outlined);
    }
  }

  void show(BuildContext context) {
    // print(post_id_fk);
    fetchComments();
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

                          _commentController
                              .addComment(commenTextController.text,
                                  widget.post_id_fk, widget.my_profile_id)
                              .then((value) {
                            if (value) {
                              ToastMessage(
                                      context: context,
                                      message: "Added comment",
                                      type: "success")
                                  .show();
                            }
                          });
                          commenTextController.clear();
                          fetchComments();
                        }
                      },
                      child: Text('Post')),
                ),
              ),
              appBar: AppBar(
                title: Text("Comments"),
              ),

              //bottomNavigationBar: ,
              body: (comments!.isNotEmpty && is_loading_fetch_comments == false)
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

  @override
  void dispose() {
    // Clean up resources, subscriptions, and references here
    super.dispose();
  }
}
