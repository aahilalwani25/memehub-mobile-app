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

class GenderChangedEvent extends SignupEvent{
  final String gender;
  GenderChangedEvent({required this.gender});
  @override
  List<Object> get props =>[gender];
}

class RegisterButtonPressedEvent extends SignupEvent{
  String name,email,password,password_confirmation;
  String mobile;
  bool accepttheterms;
  String gender_id;
  DateTime dob;
  RegisterButtonPressedEvent({ required this.gender_id,required this.dob, required this.mobile,required this.name, required this.email, required this.password,required this.password_confirmation, required this.accepttheterms });

  @override
  List<Object> get props => [name,email,password,password_confirmation,mobile,gender_id,accepttheterms];
}

class SignupLoadingEvent extends SignupEvent{}

class DoBPressed extends SignupEvent{
  DateTime dob;

  DoBPressed({required this.dob});
  @override
  List<Object> get props => [dob];
}
