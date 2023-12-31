import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memehub_mobile_app/Bloc/authentication/authentication_bloc.dart';
import 'package:memehub_mobile_app/Views/dashboard.dart';
import 'package:memehub_mobile_app/global/components/input_text.dart';
import 'package:memehub_mobile_app/global/components/toast_message.dart';
import 'package:memehub_mobile_app/global/styles.dart';
import 'signup_screen.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Styles styles = Styles(context: context);
    final formKey = GlobalKey<FormState>();
    // print('hello');

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            // TODO: implement listener

            if (state is AuthenticationFailure) {
              ToastMessage(
                      context: context,
                      message: "Either username or password is wrong",
                      type: 'error')
                  .show();
            }

            if (state is AuthenticationSuccess) {
              ToastMessage(
                      context: context, message: state.message, type: 'success')
                  .show();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (builder) => Dashboard(
                        id: state.id,
                        name: state.name,
                      )));
            }

            if (state is AuthenticationLoadingState) {
              showDialog(
                  context: context,
                  builder: (builder) {
                    return AlertDialog(
                      content: SizedBox(
                        height: styles.getHeight(0.1),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            Text('Loading..'),
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Container(
                width: styles.getWidth(1),
                height: styles.getHeight(1),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/funny_bg.jpg')),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.3, sigmaY: 0.3),
                  child: Center(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(124, 116, 116, 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      alignment: Alignment.center,
                      width: styles.getWidth(0.9),
                      height: styles.getHeight(0.6),
                      child: Column(children: [
                        // SizedBox(
                        //   height: 35,
                        //   child: Text(
                        //     'Login',
                        //     textAlign: TextAlign.center,
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .titleLarge!
                        //         .copyWith(fontWeight: FontWeight.bold),
                        //   ),
                        // ),

                        // SizedBox(
                        //   height: 35,
                        //   child: Text(
                        //     'or connect with',
                        //     textAlign: TextAlign.center,
                        //     style: Theme.of(context).textTheme.bodyMedium!,
                        //   ),
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     GestureDetector(
                        //       child: Container(
                        //         width: 100,
                        //         height: 54,
                        //         padding: const EdgeInsets.all(5),
                        //         decoration: ShapeDecoration(
                        //           color: const Color(0xFF1877F2),
                        //           shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(10),
                        //           ),
                        //         ),
                        //         child: Image.asset(
                        //           'assets/images/facebook_logo.png',
                        //           height: 40,
                        //         ),
                        //       ),
                        //     ),
                        //     GestureDetector(
                        //       onTap: () {
                        //         context
                        //             .read<AuthenticationBloc>()
                        //             .add(LoginButtonWithGooglePressedEvent());

                        //         // if(state is AuthenticationState){

                        //         // }
                        //       },
                        //       child: Container(
                        //         width: 100,
                        //         height: 54,
                        //         padding: const EdgeInsets.all(5),
                        //         decoration: ShapeDecoration(
                        //           color: const Color(0xFFF5F5F5),
                        //           shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(10),
                        //           ),
                        //         ),
                        //         child: Image.asset(
                        //           'assets/images/google_logo.png',
                        //           height: 40,
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),

                        Input(
                          hintText: 'Email',
                          styles: styles,
                          context: context,
                          icon: const Icon(Icons.email),
                          controller: _emailController,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your Email";
                            }
                            if (!value.contains("@") ||
                                !value.contains("com")) {
                              return "Invalid email format.";
                            }
                            return null;
                          },
                        ).show(),
                        Input(
                          styles: styles,
                          context: context,
                          hintText: 'Password',
                          obscureText: true,
                          icon: const Icon(Icons.password),
                          controller: _passwordController,
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your Password";
                            }

                            return null;
                          },
                        ).show(),
                        // Container(
                        //   alignment: const Alignment(0.75, 0),
                        //   child: Text(
                        //     'Forgot Passowrd?',
                        //     style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
                        //   ),
                        // ),

                        // Row(
                        //   children: [
                        //     Checkbox(value: false, onChanged: (val) {})
                        //   ],
                        // ),
                        Container(
                            width: 250,
                            height: 45,
                            margin: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  //if validation is true
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthenticationBloc>().add(
                                        LoginButtonPressedEvent(
                                            email: _emailController.text,
                                            password:
                                                _passwordController.text));
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: styles.getHeight(0.02),
                                  ),
                                ))),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          alignment: const Alignment(0, -10),
                          child: Text(
                            'Don\'t have an account?',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        Container(
                            width: 250,
                            height: 45,
                            margin: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (builder) => SignupScreen()));
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: styles.getHeight(0.02),
                                  ),
                                )))
                      ]),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
