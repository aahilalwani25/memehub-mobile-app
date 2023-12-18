import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memehub_mobile_app/Bloc/Reels/reels_state.dart';
import 'package:memehub_mobile_app/Controllers/media_controller.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'reels_event.dart';
// part 'reels_state.dart';
// part 'reels_event.dart';


class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  ReelsBloc() : super(ReelsInitial()) {
    on<ReelsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ReelsFetchedEvent>((event, emit) async{
      final url = Uri.parse(
          'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/profile/all-post');

      final response = await http.post(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == 200) {
          List<dynamic> postDataList = data['\$data'];
          //print(postDataList);

          emit(ReelsFetchedState(reelsDataList: postDataList));
          
        }
      } else {
        // print(response.body);
        //   emit(const AuthenticationFailure(
        //       error: 'Either username or password is wrong'));
      }
    });
  }
  }