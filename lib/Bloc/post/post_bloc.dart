import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memehub_mobile_app/Controllers/add_media_controller.dart';
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
      final url = Uri.parse(
          'http://${dotenv.env['IP_ADDRESS']}:8000/api/user/profile/post');

      var request = http.MultipartRequest('POST', url);

      // Add the image file to the request
      request.files.add(
        await http.MultipartFile.fromPath('image', event.imageFile!.path),
      );

      request.fields.addAll({
        "description": event.description!,
      });
      var response = await request.send();

      if (response.statusCode == 200) {
        emit(PostSuccessfullyState());
      } else {
        print('Image upload failed');
      }
    });
  }
}
