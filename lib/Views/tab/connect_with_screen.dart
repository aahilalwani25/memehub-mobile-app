import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memehub_mobile_app/Views/signin_screen.dart';

import '../../Bloc/authentication/authentication_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConnectWithScreen(),
    );
  }
}

class ConnectWithScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Or Connect With',
            
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
              textAlign: TextAlign.center,
              
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(LoginButtonWithGooglePressedEvent());

                        // if(state is AuthenticationState){

                        // }
                      },
                      child: CircleAvatar(
                        backgroundColor: const Color(0xFFF5F5F5),
                        child: Image.asset(
                          'assets/images/google_logo.png',
                          height: 40,
                        ),
                      ),
                    ),
                    
                    GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(24, 119, 242, 1),
                        
                        child: Image.asset(
                          'assets/images/facebook_logo.png',
                          height: 40,
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(LoginButtonWithGooglePressedEvent());

                        // if(state is AuthenticationState){

                        // }
                      },
                      child: CircleAvatar(
                        backgroundColor: const Color(0xFFF5F5F5),
                        
                        child: Image.asset(
                          'assets/images/google_logo.png',
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),
                    GestureDetector(
                      onTap: () {
                        // Handle "Or Sign In" button click
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=> SigninScreen()));
                      },
                      child: Text('Or Sign In'),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
