import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData(
  fontFamily: 'Georgia',

  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
  ),

  textTheme: const TextTheme(
    headline6: TextStyle(fontSize: 21.0, color: Colors.white),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
  ),
);