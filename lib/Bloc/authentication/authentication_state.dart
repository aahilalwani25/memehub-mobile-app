part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();
  
  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final String message, name;
  final int id;

  const AuthenticationSuccess({required this.message, required this.id, required this.name});

  @override
  List<Object> get props => [message, id, name];
}

class AuthenticationFailure extends AuthenticationState {
  final String error;

  const AuthenticationFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class AuthenticationWithGoogleSuccessState extends AuthenticationState{
  final String message;

  const AuthenticationWithGoogleSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

