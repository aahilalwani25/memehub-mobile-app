import 'package:flutter/material.dart';
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
    InputDecorationTheme inputDecorationTheme =
        Theme.of(context).inputDecorationTheme;

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Form(
          key: formKey,
          child: Container(
            width: styles.getWidth(1),
            height: styles.getHeight(1),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_image.jpg')),
            ),
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                alignment: Alignment.center,
                width: styles.getWidth(0.65),
                height: styles.getHeight(0.6),
                child: Column(children: [
                  SizedBox(
                    height: 35,
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Text(
                      'or connect with',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: Container(
                          width: 54,
                          height: 54,
                          padding: const EdgeInsets.all(5),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF1877F2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/facebook_logo.png',
                            height: 40,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          width: 54,
                          height: 54,
                          padding: const EdgeInsets.all(5),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF5F5F5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/google_logo.png',
                            height: 40,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 40,
                    ),
                    width: styles.getWidth(0.5),
                    height: styles.getHeight(0.1),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null) {
                          return "Please enter your email";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: 'Email',
                        fillColor: inputDecorationTheme.fillColor,
                        filled: inputDecorationTheme.filled,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                    ),
                    width: styles.getWidth(0.5),
                    height: styles.getHeight(0.1),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null) {
                          return "Please enter your Password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Password',
                        fillColor: inputDecorationTheme.fillColor,
                        filled: inputDecorationTheme.filled,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                    ),
                  ),
                  Container(
                    alignment: const Alignment(0.75, 0),
                    child: Text(
                      'Forgot Passowrd?',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Container(
                      width: 151,
                      height: 45,
                      margin: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ))),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    alignment: const Alignment(0, -10),
                    child: Text(
                      'Don\'t have an account?',
                      style: Theme.of(context).textTheme.bodySmall,
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
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (builder)=>SignupScreen())
                            );
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.black),
                          )))
                ]),
              ),
            ),
          ),
        ));
  }
}
