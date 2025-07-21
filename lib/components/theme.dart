import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    //Background
    primary: Color(0xff0d0d0d),
    //Gry cards
    secondary: Color(0xff191919),
    //Text
    onSecondary: Color(0xffffffff),
    //Grey text
    onSecondaryContainer: Color(0xff888888),
    //Simple Green
    tertiary: Color(0xff75F94C),
  ),
);


// gradient: LinearGradient(
// colors: [
//   Color(0xff009C47),
//   Color(0xff00C853),
// ],
// stops:[0.1, 0.71],
// begin:Alignment.topLeft,
// end:Alignment.bottomRight,
// )