import 'dart:ui';

import 'package:flutter/material.dart';

class TransparentBackground extends StatelessWidget {
  const TransparentBackground(
      {Key? key,
      required this.theWidth,
      required this.theHeight,
      required this.theChild})
      : super(key: key);

  final theWidth;
  final theHeight;
  final theChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: theWidth,
        height: theHeight,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.13)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.15),
                      Colors.white.withOpacity(0.05)
                    ]),
              ),
            ),
            Center(
              child: theChild,
            )
          ],
        ),
      ),
    );
  }
}
