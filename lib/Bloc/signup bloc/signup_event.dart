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

class RegisterEvent extends SignupEvent{
  String username,email ,password ;
  bool AcceptthetermsEvent;
  RegisterEvent ({ required this.username, required this.email, required this.password,required this.AcceptthetermsEvent });

  @override
  List<Object> get props => [username,email,password,AcceptthetermsEvent];
}

class LoadingEvent extends SignupEvent{}
