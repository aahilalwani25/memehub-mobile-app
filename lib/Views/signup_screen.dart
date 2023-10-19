import 'package:flutter/material.dart';
import 'package:memehub_mobile_app/global/styles.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();

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
                  image: AssetImage('assets/images/background2_image.jpeg')),
            ),
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                alignment: Alignment.center,
                width: styles.getWidth(0.8),
                height: styles.getHeight(0.75),
                child: Column(children: [
                  SizedBox(
                    height: 35,
                    child: Text(
                      'Create an account',
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
                      'Gather friends, meme party starts!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                  ),
                   Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                    ),
                    width: styles.getWidth(0.5),
                    height: styles.getHeight(0.1),
                    child: TextFormField(
                      controller: _usernameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null) {
                          return "Please enter your User name";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'User Name',
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
                    margin: const EdgeInsets.only(
                      top: 5,
                    ),
                    width: styles.getWidth(0.5),
                    height: styles.getHeight(0.1),
                    child: TextFormField(
                      controller: _confirmpasswordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null) {
                          return "Please enter your Confirm Password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Confirm Password',
                        fillColor: inputDecorationTheme.fillColor,
                        filled: inputDecorationTheme.filled,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value){

                      }),
                      Container(
                        alignment: const Alignment(0.75, 0),
                        child: Text(
                          'I accept the terms.',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      width: 151,
                      height: 45,
                      margin: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {},
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
