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

class PostSuccessfullyState extends PostState {}

class PostFetchedState extends PostState {
  List<dynamic>? postDataList;

  PostFetchedState({this.postDataList});

  @override
  List<Object?> get props => [postDataList];
}
