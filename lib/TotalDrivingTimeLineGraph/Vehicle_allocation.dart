
import 'package:flutter/material.dart';
import 'package:truck_tracking/TotalDrivingTimeLineGraph/LinearProgressBar.dart';
 
class VehicalAllocation extends StatefulWidget {
  const VehicalAllocation({super.key});

  @override
  
  State<VehicalAllocation> createState() => _VehicalAllocationState();
}

class _VehicalAllocationState extends State<VehicalAllocation> {

  @override
  Widget build(BuildContext context) {
    return const SafeArea(

      child: Scaffold(
    body: Center(
      child: LinearProgressBar(),
    ),
),
    );
    
  }
}