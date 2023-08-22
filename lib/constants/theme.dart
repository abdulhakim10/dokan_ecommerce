import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.red,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.red,
      textStyle: const TextStyle(color: Colors.red),
      side: const BorderSide(width: 1.7, color: Colors.red),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: outlineInputBorder,
    errorBorder: outlineInputBorder,
    suffixIconColor: Colors.grey,
    prefixIconColor: Colors.grey,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      disabledBackgroundColor: Colors.grey,
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
  ),
  primarySwatch: Colors.red,
  canvasColor: Colors.red,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
);

OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
  color: Colors.grey,
));
