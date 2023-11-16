import 'dart:ui';

import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:memehub_mobile_app/Views/signin_screen.dart';
import 'package:memehub_mobile_app/global/components/gender.dart';
import 'package:memehub_mobile_app/global/components/input_text.dart';
import 'package:memehub_mobile_app/global/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/signup bloc/signup_bloc.dart';
import '../global/components/toast_message.dart';
import 'package:intl/intl.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  DateTime dob = DateTime.now();
  int gender_id=0;

  @override
  Widget build(BuildContext context) {
    Styles styles = Styles(context: context);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: BlocConsumer<SignupBloc, SignupState>(listener: (context, state) {
          // TODO: implement listener

          if (state is SignupSuccessfulState) {
            ToastMessage(
                    context: context, message: state.success, type: 'success')
                .show();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (builder) => SigninScreen()));
          }

          if (state is SignupUnsuccessfulState) {
            ToastMessage(context: context, message: state.error, type: 'error')
                .show();
          }

          if (state is SignupLoadingState) {
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
        }, builder: (context, state) {
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
                    width: styles.getWidth(0.8),
                    height: styles.getHeight(0.85),
                    child: Column(children: [
                      SizedBox(
                        height: 35,
                        child: Text('Help us to share joy :)',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium!
                            // .copyWith(color: Colors.purple),
                            ),
                      ),
                      Input(
                        styles: styles,
                        hintText: 'Name',
                        context: context,
                        icon: const Icon(Icons.person),
                        controller: _usernameController,
                        textInputType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your Name";
                          }

                          return null;
                        },
                      ).show(),
                      Input(
                        styles: styles,
                        hintText: 'Email',
                        context: context,
                        icon: const Icon(Icons.email),
                        controller: _emailController,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your Email";
                          }

                          return null;
                        },
                      ).show(),
                      Input(
                        styles: styles,
                        hintText: 'Password',
                        obscureText: true,
                        context: context,
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
                      Container(
                        height: 70, // 80
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: GenderSelector(),
                        ),
                      ),
                      Container(
                          height: 80, // Set an appropriate height
                          width: styles.getWidth(0.72),
                          child: CupertinoDateTextBox(
                            initialValue: dob,
                            onDateChange: (DateTime dob) {
                              context.read<SignupBloc>().add(DoBPressed(dob: dob));
                            },
                            hintText: DateFormat.yMd().format(dob),
                          )),
                      Container(
                        width: styles.getWidth(0.72),
                        child: IntlPhoneField(
                          controller: _phoneController,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          initialCountryCode: 'PK',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                      ),
                      Container(
                          width: 151,
                          height: 45,
                          margin: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () {
                                // Validate returns true if the form is valid, otherwise false.
                                if (formKey.currentState!.validate()) {
                                  context.read<SignupBloc>().add(
                                      RegisterButtonPressedEvent(
                                          dob: dob,
                                          gender_id: "1",
                                          mobile: _phoneController.text,
                                          name: _usernameController.text,
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          password_confirmation:
                                              _confirmpasswordController.text,
                                          accepttheterms: true));
                                }
                                // }}
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(color: Colors.black),
                              )))
                    ]),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
