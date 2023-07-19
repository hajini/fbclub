import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: kBackgroundColor,
      elevation: 0.0
    ),
    primaryColor: kBackgroundColor,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: kPrimaryColor),
    visualDensity: VisualDensity.adaptivePlatformDensity
  );
}

TextTheme textTheme() {
  return const TextTheme(
    titleLarge: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    labelLarge: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.normal),
    bodyLarge: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.normal),
    labelMedium: TextStyle(fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.normal),

  );}