part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();
  
  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final String message;

  AuthenticationSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthenticationFailure extends AuthenticationState {
  final String error;

  AuthenticationFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class LoadingState extends AuthenticationState{}

