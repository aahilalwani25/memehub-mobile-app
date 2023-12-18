import 'package:equatable/equatable.dart';
//part of 'reels_bloc.dart';

sealed class ReelsState extends Equatable {
  const ReelsState();

  @override
  List<Object?> get props => [];
}

final class ReelsInitial extends ReelsState {}


// class VideoAddedState extends ReelsState {
//   File videoFile;
//   VideoPlayerController videoPlayerController;
//   late Future<void> initializeVideoPlayerFuture;

//   VideoAddedState({required this.videoFile, required this.videoPlayerController, required this.initializeVideoPlayerFuture});

//   @override
//   List<Object> get props => [videoFile, videoPlayerController];
// }

class ReelsSuccessfullyState extends ReelsState {}

class ReelsFetchedState extends ReelsState {
  List<dynamic>? reelsDataList;

  ReelsFetchedState({this.reelsDataList});

  

  @override
  List<Object?> get props => [reelsDataList];
}

class SharedState extends ReelsState{}

class ReactionState extends ReelsState{
  
  int reaction_type_id_fk = 0;
  ReactionState({required this.reaction_type_id_fk});

  @override
  List<Object?> get props => [reaction_type_id_fk];
}
class reelsuploadloading extends ReelsState{}