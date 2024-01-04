// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppDimensions {

  static const  defuaultPadding = 16.0;
  // Padding
  static const EdgeInsetsGeometry smallPadding = EdgeInsets.all(8.0);
  static const EdgeInsetsGeometry mediumPadding = EdgeInsets.all(16.0);
  static const EdgeInsetsGeometry largePadding = EdgeInsets.all(24.0);

  // Horizontal Padding
  static const EdgeInsetsGeometry horizontalSmallPadding =
      EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsetsGeometry horizontalMediumPadding =
      EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsetsGeometry horizontalLargePadding =
      EdgeInsets.symmetric(horizontal: 24.0);

  // Vertical Padding
  static const EdgeInsetsGeometry verticalSmallPadding =
      EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsetsGeometry verticalMediumPadding =
      EdgeInsets.symmetric(vertical: 16.0);
  static const EdgeInsetsGeometry verticalLargePadding =
      EdgeInsets.symmetric(vertical: 24.0);

  // Width and Height
  static const double smallBoxSize = 24.0;
  static const double mediumBoxSize = 48.0;
  static const double largeBoxSize = 72.0;

  // Box Constraints
  static const BoxConstraints smallBoxConstraints =
      BoxConstraints(maxWidth: smallBoxSize, maxHeight: smallBoxSize);
  static const BoxConstraints mediumBoxConstraints =
      BoxConstraints(maxWidth: mediumBoxSize, maxHeight: mediumBoxSize);
  static const BoxConstraints largeBoxConstraints =
      BoxConstraints(maxWidth: largeBoxSize, maxHeight: largeBoxSize);


  // Help And Setting Page
  //Padding
  static const EdgeInsets SettingPage =
      EdgeInsets.symmetric(horizontal: 15, vertical: 15);
  static const EdgeInsets account_setting =
      EdgeInsets.symmetric(horizontal: 15);
//Margin Account Setting TextField
  static const EdgeInsets AccountSettingTextField =
      EdgeInsets.symmetric(horizontal: 15, vertical: 20);
  //Content Padding TextField
  static const EdgeInsets AccountSettingTextFieldContent =
      EdgeInsets.symmetric(vertical: 13);

//Contact_Shippiing_Shipment
//Margin

//Contact TextField
// Margin
  static const EdgeInsets ContactTextFieldMargin =
      EdgeInsets.symmetric(horizontal: 15, vertical: 20);
  static const EdgeInsets ContactTextFieldMargin2 =
      EdgeInsets.symmetric(horizontal: 15, vertical: 0);

//Content Padding TextField
  static const EdgeInsets ContactTextFieldPadding =
      EdgeInsets.symmetric(vertical: 13);

//Payment TextField Margin
  static const EdgeInsets PaymentTextFieldMargin1 =
      EdgeInsets.symmetric(vertical: 10, horizontal: 40);
  static const EdgeInsets PaymentTextFieldMargin2 =
      EdgeInsets.symmetric(vertical: 10);

  //Content Padding TextField
  static const EdgeInsets PaymentTextFieldPadding1 =
      EdgeInsets.symmetric(vertical: 13, horizontal: 10);
  static const EdgeInsets PaymentTextFieldPadding2 =
      EdgeInsets.symmetric(vertical: 13);
}
