import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memehub_mobile_app/Controllers/auth_controller.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  GoogleAuthController _authController= GoogleAuthController();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler


    });

    on<LoginButtonPressedEvent>((event, emit) {
      //login logic here
    });

    on<LoginButtonWithGooglePressedEvent>((event, emit)async{
      bool isSignedIn = await _authController.signInWithGoogle();

      if(isSignedIn){
        emit(AuthenticationSuccess(message: 'SignedIn'));
      }else{
        emit(AuthenticationFailure(error: 'Not Logged In'));
      }
    });
  }
}
