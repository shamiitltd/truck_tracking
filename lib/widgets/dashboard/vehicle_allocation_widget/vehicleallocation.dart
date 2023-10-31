// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:truck_tracking/widgets/dashboard/vehicle_allocation_widget/linearProgressBar.dart';
 
class VehicalAllocation extends StatefulWidget {
  const VehicalAllocation({super.key});

  @override
  
  State<VehicalAllocation> createState() => _VehicalAllocationState();
}

class _VehicalAllocationState extends State<VehicalAllocation> {

  @override
  Widget build(BuildContext context) {
    return Container(
    child: const Padding(
      padding: EdgeInsets.all(2.0),
      child: Center(
        child: LinearProgressBar(),
      ),
    )); 
  }
}