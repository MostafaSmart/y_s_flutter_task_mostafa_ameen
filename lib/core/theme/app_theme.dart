import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.grey[100],
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.black87),
    ),
    iconTheme: IconThemeData(color: Colors.black54),
    hintColor: Colors.grey,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.white70),
    ),
    iconTheme: IconThemeData(color: Colors.white70),
    hintColor: Colors.grey[400],
  );
}
