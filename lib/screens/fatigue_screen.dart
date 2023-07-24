import 'package:final_dashboard/screens/left_drawer.dart';
import 'package:flutter/material.dart';

class FatigueScreen extends StatelessWidget {
  const FatigueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Expanded(
            flex: 1,
            child: LeftDrawer()
           ),
           Expanded(
            flex: 5,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 300,
                  color: Colors.white),
              ],
            ) 
            )
        ],
      ),
    );
  }
}
