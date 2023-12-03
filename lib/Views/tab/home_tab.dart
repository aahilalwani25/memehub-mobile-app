import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memehub_mobile_app/Views/notification_services.dart';
import 'package:memehub_mobile_app/global/components/single_post.dart';
import '../../Bloc/post/post_bloc.dart';

class Home extends StatefulWidget {
  final int profile_id;
  const Home({Key? key, required this.profile_id}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PostBloc _postBloc;
 NotificationServices notificationServices = NotificationServices();


  @override
  void initState() {
     super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();

    notificationServices.getDeviceToken().then((value){
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
    _postBloc = PostBloc()..add(PostFetchedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PostBloc>(
        create: (context) => _postBloc,
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
                    print(postData);
                    int id = postData['id'] as int;
                    int post_id_fk = postData['post_id_fk'] as int;
                    //int profile_id_fk = postData['profile_id_fk'];
                    String description = postData['description'].toString();
                    String type = postData['type'];
                    String imageUrl = postData['url'];
                    String username= postData['username'];

                    if (type == "image") {
                      return SinglePost(
                        description: description,
                        imageUrl: imageUrl,
                        post_id_fk: post_id_fk,
                        profile_id_fk: widget.profile_id,
                        username: username,
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

  @override
  void dispose() {
    _postBloc.close();
    super.dispose();
  }
}
