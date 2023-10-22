part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();
  
  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

class PrivacyChangedState extends PostState{

  String privacy;
  PrivacyChangedState({required this.privacy});

  @override
  List<Object> get props => [privacy];
}

