part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class AcceptthetermsEvent extends SignupEvent{
  bool agree;

  AcceptthetermsEvent({required this.agree});

@override
  List<Object> get props => [agree];
 
}

class AcceptTheTermsNotAcceptedEvent extends SignupEvent{
  String error;

  AcceptTheTermsNotAcceptedEvent({required this.error});

@override
  List<Object> get props => [error];
 
}

class GenderSelectedEvent extends SignupEvent{
  int genderId;
  GenderSelectedEvent({required this.genderId});
  @override
  List<Object> get props => [genderId];
}

class RegisterButtonPressedEvent extends SignupEvent{
  String name,email,password,password_confirmation ;
  bool accepttheterms;
  RegisterButtonPressedEvent({ required this.name, required this.email, required this.password,required this.password_confirmation, required this.accepttheterms });

  @override
  List<Object> get props => [name,email,password,password_confirmation,accepttheterms];
}

class SignupLoadingEvent extends SignupEvent{}
