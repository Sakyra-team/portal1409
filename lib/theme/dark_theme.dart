import 'package:flutter/material.dart';
import 'package:portal1409/theme/base_theme.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: .dark,

  primaryColor: const .fromARGB(255, 71, 73, 226),
  colorScheme: ColorScheme(
    brightness: .dark,
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
  // splashColor: const .fromARGB(255, 71, 73, 226),
  cardColor: const .fromARGB(200, 24, 23, 27),
  dividerColor: const .fromARGB(255, 51, 51, 53),
  // hintColor: const .fromARGB(255, 51, 51, 53),
  
  // cardColor: const .fromARGB(230, 0, 0, 0),

  iconTheme: IconThemeData(color: Colors.white, size: 32),

  snackBarTheme: SnackBarThemeData(
    actionTextColor: Colors.white,
    contentTextStyle: darkTextTheme.labelMedium?.copyWith(color: Colors.white),
    backgroundColor: const .fromARGB(217, 24, 23, 27),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,

    backgroundColor: Colors.black,

    showUnselectedLabels: true,

    unselectedIconTheme: IconThemeData(
      color: Color.fromARGB(255, 156, 163, 175),
    ),

    selectedIconTheme: IconThemeData(color: const .fromARGB(255, 71, 73, 226)),

    selectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontFamily: "Montserrat",
    ),

    unselectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontFamily: "Montserrat",
    ),
  ),

  textTheme: darkTextTheme,
);
