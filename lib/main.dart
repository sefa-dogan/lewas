// ignore_for_file: unused_field

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/firebase_options.dart';
import 'package:learn_english/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      title: "LEWAS",
      home: const LoginScreen(),
      theme: ThemeData.light(),
    );
  }
}
