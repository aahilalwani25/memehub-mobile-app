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
      emit(postuploadloading());
      try {
        print(event.description);
        final client = http.Client();
        final url = Uri.parse(
            'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/profile/post');

        var request = http.MultipartRequest('POST', url);
        print(event.imageFile!.path);
        request.headers.addAll({
          'Content-Type': 'multipart/form-data',
          "Accept": "application/json"
        });
        // Add the image file to the request
        request.fields["description"] = event.description!;
        request.fields["profile_id_fk"] = event.id.toString();
        request.files.add(await http.MultipartFile.fromPath(
          'image', event.imageFile!.path,
          // contentType: MediaType('image', 'jpeg')
        ));

        var res= await client.send(request);

        if(res.statusCode==200){
          var r= await http.Response.fromStream(res);
          if(r.statusCode==200){
            print("success");
            emit(PostSuccessfullyState());
          }
        }else{
          print(res.statusCode);
          
        }
        // client.send(request).then((response) {
        //   http.Response.fromStream(response).then((onValue) {
        //     try {
        //       // get your response here...
        //       if (onValue.statusCode == 200) {
        //         print("Success");
        //         emit(PostSuccessfullyState());
        //       } else {
        //         print(onValue.statusCode);
        //         print(onValue.body);
        //         //throw Exception(onValue.body);
        //       }
        //     } catch (e) {
        //       // handle exeption
        //       print(e);
        //     }
        //   });
        // });
      } catch (e) {
        print("error: $e");
      }
    });

    on<PostFetchedEvent>((event, emit) async {
      //print('message');
      final url = Uri.parse(
          'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/profile/all-post');

      final response = await http.post(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == 200) {
          List<dynamic> postDataList = data['\$data'];
          //print(postDataList);

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
    on<ReactionEvent>((event, emit) async {
      print(event.post_id_fk);
      print(event.profile_id_fk);
      print(event.reaction_type_id_fk);
      final response = await http.post(
        Uri.parse(
            'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/profile/add-reaction'),
        headers: {'Accept': 'application/json'},
        body: {
          'post_id_fk': event.post_id_fk.toString(),
          'profile_id_fk': event.profile_id_fk.toString(),
          'reaction_type_id_fk': event.reaction_type_id_fk.toString()
        },
      );
      Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == 200 && data['response'] == true) {
        print(data);

        emit(ReactionState(reaction_type_id_fk: event.reaction_type_id_fk));
      }
      if (data['status'] == 201 && data['response'] == false) {
        print(data);
        emit(ReactionState(reaction_type_id_fk: event.reaction_type_id_fk));
      }
    });
  }
}
