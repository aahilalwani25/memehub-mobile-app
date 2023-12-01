import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:memehub_mobile_app/Bloc/Reactions/reaction_bloc.dart';
// import 'package:memehub_mobile_app/Bloc/Reactions/reaction_event.dart';
// import 'package:memehub_mobile_app/Bloc/Reactions/reaction_state.dart';
import 'package:memehub_mobile_app/Bloc/post/post_bloc.dart';
import 'package:http/http.dart' as http;

class SinglePost extends StatefulWidget {
  final String? imageUrl, description;
  final int post_id_fk, profile_id_fk;
  int reaction = 0;

  SinglePost({
    Key? key,
    this.description,
    this.imageUrl,
    required this.post_id_fk,
    required this.profile_id_fk,
  }) : super(key: key);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
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
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('John Doe'),
                            Row(
                              children: [
                                Text('October 31, 2023'),
                                Text('\t12:00 PM'),
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
              Image.network('https://picsum.photos/250?image=9'),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      
                        onTap: () async {
                          //single tap
                          // context.read<PostBloc>().add(ReactionEvent(
                          //       reaction_type_id_fk: 1, //haha
                          //       post_id_fk: widget.post_id_fk,
                          //       profile_id_fk: widget.profile_id_fk,
                          //     ));
                          changeReaction(1);
                        },
                        onDoubleTap: () {
                          //double tap
                          // context.read<PostBloc>().add(ReactionEvent(
                          //       reaction_type_id_fk: 1, //heart
                          //       post_id_fk: widget.post_id_fk,
                          //       profile_id_fk: widget.profile_id_fk,
                          //     ));
                          changeReaction(2);
                        },
                        child: widget.reaction == 1
                            ? Icon(
                                Icons.emoji_emotions_outlined,
                                color: Colors.yellow,
                              )
                            : (widget.reaction == 2)
                                ? Icon(Icons.heart_broken)
                                : Icon(
                                    Icons.emoji_emotions_outlined,
                                  )),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.chat_bubble_outline_sharp),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.send_sharp),
                      onPressed: () {},
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

  void changeReaction(int id) async {
    final response = await http.post(
      Uri.parse(
          'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/profile/add-reaction'),
      headers: {'Accept': 'application/json'},
      body: {
        'post_id_fk': widget.post_id_fk.toString(),
        'profile_id_fk': widget.profile_id_fk.toString(),
        'reaction_type_id_fk': id.toString()
      },
    );
    Map<String, dynamic> data = json.decode(response.body);

    if (data['status'] == 200 && data['response'] == true) {
      print(data);

      setState(() {
        widget.reaction = 1;
      });
    }
    if (data['status'] == 201 && data['response'] == false) {
      print(data);

      setState(() {
        widget.reaction = 2;
      });
    }
  }
}
