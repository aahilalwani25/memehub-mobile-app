import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memehub_mobile_app/Controllers/media_controller.dart';
import 'package:http/http.dart' as http;
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<PrivacyButtonPressedEvent>((event, emit) {
      emit(PrivacyChangedState(privacy: event.privacy));
    });

    on<AddPhotoButtonPressed>((event, emit) async {
      final media = AddMediaController();

      File image = await media.getImageFromGallery();

      emit(PhotoAddedState(photoFile: image));
      // await media.getImageFromGallery().then((value){
      //   emit(PhotoAddedState(photoFile: value));
      // });
    });

    on<PostButtonPressedEvent>((event, emit) async {
      try {
        final url = Uri.parse(
            'http://${dotenv.env['IP_ADDRESS']}:8000/api/user/profile/post');

        var request = http.MultipartRequest('POST', url);
        print(event.imageFile!.path);
        request.headers.addAll({'Content-Type': 'multipart/form-data'});
        // Add the image file to the request
        request.fields["description"] = event.description!;
        request.fields["profile_id_fk"] = '2';
        request.files.add(
          await http.MultipartFile.fromPath('image', event.imageFile!.path),
        );
        request.send().then((response) {
          http.Response.fromStream(response).then((onValue) {
            try {
              // get your response here...
              print(onValue.statusCode);
              print(onValue.body);
          emit(PostSuccessfullyState());
            } catch (e) {
              // handle exeption
            }
          });
        });

        
        // } else {
        //   print(response.statusCode);
        //   print((response));
        // }
      } catch (e) {
        print("error: $e");
      }
    });

    on<PostFetchedEvent>((event, emit) async {
      //print('message');
      final url = Uri.parse(
          'http://${dotenv.env['IP_ADDRESS']}:8000/api/user/profile/all-post');

      final response = await http.post(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == 200) {
          List<dynamic> postDataList = data['\$data'];
          print(postDataList);

          emit(PostFetchedState(postDataList: postDataList));
          //print(postDataList);

          // for (var postData in postDataList) {
          //   final id =
          //       postData['id'] as int; // Access 'id' directly as an integer
          //   final description = postData['description'];
          //   final privacy = postData['privacy'];

          //   // Do something with id, description, and privacy here
          //   print('ID: $id, Description: $description, Privacy: $privacy');
          // }
        }
      } else {
        // print(response.body);
        //   emit(const AuthenticationFailure(
        //       error: 'Either username or password is wrong'));
      }
    });
  }
}
