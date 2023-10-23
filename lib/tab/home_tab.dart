// 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/post/post_bloc.dart';

class home extends StatelessWidget {
  const home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PostBloc>(
        create: (context) => PostBloc()..add(PostFetchedEvent()), // Use FetchPostsEvent to start data fetching
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostFetchedState) {
              final postDataList = state.postDataList;
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: postDataList!.map((postData) {
                    final id = postData['id'] as int;
                    final description = postData['description'];
                    final type = postData['type'];
                    final imageUrl = postData['url'];

                    if (type == "image") {
                      return Column(
                        children: [
                          ListTile(
                            title: Text('ID: $id'),
                          ),
                          ListTile(
                            title: Text('description: ${description}'),
                          ),
                          Image.network(imageUrl),
                        ],
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
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}