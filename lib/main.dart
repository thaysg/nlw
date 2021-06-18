import 'package:DevQuiz/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avengers Quiz',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff07091D),
        scaffoldBackgroundColor: Color(0xff07091D),
      ),
      home: MySplashScreen(),
    );
  }
}
