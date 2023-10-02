import 'package:flutter/material.dart';

hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

class MyColors {
  static Color maintenance = Color(0xFFFCB050);
  static Color labourCost = Color(0xFFEADE94);
  static Color fuel = Color(0xFFC4A56E);
  static Color others = Color(0xFF805F0C);
  static Color service = Color(0xFF15172C);
  static Color onTapColor = Color(0xFF202237);
}
