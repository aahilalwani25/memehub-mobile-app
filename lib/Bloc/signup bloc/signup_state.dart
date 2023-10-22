part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();
  
  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

class AcceptTheTermsState extends SignupState{
  bool agree;

  AcceptTheTermsState({required this.agree});

@override
  List<Object> get props => [agree];
 
}

class AcceptTheTermsNotAcceptedState extends SignupState{
  String error;

  AcceptTheTermsNotAcceptedState({required this.error});

@override
  List<Object> get props => [error];
 
}

class SignupSuccessfulState extends SignupState{

  String success;

  SignupSuccessfulState({required this.success});

  @override
  List<Object> get props => [success];
}

class SignupUnsuccessfulState extends SignupState{
  String error;

  SignupUnsuccessfulState({required this.error});
  
  @override
  List<Object> get props => [error];
}

class SignupLoadingState extends SignupState{
  
}

class GenderState extends SignupState{
  int genderId;
  GenderState({required this.genderId});
  @override
  List<Object> get props => [genderId];
}