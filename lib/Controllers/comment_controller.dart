import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CommentController{

  Future<bool> addComment(String comment, String post_id_fk) async{
    //add the comment to database here
    final url = Uri.parse(
          'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/profile/all-post');

      final response = await http.post(url,
      body: {
        "comment": comment,
        "pos_id_fk": post_id_fk
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == 200) {
          return true;
        }
      }

      return false;
    
  }


  Future<List?> fetchComments(String post_id_fk) async{
    final url = Uri.parse(
          'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/profile/all-post');

      final response = await http.post(url,
      body: {
        "post_id_fk": post_id_fk,
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == 200) {
          List<dynamic> commentsDataList = data['\$comments'];
          return commentsDataList;
        }
      }

      return null;
  }
}