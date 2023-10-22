import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  //File _file;
  PostBloc() : super(PostInitial()) {
    on<PostEvent>((event, emit) {
      // TODO: implement event handler
    });


    on<PrivacyButtonPressedEvent>((event, emit){
      emit(PrivacyChangedState(privacy: event.privacy));
    });

    on<AddPhotoButtonPressed>((event, emit){

    });
  }
}
