// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class boxDecor{
  static BoxShadow shadow = BoxShadow(
  color: Colors.grey.withOpacity(0.1),
  spreadRadius: 2,
  blurRadius: 5,
  offset: const Offset(0, 3),
  );

  static BoxShadow shadow2 = BoxShadow(
    color: Colors.grey.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 10,
    offset: const Offset(2, 2),
  );

  static BoxDecoration redCircle = BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.red[100],
    border: Border.all(
      color: Colors.red.shade100,
      width: 2,
    ),
  );

  static BoxDecoration blueCircle = BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.blue[100],
    border: Border.all(
      color: Colors.blue.shade100,
      width: 2,
    ),
  );

  static BoxDecoration greenCircle = BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.green.shade100,
    border: Border.all(
      color: Colors.green.shade100,
      width: 2,
    ),
  );

  static BoxDecoration yellowCircle = BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.yellow.shade100,
    border: Border.all(
      color: Colors.yellow.shade100,
      width: 2,
    ),
  );

}