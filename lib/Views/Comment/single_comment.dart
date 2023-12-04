import 'package:flutter/material.dart';
//import 'package:memehub_mobile_app/global/styles.dart';

class Comment extends StatefulWidget {
  final int profileIdFk;
  final String username, comment, date, time;

  Comment(
      {super.key,
      required this.profileIdFk,
      required this.username,
      required this.comment,
      required this.date,
      required this.time});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    //Styles styles = Styles(context: context);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                          Column(
                            children: [
                              Text(
                                widget.comment,
                                style: const TextStyle(color: Colors.black),
                              ),
                              // Row(children: [
                              //   GestureDetector(
                              //     child: Text('Haha'),
                              //   ),
                              //   GestureDetector(
                              //     child: Text('Reply'),
                              //   )
                              // ],)
                              Text(
                                widget.date,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
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
          ],
        ));
  }
}
