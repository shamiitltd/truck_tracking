import 'package:flutter/material.dart';

import 'left_drawer.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LeftDrawer(),
    );
  }
}
