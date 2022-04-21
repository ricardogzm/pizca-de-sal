import 'package:flutter/material.dart';

const primaryColor = Color(0xFF34D399);
const shadowColor = Color.fromARGB(122, 129, 190, 160);

final lightTheme = ThemeData(
  fontFamily: "Mulish",
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: primaryColor,
    secondary: Colors.green.shade700,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(color: Colors.black),
    headline2: TextStyle(color: Colors.black),
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w800,
          fontFamily: "Mulish",
          letterSpacing: 2),
      elevation: 5,
      shadowColor: shadowColor,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        fontFamily: "Mulish",
      ),
      primary: Colors.black,
      backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(fontWeight: FontWeight.w400),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(0, 0, 0, 0),
    toolbarHeight: 80,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 42,
      fontWeight: FontWeight.w800,
    ),
    toolbarTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
    ),
  ),
);

final darkTheme = ThemeData(
  fontFamily: "Mulish",
  colorScheme: const ColorScheme.dark(),
  textTheme: const TextTheme(
    headline1: TextStyle(color: Colors.white),
    headline2: TextStyle(color: Colors.white),
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
  ),
);
