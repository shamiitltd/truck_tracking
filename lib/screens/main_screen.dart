import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/MenuAppController.dart';
import '../dashboard/dahboard_screen.dart';
import '../responsive.dart';
import 'left_drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const LeftDrawer(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                  flex: 1, //as it will take 1/6 th portion of screen
                  child: LeftDrawer()),
            const Expanded(
                flex: 5, //it will take rest of the parts i.e 5/6
                child: DashboardScreen()),
          ],
        ),
      ),
    );
  }
}
