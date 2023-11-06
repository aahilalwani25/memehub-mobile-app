import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AddHomieButtonPressed>((event, emit) async {
      emit(Loading());
      Uri uri = Uri.parse(
          "http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/friend/request");
      final Response response = await http.post(
        uri,
        headers: {'Accept': 'application/json'},
        body: {
          "my_friend_profile_id": event.my_homie_id_fk.toString(),
          "my_profile_id": event.my_profile_id_fk.toString()
        },
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        print(body);
        if (body["message"]) {
          emit(HomieRequestedState());
        }
      }
    });
  }
}
