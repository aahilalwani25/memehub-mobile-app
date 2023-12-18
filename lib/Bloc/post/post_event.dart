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
class AddVideoButtonPressed extends PostEvent{}

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

class SharedButtonPressed extends PostEvent{}

class ReactionEvent extends PostEvent{
  
  int post_id_fk=0;
int profile_id_fk=0;
int reaction_type_id_fk=0;
   
 ReactionEvent({required this.reaction_type_id_fk,required this.post_id_fk,required this.profile_id_fk,});


  @override
  List<Object> get props => [reaction_type_id_fk,post_id_fk,profile_id_fk];

}
