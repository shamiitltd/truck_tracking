import 'package:final_dashboard/screens/left_drawer.dart';
import 'package:flutter/material.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen
({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LeftDrawer(),
    );
  }
}