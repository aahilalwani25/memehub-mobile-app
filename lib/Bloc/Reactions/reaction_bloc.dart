import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memehub_mobile_app/Bloc/Reactions/reaction_event.dart';
import 'package:memehub_mobile_app/Bloc/Reactions/reaction_state.dart';
import 'package:memehub_mobile_app/Controllers/media_controller.dart';
import 'package:http/http.dart' as http;

class ReactionBloc extends Bloc<ReactionEvent, ReactionState> {
  ReactionBloc() : super(ReactionInitial()) {
    on<ReactionEvent>((event, emit) {
      // TODO: implement event handler
    });

    

    
    on<ReactionChangedEvent>((event, emit) async {
      print(event.post_id_fk);
      print(event.profile_id_fk);
      print(event.reaction_type_id_fk);
      final response = await http.post(
        Uri.parse(
            'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/profile/add-reaction'),
        headers: {'Accept': 'application/json'},
        body: {
          'Reaction_id_fk': event.reaction_type_id_fk.toString(),
          'profile_id_fk': event.profile_id_fk.toString(),
          'reaction_type_id_fk': event.reaction_type_id_fk.toString()
        },
      );
      Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == 200 && data['response'] == true) {
        print(data);

        emit(ReactionChangedState(reaction_type_id_fk: event.reaction_type_id_fk));
      }
      if (data['status'] == 201 && data['response'] == false) {
        emit(ReactionChangedState(reaction_type_id_fk: event.reaction_type_id_fk));
      }
    });
  }
}
