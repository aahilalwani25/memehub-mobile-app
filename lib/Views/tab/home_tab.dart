//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/post/post_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                    String imageUrl = postData['url'];
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
                                  // const CircleAvatar(
                                  //   radius: 20,
                                  //   backgroundImage: AssetImage(
                                  //       'assets/images/profilepicture.jpeg'),
                                  // ),
                                  Text('$id'),
                                ],
                              ),
                            ),
                            ListTile(
                              title: Text(description),
                            ),
                            
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
