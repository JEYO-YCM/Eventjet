import 'package:eventjet/screens/landingscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:fluentui_icons/fluentui_icons.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBGyOiUKZbd3W0Oi0HrrVJx7deW4y5uvAI",
            authDomain: "eventjet-bec54.firebaseapp.com",
            databaseURL: "https://eventjet-bec54-default-rtdb.firebaseio.com",
            projectId: "eventjet-bec54",
            storageBucket: "eventjet-bec54.appspot.com",
            messagingSenderId: "818422727600",
            appId: "1:818422727600:web:bdc11a4ed566174188cc75",
            measurementId: "G-W8FRHL9YBS") // Ensure this file exists
        );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EventJet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LandingPage(),
    );
  }
}
