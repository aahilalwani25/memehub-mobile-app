import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/post/post_bloc.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PostBloc>(
        create: (context) => PostBloc()
          ..add(
              PostFetchedEvent()), // Use FetchPostsEvent to start data fetching
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostFetchedState) {
              final postDataList = state.postDataList;
              //print(postDataList);
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: postDataList!.map((postData) {
                    int id = postData['id'] as int;
                    String description = postData['description'];
                    String type = postData['type'];
                    //String imageUrl = postData['url'];
                    //print(id);

                    if (type == "image") {
                      return Card(
                        color: Colors.white,
                        shadowColor: Colors.grey,
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Column(
                          children: [
                            ListTile(
                              title: Row(
                                children: [
                                   const CircleAvatar(
                                     radius: 20,
                                     backgroundImage: AssetImage(
                                         'assets/images/profilepicture.jpeg'),
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
                                    child:const Icon(Icons.more_horiz) ,
                                   )
                                  // Text('$id'),
                                ],
                              ),
                            ),
                            ListTile(
                              title: Text(description),
                            ),
                            Image.network('https://picsum.photos/250?image=9'),
                          ],
                        ),
                      );
                    } else {
                      return ListTile(
                        title: Text('ID: $id'),
                        subtitle: Text(description),
                      );
                    }
                  }).toList(),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
