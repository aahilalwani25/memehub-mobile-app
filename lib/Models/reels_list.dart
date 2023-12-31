import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reels_viewer/reels_viewer.dart';
import '../Models/reel_model.dart';

List<Reel_Model> fetchReels(List<dynamic> postDataList, int my_profile_id) {
  List<Reel_Model> reelsList = [];
  for (var reel in postDataList) {
    int post_id_fk = reel['post_id_fk'] as int;
    //int profile_id_fk = reel['profile_id_fk'];
    String description = reel['description'].toString();
    //String type = reel['type'];
    String username = reel['username'];
    String updated_at = reel['updated_at'];
    String extension = reel['extention'];
    String? profile_img_url= reel['profile_img_url'];
    var url = (reel['url'].toString().split('/'));
    String reaction_type_id_fk= reel['reaction_type_id_fk'].toString();

    

    if (extension == "mp4") {
      String video_url =
        'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/${url[6]}/${url[7]}';
      reelsList.add(
        Reel_Model(
          video_url,
          username,
          my_profile_id: my_profile_id.toString(),
          //musicName: 'In the name of Love',
          reelDescription: description,
          profileUrl: profile_img_url,
          updated_at: updated_at,
          post_id_fk: post_id_fk.toString(),
          reaction_type_id_fk: reaction_type_id_fk,
        ),
      );

      //print(reelsList[0].url);
    }
  }
  return reelsList;
}

