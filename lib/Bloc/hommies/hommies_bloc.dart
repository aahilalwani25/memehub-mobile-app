import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../Models/Hommie.dart';

part 'hommies_event.dart';
part 'hommies_state.dart';

class HommiesBloc extends Bloc<HommiesEvent, HommiesState> {
  HommiesBloc() : super(HommiesInitial()) {
    on<HommiesEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HommiesFetchedEvent>((event, emit)async{
      emit(HommieLoading());
      final url = Uri.parse(
          'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/friend/friendlist');

      final response = await http.post(url,
      headers: {
        // "Content-Type": "application/json",
        'Accept': 'application/json',
      },
      body: {
        "my_profile_id": "4"
      });
      print(response.statusCode);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == "200") {
          List<dynamic> hommiesList = data['list'];
          print(hommiesList);
          emit(HommieFetchedState(hommies: hommiesList));
        }
      }
    });
  }
}
