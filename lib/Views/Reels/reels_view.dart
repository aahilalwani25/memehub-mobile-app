import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/post/post_bloc.dart';
import '../../Models/reels_list.dart';
import 'package:flutter/material.dart';
//import 'package:reels_viewer/reels_viewer.dart';
import './reels_viewer.dart';

class Reels_View extends StatefulWidget {
  int my_profile_id;
  Reels_View({super.key, required this.my_profile_id});

  @override
  State<Reels_View> createState() => _Reels_ViewState();
}

class _Reels_ViewState extends State<Reels_View> {
  late PostBloc _postBloc;

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
          final reelsDataList = fetchReels(state.postDataList!);
          print(reelsDataList[0].url);
          return ReelsViewer(
            reelsList: reelsDataList,
            appbarTitle: 'Meme Reels',
            onShare: (url) {
              log('Shared reel url ==> $url');
            },
            onLike: (url) {
              log('Liked reel url ==> $url');
            },
            onFollow: () {
              log('======> Clicked on follow <======');
            },
            onComment: (comment) {
              log('Comment on reel ==> $comment');
            },
            onClickMoreBtn: () {
              log('======> Clicked on more option <======');
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
}
