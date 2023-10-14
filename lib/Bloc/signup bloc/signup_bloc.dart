import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AcceptthetermsEvent>((event, emit) => emit(AcceptTheTermsState(agree: event.agree)));

  
    on<RegisterButtonPressedEvent>((event, emit) async{
      //login logic here
      //http://127.0.0.1:8000/api/user/register
      emit(SignupLoadingState());
      final response= await http.post(
        Uri.parse('http://192.168.0.106:8000/api/user/login'),
        headers: {
          'Accept': 'application/json'
        },
        body: {
          'email': event.email,
          'name': event.name,
          'password': event.password,
          'confirm password' : event.password_confirmation,

        },
      );

      //if user successfully registers in
      if(response.statusCode==200){
        emit(SignupSuccessfulState(success: 'Registered Successfully'));
      }else{
        emit(SignupUnsuccessfulState(error: 'Either name  is wrong'));
      }


    });
  }

}

  
