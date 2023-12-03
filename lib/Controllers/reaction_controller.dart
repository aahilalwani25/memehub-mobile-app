import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ReactionController{

  Future<int> addReaction(int reactionId, int postIdFk, int profileIdFk) async {
    final response = await http.post(
      Uri.parse(
          'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/profile/add-reaction'),
      headers: {'Accept': 'application/json'},
      body: {
        'post_id_fk': postIdFk.toString(),
        'profile_id_fk': profileIdFk.toString(),
        'reaction_type_id_fk': reactionId.toString()
      },
    );
    Map<String, dynamic> data = json.decode(response.body);

    if (data['status'] == 200 && data['response'] == true) {
      print(data);

      return reactionId;
    }
    if (data['status'] == 201 && data['response'] == false) {
      print(data);

      return reactionId;
    }

    return 0;
  }
}