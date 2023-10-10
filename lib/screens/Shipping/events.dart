import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  final bool isPast;
  final child;
  const Events({
    super.key,
    required this.isPast, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: child,
    );
  }
}
