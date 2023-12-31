part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {
}

class HomieRequestSentState extends ProfileState{}

class HomieRequestNotSentState extends ProfileState{}

class HomieAcceptedState extends ProfileState{}

class Loading extends ProfileState{}
