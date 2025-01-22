import 'package:flutter/material.dart';

final ThemeData light = ThemeData(
  primaryColor: Color.fromARGB(255, 160, 174, 252),
  colorScheme: const ColorScheme.light().copyWith(
    primary: Color.fromARGB(255, 160, 174, 252),
    secondary: Colors.black,
    error: Colors.redAccent,
    surfaceTint: Colors.transparent,
  ),
  scaffoldBackgroundColor: Colors.white,
  shadowColor: const Color.fromRGBO(6, 43, 45, 0.1),
  appBarTheme: AppBarTheme(
      elevation: 3,
      backgroundColor: Colors.white,
      shadowColor: const Color.fromRGBO(39, 63, 219, 0.09),
      foregroundColor: Colors.black),
);

final ThemeData dark = ThemeData(
  primaryColor: Colors.indigo,
  colorScheme: const ColorScheme.light().copyWith(
    primary: Colors.indigo,
    secondary: Colors.white,
    error: Colors.redAccent,
    surfaceTint: Colors.transparent,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 59, 58, 58),
  shadowColor: Colors.white,
  appBarTheme: AppBarTheme(
      elevation: 3,
      backgroundColor: Color.fromARGB(255, 59, 58, 58),
      shadowColor: Colors.white,
      foregroundColor: Colors.white),
);
