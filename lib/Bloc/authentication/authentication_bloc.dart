import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memehub_mobile_app/Controllers/auth_controller.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GoogleAuthController _authController = GoogleAuthController();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<LoginButtonPressedEvent>((event, emit) async {
      //login logic here
      //http://192.168.0.106:8000/api/user/login
      emit(AuthenticationLoadingState());
      final response = await http.post(
        Uri.parse('http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/login'),
        headers: {'Accept': 'application/json'},
        body: {'email': event.email, 'password': event.password},
      );

      //if user successfully logs in
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == 200) {
          final String message= data['message'];
          final int id = data['profile']['id'];
          final String name = data['user']['name'];
          

          emit(AuthenticationSuccess(
              message: message, id: id, name: name));
        }
      }else{
        print(response.body);
          emit(const AuthenticationFailure(
              error: 'Either username or password is wrong'));
      }
    });

    on<LoginButtonWithGooglePressedEvent>((event, emit) async {
      emit(AuthenticationLoadingState());
      bool isSignedIn = await _authController.signInWithGoogle();

      if (isSignedIn) {
        emit(const AuthenticationWithGoogleSuccessState(message: 'SignedIn'));
      } else {
        emit(const AuthenticationFailure(error: 'Not Logged In'));
      }
    });
  }
}
