import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/post/post_bloc.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    //context.read<PostBloc>().add(PostFetchedEvent());
    return Scaffold(
      body: BlocProvider<PostBloc>(
        create: (context)=>
          PostBloc()..add(PostFetchedEvent()),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  (state is PostFetchedState)?
                  Column(
                    children: [
                      ListTile(
                        title: Text('${state.postDataList![0]['id']}'),
                      ),

                      (state.postDataList![0]['type']=="image")?
                        Image.network("https://picsum.photos/250"):
                      ListTile(
                        title: Text('${state.postDataList![1]['description']}'),
                      )
                    ],
                  )
                  :
                  const SizedBox(
                    width: 28,
                  ),
                  
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
