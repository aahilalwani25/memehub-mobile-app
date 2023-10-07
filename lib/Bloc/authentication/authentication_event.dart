part of 'authentication_bloc.dart';

class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressedEvent extends AuthenticationEvent{

  String email;
  String password;

  LoginButtonPressedEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginButtonWithFacebookPressedEvent extends AuthenticationEvent{
  
}

class LoginButtonWithGooglePressedEvent extends AuthenticationEvent{}


