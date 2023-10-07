import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:memehub_mobile_app/Views/signin_screen.dart';

import 'Bloc/authentication/authentication_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //FlutterNativeSplash.removeAfter(initialization);
  runApp(const MyApp());
}

Future initialization(BuildContext context) async {
  //load resources
  await Future.delayed(
      const Duration(seconds: 2), () => {FlutterNativeSplash.remove()});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(),
          ),
          // BlocProvider(
          //   create: (context) => SubjectBloc(),
          // ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              fillColor: Color.fromARGB(255, 238, 238, 238),
              filled: true
            ),
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'Sakkal Majalla',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              bodyMedium: TextStyle(
                color: Color(0xFF736F6F),
                fontSize: 20,
                fontFamily: 'Sakkal Majalla',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              bodySmall: TextStyle(
                color: Color(0xFF736F6F),
                fontSize: 15,
                fontFamily: 'Sakkal Majalla',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            primaryColor: const Color(0xFFF2F2F2),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SigninScreen(),
        ));
  }
}
