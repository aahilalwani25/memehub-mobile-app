import 'package:flutter/material.dart';

class SinglePost extends StatelessWidget {
  final String? imageUrl, description; 
  final int post_id_fk, profile_id_fk;
  SinglePost({super.key, this.description=null,this.imageUrl=null, required this.post_id_fk, required this.profile_id_fk});

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
          title: Text(description!),
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
  }
}