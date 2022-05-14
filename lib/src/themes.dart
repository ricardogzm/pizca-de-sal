import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const primaryColor = Color(0xFF34D399);
const shadowColor = Color.fromARGB(122, 129, 190, 160);
const darkGrey = Color(0xFF1f2937);

final lightTheme = ThemeData(
  fontFamily: "Mulish",
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: primaryColor,
    secondary: Colors.green.shade700,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
        color: darkGrey,
        fontSize: 42,
        fontWeight: FontWeight.w900,
        height: 1.0),
    headline2: TextStyle(
        color: darkGrey,
        fontSize: 34,
        fontWeight: FontWeight.w800,
        height: 1.0),
    headline3: TextStyle(
        color: darkGrey,
        fontSize: 20,
        fontWeight: FontWeight.w800,
        height: 1.0),
    headline4: TextStyle(
        color: darkGrey,
        fontSize: 16,
        fontWeight: FontWeight.w800,
        height: 1.0),
    bodyText1: TextStyle(color: Colors.black, fontSize: 16),
    bodyText2: TextStyle(color: Colors.black, fontSize: 12),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: "Mulish",
          letterSpacing: 0),
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
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide:
          BorderSide(color: Color.fromARGB(255, 203, 213, 225), width: 0.8),
    ),
  ),
  appBarTheme: AppBarTheme(
    color: const Color.fromARGB(0, 0, 0, 0),
    systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: true,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarContrastEnforced: false,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    toolbarHeight: 60,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: const TextStyle(
      color: darkGrey,
      fontSize: 26,
      fontWeight: FontWeight.w800,
      fontFamily: "Mulish",
    ),
    toolbarTextStyle: const TextStyle(
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
