import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  fontFamily: "Mulish",
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: Colors.green.shade400,
    secondary: Colors.green.shade700,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(color: Colors.black),
    headline2: TextStyle(color: Colors.black),
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
  ),
);

final darkTheme = ThemeData(
  fontFamily: "Mulish",
  // scaffoldBackgroundColor: Color.fromARGB(255, 88, 60, 153),
  colorScheme: const ColorScheme.dark(),
  textTheme: const TextTheme(
    headline1: TextStyle(color: Colors.white),
    headline2: TextStyle(color: Colors.white),
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
  ),
);
