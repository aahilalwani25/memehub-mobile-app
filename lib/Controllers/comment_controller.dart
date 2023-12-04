import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CommentController {
  Future<bool> addComment(
      String comment, int post_id_fk, int profile_id) async {
    //add the comment to database here
    final url = Uri.parse(
        'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/posts/create-comments');

    final response = await http.post(url, body: {
      "post_id": post_id_fk.toString(),
      "profile_id": profile_id.toString(),
      "description": comment
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      if (data['message'] == "Comment created successfully") {
        return true;
      }
    }

    return false;
  }

  Future<List?> fetchComments(String post_id_fk) async {
    final url = Uri.parse(
        'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/posts/${post_id_fk}/comments');

    final response = await http.post(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      List<dynamic> commentsDataList = data['comments'];
        return commentsDataList;
    }

    return null;
  }
}
