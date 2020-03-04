import 'package:flutter/material.dart';

ThemeData appTheme() {
  // These are all parameters of ThemeData. We can set them here and then use
  // throughout the app.
  return ThemeData(
    // To use hex colors, use Color() and prefix hex with 0xff
//    primaryColor: Colors.cyan[600],
    primaryColor: Colors.cyan[700],
    accentColor: Colors.grey[900],
    secondaryHeaderColor: Color(0xff007c91),
    hintColor: Color(0xff5ddef4),
    textTheme: TextTheme(
        body1: TextStyle(color: Colors.white),
        headline: TextStyle(color: Colors.black),
        caption: TextStyle(color: Colors.white)),

    dividerColor: Color(0xfffd8100),
    buttonColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.grey[300],
  );
}
