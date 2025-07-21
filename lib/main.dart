import 'package:flutter/material.dart';
import 'package:gymbuddy/components/theme.dart';
import 'package:gymbuddy/pages/homePage.dart';
import 'package:gymbuddy/pages/signupPages/startPage.dart';
import 'package:gymbuddy/pages/signupPages/trainerSignOptions.dart';
import 'package:gymbuddy/pages/signupPages/userSignOptions.dart';

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
      title: 'Flutter Demo',
      theme: darkMode,
      // home: const StartPage(),
      // home: const UserSignOptions(),
      home: const TrainerSignOptions(),
    );
  }
}
