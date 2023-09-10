import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class VehicalAllocation extends StatefulWidget {
  const VehicalAllocation({super.key});
  

  @override
  
  State<VehicalAllocation> createState() => _VehicalAllocationState();
}

class _VehicalAllocationState extends State<VehicalAllocation> {
  double percent=0;
  double percent2=0;
  double percent3=0;
  double percent4=0;
  late Timer timer;

  @override
  void initState() {
  
  timer = Timer.periodic(const Duration(milliseconds:1000),(_){
    setState(() {
      percent=80;
      percent2=40;
      percent3=50;
      percent4=20;
      // if(percent >= 100){
      //   timer.cancel();
      //   // percent=0;
      // }
    });
  });
  super.initState();
}
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
    body: Container(
      child: Column(
        
        children: [
          Align(alignment: Alignment.topLeft,
           child: Text("Vehicle Allocation",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            
          ),
          ),
          ),
          SizedBox(height: 15,),
        LinearPercentIndicator( //leaner progress bar
  animation: true,
  animationDuration: 1000,
  lineHeight: 20.0,
  percent:percent/100,
  barRadius: Radius.circular(10),
  center: Text(
    percent.toString() + "%",
    style: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.black),
    ),
    // ignore: deprecated_member_use
    linearStrokeCap: LinearStrokeCap.roundAll,
    progressColor: Color.fromARGB(255, 176, 209, 177),
    backgroundColor: Colors.grey[300],
  ),
   SizedBox(height: 15,),
        LinearPercentIndicator( //leaner progress bar
  animation: true,
  animationDuration: 1000,
  lineHeight: 20.0,
  percent:percent2/100,
  barRadius: Radius.circular(10),
  center: Text(
    percent2.toString() + "%",
    style: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.black),
    ),
    // ignore: deprecated_member_use
    linearStrokeCap: LinearStrokeCap.roundAll,
    progressColor: Color.fromARGB(255, 176, 209, 177),
    backgroundColor: Colors.grey[300],
  ),
 SizedBox(height: 15,),
        LinearPercentIndicator( //leaner progress bar
  animation: true,
  animationDuration: 1000,
  lineHeight: 20.0,
  percent:percent3/100,
  barRadius: Radius.circular(10),
  center: Text(
    percent3.toString() + "%",
    style: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.black),
    ),
    // ignore: deprecated_member_use
    linearStrokeCap: LinearStrokeCap.roundAll,
    progressColor: Color.fromARGB(255, 176, 209, 177),
    backgroundColor: Colors.grey[300],
  ),
 SizedBox(height: 15,),
        LinearPercentIndicator( //leaner progress bar
  animation: true,
  animationDuration: 1000,
  lineHeight: 20.0,
  percent:percent4/100,
  barRadius: Radius.circular(10),
  center: Text(
    percent4.toString() + "%",
    style: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.black),
    ),
    // ignore: deprecated_member_use
    linearStrokeCap: LinearStrokeCap.roundAll,
    progressColor: Color.fromARGB(255, 176, 209, 177),
    backgroundColor: Colors.grey[300],
  ),
 SizedBox(height: 15,),
        LinearPercentIndicator( //leaner progress bar
  animation: true,
  animationDuration: 1000,
  lineHeight: 20.0,
  percent:percent/100,
  barRadius: Radius.circular(10),
  center: Text(
    percent.toString() + "%",
    style: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.black),
    ),
    // ignore: deprecated_member_use
    linearStrokeCap: LinearStrokeCap.roundAll,
    progressColor: Color.fromARGB(255, 176, 209, 177),
    backgroundColor: Colors.grey[300],
  ),
 SizedBox(height: 15,),
        LinearPercentIndicator( //leaner progress bar
  animation: true,
  animationDuration: 1000,
  lineHeight: 20.0,
  percent:percent/100,
  barRadius: Radius.circular(10),
  center: Text(
    percent.toString() + "%",
    style: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.black),
    ),
    // ignore: deprecated_member_use
    linearStrokeCap: LinearStrokeCap.roundAll,
    progressColor: Color.fromARGB(255, 176, 209, 177),
    backgroundColor: Colors.grey[300],
  ),


        ],
      ),
    ),
),
    );
    
  }
}