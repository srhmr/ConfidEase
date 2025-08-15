import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core
import 'firebase_options.dart';

import 'package:confidease/pages/landing.dart';
import 'package:confidease/pages/login.dart';
import 'package:confidease/pages/signup.dart';

import 'package:confidease/navigator.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // <-- use config
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/landing',
      routes: {
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
