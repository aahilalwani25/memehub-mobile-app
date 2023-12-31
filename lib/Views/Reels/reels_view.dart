import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/post/post_bloc.dart';
import '../../Controllers/comment_controller.dart';
import '../../Models/reels_list.dart';
import 'package:flutter/material.dart';
//import 'package:reels_viewer/reels_viewer.dart';
import '../../global/components/toast_message.dart';
import '../Comment/single_comment.dart';
import './reels_viewer.dart';

class Reels_View extends StatefulWidget {
  int my_profile_id;
  Reels_View({super.key, required this.my_profile_id});

  @override
  State<Reels_View> createState() => _Reels_ViewState();
}

class _Reels_ViewState extends State<Reels_View> {
  late PostBloc _postBloc;
  CommentController _commentController = CommentController();
  bool is_loading_fetch_comments = true;
  List<dynamic>? comments = [];
  TextEditingController commenTextController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postBloc = PostBloc()..add(PostFetchedEvent(is_reel: 'true', profile_id_fk: widget.my_profile_id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBloc>(
      create: (context) => _postBloc,
      child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        if (state is PostFetchedState) {
          final reelsDataList = fetchReels(state.postDataList!, widget.my_profile_id);
          //print(reelsDataList[0].videoUrl);
          return ReelsViewer(
            reelsList: reelsDataList,
            appbarTitle: 'Meme Reels',
            onShare: (url) {
              log('Shared reel url ==> $url');
            },
            onLike: (url) {
              print('Liked reel url ==> $url');
            },
            
            onComment: (post_id_fk, my_profile_id) {
              //show(context, int.parse(post_id_fk));
            },
            onClickMoreBtn: () {
              print('======> Clicked on more option <======');
            },
            onClickBackArrow: () {
              log('======> Clicked on back arrow <======');
            },
            onIndexChanged: (index) {
              log('======> Current Index ======> $index <========');
            },
            showProgressIndicator: true,
            showVerifiedTick: true,
            showAppbar: true,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
  
  @override
  void dispose() {
    // Clean up resources, subscriptions, and references here
    super.dispose();
  }
  
}
