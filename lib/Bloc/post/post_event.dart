part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PrivacyButtonPressedEvent extends PostEvent{

  String privacy;
  PrivacyButtonPressedEvent({required this.privacy});

  @override
  List<Object> get props => [privacy];
}

class AddPhotoButtonPressed extends PostEvent{}

class PostButtonPressedEvent extends PostEvent{
  File? imageFile;
  int id;
  String? description;
  

  PostButtonPressedEvent({required this.imageFile, this.description, required this.id});
  // @override
  // List<Object?> get props => [imageFile, description];
}

class PostFetchedEvent extends PostEvent{
}
