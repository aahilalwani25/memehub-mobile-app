import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reels_viewer/reels_viewer.dart';

List<ReelModel> fetchReels(List<dynamic> postDataList) {
  List<ReelModel> reelsList = [];
  for (var reel in postDataList) {
    int post_id_fk = reel['post_id_fk'] as int;
    //int profile_id_fk = postData['profile_id_fk'];
    String description = reel['description'].toString();
    String type = reel['type'];
    String username = reel['username'];
    String updated_at = reel['updated_at'];
    String extension = reel['extention'];
    var url = (reel['url'].toString().split('/'));
    

    if (type == "image" && extension == "mp4") {
      String video_url =
        'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/${url[6]}/${url[7]}';
      reelsList.add(
        ReelModel(
          video_url,
          username,
          
          //musicName: 'In the name of Love',
          reelDescription: description,
          profileUrl:
              'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
        ),
      );

      //print(reelsList[0].url);
    }
  }
  return reelsList;
}

// List<ReelModel> reelsList = [
//   ReelModel(
//       'https://assets.mixkit.co/videos/preview/mixkit-tree-with-yellow-flowers-1173-large.mp4',
//       'Darshan Patil',
//       likeCount: 2000,
//       isLiked: true,
//       musicName: 'In the name of Love',
//       reelDescription: "Life is better when you're laughing.",
//       profileUrl:
//           'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
//       commentList: [
//         ReelCommentModel(
//           comment: 'Nice...',
//           userProfilePic:
//               'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
//           userName: 'Darshan',
//           commentTime: DateTime.now(),
//         ),
//         ReelCommentModel(
//           comment: 'Superr...',
//           userProfilePic:
//               'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
//           userName: 'Darshan',
//           commentTime: DateTime.now(),
//         ),
//         ReelCommentModel(
//           comment: 'Great...',
//           userProfilePic:
//               'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
//           userName: 'Darshan',
//           commentTime: DateTime.now(),
//         ),
//       ]),
//   ReelModel(
//     'https://assets.mixkit.co/videos/preview/mixkit-father-and-his-little-daughter-eating-marshmallows-in-nature-39765-large.mp4',
//     'Rahul',
//     musicName: 'In the name of Love',
//     reelDescription: "Life is better when you're laughing.",
//     profileUrl:
//         'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
//   ),
//   ReelModel(
//     'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
//     'Rahul',
//   ),
// ];
