import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memehub_mobile_app/Bloc/authentication/authentication_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AcceptthetermsEvent>((event, emit) => {
      emit(AcceptthetermsState(agree: event.agree))
    });
  }


  on<RegisterEvent>((event,emit)) => {
    //if login successful
    emit(SignupSuccessfulState(success:'Login successful'));

    //if login unsuccessful
    emit(SignupUnsuccessfulState(error: 'Not registered'))
  }
}
