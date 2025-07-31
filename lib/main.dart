import 'package:flutter/material.dart';
import 'package:gymbuddy/components/theme.dart';
import 'package:gymbuddy/pages/formPages/userSignUpForm3.dart';
import 'package:gymbuddy/pages/formPages/userSignUpForm1.dart';
import 'package:gymbuddy/pages/formPages/userSignUpForm2.dart';
import 'package:gymbuddy/pages/formPages/userSignUpForm4.dart';
import 'package:gymbuddy/pages/formPages/userSignUpForm5.dart';
import 'package:gymbuddy/pages/formPages/userSignUpForm6.dart';
import 'package:gymbuddy/pages/homePage.dart';
import 'package:gymbuddy/pages/signupPages/startPage.dart';
import 'package:gymbuddy/pages/signupPages/trainerSignOptions.dart';
import 'package:gymbuddy/pages/signupPages/userSignOptions.dart';
import 'package:gymbuddy/providers/userDataProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FormDataProvider(),
      child: const MyApp(),
    ),
  );
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
      // home: const TrainerSignOptions(),
      // home: const UserSignUpForm1(),
      // home: const userSignUpForm2(),
      // home: const userSignUpForm3(),
      // home: const userSignUpForm4(),
      // home: const userSignUpForm5(),
      home: const UserSignUpForm6(),
      routes: {
        '/userSignOptions': (context) => const UserSignOptions(),
        '/trainerSignOptions': (context) => const TrainerSignOptions(),
        '/signupForm1': (context) => const UserSignUpForm1(),
        '/signupForm2': (context) => const userSignUpForm2(),
        '/signupForm3': (context) => const userSignUpForm3(),
        '/signupForm4': (context) => const userSignUpForm4(),
        '/signupForm5': (context) => const userSignUpForm5(),
        '/signupForm6': (context) => const UserSignUpForm6(),
      },
    );
  }
}
