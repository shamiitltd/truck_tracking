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
}
