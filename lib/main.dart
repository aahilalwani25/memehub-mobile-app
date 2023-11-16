import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:memehub_mobile_app/Bloc/hommies/hommies_bloc.dart';
import 'package:memehub_mobile_app/Bloc/post/post_bloc.dart';
import 'package:memehub_mobile_app/Bloc/profile/profile_bloc.dart';
import 'package:memehub_mobile_app/Views/tab/connect_with_screen.dart';
import 'package:memehub_mobile_app/firebase_options.dart';
import 'Bloc/authentication/authentication_bloc.dart';
import 'Bloc/signup bloc/signup_bloc.dart';
import 'Views/signin_screen.dart';
//import 'package:native_notify/native_notify.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  await Firebase.initializeApp();
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //FlutterNativeSplash.removeAfter(initialization);
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  //NativeNotify.initialize(3757, 'vdT6M831jk2JKPbXtET3Hi');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
          BlocProvider(
            create: (context) => SignupBloc(),
          ),
          BlocProvider(
            create: (context) => PostBloc(),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(),
          ),
          BlocProvider(create: (context) => HommiesBloc())
        ],
        child: MaterialApp(
          color: Colors.black,
          theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
                fillColor: Color.fromARGB(255, 238, 238, 238), filled: true),
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'Sakkal Majalla',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              bodyMedium: TextStyle(
                color: Color.fromARGB(255, 214, 214, 214),
                fontSize: 20,
                fontFamily: 'Sakkal Majalla',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              bodySmall: TextStyle(
                color: Color.fromARGB(255, 214, 214, 214),
                fontSize: 15,
                fontFamily: 'Sakkal Majalla',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            primaryColor: const Color.fromARGB(
                255, 209, 209, 209), //Change theme mode here
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            useMaterial3: true,
          ),
          home: ConnectWithScreen(),
        ));
  }
}
