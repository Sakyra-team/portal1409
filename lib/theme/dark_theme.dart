import 'package:flutter/material.dart';
import 'package:portal1409/theme/base_theme.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  primaryColor: const .fromARGB(255, 71, 73, 226),
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: const .fromARGB(255, 71, 73, 226),
    onPrimary: const .fromARGB(255, 71, 73, 226),
    secondary: const .fromARGB(255, 230, 53, 48),
    onSecondary: const .fromARGB(255, 230, 53, 48),
    error: const .fromARGB(255, 255, 138, 138),
    onError: const .fromARGB(255, 255, 138, 138),
    surface: Colors.black,
    onSurface: Colors.white,
  ),


  scaffoldBackgroundColor: Colors.black,

  cardColor: .fromARGB(217, 24, 23, 27),

  iconTheme: IconThemeData(
    color: Colors.white,
    size: 32
  ),

  buttonTheme: ButtonThemeData(
    buttonColor: Colors.green
  ),

  

  textTheme: darkTextTheme,
);
