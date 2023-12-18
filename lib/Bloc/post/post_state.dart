part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

final class PostInitial extends PostState {}

class PrivacyChangedState extends PostState {
  String privacy;
  PrivacyChangedState({required this.privacy});

  @override
  List<Object> get props => [privacy];
}

class PhotoAddedState extends PostState {
  File photoFile;

  PhotoAddedState({required this.photoFile});

  @override
  List<Object> get props => [photoFile];
}

class VideoAddedState extends PostState {
  File videoFile;
  VideoPlayerController videoPlayerController;
  late Future<void> initializeVideoPlayerFuture;

  VideoAddedState({required this.videoFile, required this.videoPlayerController, required this.initializeVideoPlayerFuture});

  @override
  List<Object> get props => [videoFile, videoPlayerController];
}

class PostSuccessfullyState extends PostState {}

class PostFetchedState extends PostState {
  List<dynamic>? postDataList;

  PostFetchedState({this.postDataList});

  @override
  List<Object?> get props => [postDataList];
}

class SharedState extends PostState{}

class ReactionState extends PostState{
  
  int reaction_type_id_fk = 0;
  ReactionState({required this.reaction_type_id_fk});

  @override
  List<Object?> get props => [reaction_type_id_fk];
}
class postuploadloading extends PostState{}