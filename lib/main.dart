import 'package:flutter/material.dart';
import 'package:quizapp_quizzapp/quizscreen.dart';
import 'package:quizapp_quizzapp/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //themeMode: ThemeMode.dark,
      //theme: ThemeData.dark().copyWith(),
      home: Splashscreen(),
    );
  }
}
