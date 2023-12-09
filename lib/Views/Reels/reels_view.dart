import 'dart:developer';
import '../../Models/reels_list.dart';
import 'package:flutter/material.dart';
import 'package:reels_viewer/reels_viewer.dart';

class Reels_View extends StatefulWidget {
  const Reels_View({super.key});

  @override
  State<Reels_View> createState() => _Reels_ViewState();
}

class _Reels_ViewState extends State<Reels_View> {
  @override
  Widget build(BuildContext context) {
    return ReelsViewer(
      reelsList: reelsList,
      appbarTitle: 'Instagram Reels',
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
      onIndexChanged: (index){
        log('======> Current Index ======> $index <========');
      },
      showProgressIndicator: true,
      showVerifiedTick: true,
      showAppbar: true,
    );
  
  }
}