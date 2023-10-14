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