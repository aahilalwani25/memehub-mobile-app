import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Shared_Post extends StatelessWidget {
  String? post_description, shared_description, shared_username, post_username, shared_time, post_usertime;
  Shared_Post({super.key, required this.post_description, required this.shared_description, required this.shared_username, required this.post_username, required this.shared_time, required this.post_usertime});

  @override
  Widget build(BuildContext context) {
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
              )
              // Text('$id'),
            ],
          ),
        ),
        ListTile(
          title: Text(post_description!),
        ),
        Image.network('https://picsum.photos/250?image=9'),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => {
                  
                },
                child: const Icon(Icons.emoji_emotions_outlined),
                
                
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.chat_bubble_outline_sharp),
                onPressed: () {},
              )
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.send_sharp),
                onPressed: () {
                  
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
  }
}