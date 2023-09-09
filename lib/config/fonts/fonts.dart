import 'package:flutter/material.dart';

class AppFonts {
  static const String robotoFontFamily = 'Roboto';
  

  static const TextStyle bold = TextStyle(
    fontFamily: robotoFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );

  static const TextStyle medium = TextStyle(
    fontFamily: robotoFontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const TextStyle regular = TextStyle(
    fontFamily: robotoFontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );

    static const TextStyle vehicleformtext = TextStyle(
    fontFamily: robotoFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.black
  );
}

class AppBorderRadius {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
}

class FormTextBoxRadius{
  static OutlineInputBorder normal=OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        );
}