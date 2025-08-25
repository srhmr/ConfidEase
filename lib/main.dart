import 'package:confidease/pages/intro/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // ✅ import dotenv

import 'package:confidease/pages/landing.dart';
import 'package:confidease/pages/login.dart';
import 'package:confidease/pages/signup.dart';
import 'package:confidease/navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/OnBoardingScreen',
      routes: {
        '/OnBoardingScreen' : (context) => const OnBoardingScreen(),
        '/landing': (context) => const LandingPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/navigator': (context) {
          final name = ModalRoute.of(context)!.settings.arguments as String;
          return MainNavigator(name: name);
        },
      },
    );
  }
}
