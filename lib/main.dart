import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';
import 'Screen/profilePage.dart';
import 'Screen/MainScreen.dart';
import 'Screen/Login_Page/Login_background.dart';
import 'Screen/Signup_Page/Signup_background.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  FirebaseMessaging _fcm = FirebaseMessaging.instance;

  String? token = await _fcm.getToken();
  print('Token: $token');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cyber Safety App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      home: const LoginPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => MainScreen(),
        // '/profile': (context) => ProfilePage(),
      },
    );
  }
}
