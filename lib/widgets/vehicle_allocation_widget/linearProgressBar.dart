import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearProgressBar extends StatefulWidget {
  const LinearProgressBar({super.key});

  @override
  State<LinearProgressBar> createState() => _LinearProgressBarState();
}

class _LinearProgressBarState extends State<LinearProgressBar> {
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
     
    });
  });
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Container(
        
        child: Column(
          
          children: [
             
            const Align(alignment: Alignment.topLeft,
             child: Text("Vehicle Allocation",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.black,
              
            ),
            ),
            ),
            const SizedBox(height: 30,),
          LinearPercentIndicator(
             //leaner progress bar
      animation: true,
      animationDuration: 1000,
      lineHeight: 25.0,
      percent:percent/100,
      barRadius: const Radius.circular(10),
      center: Text(
      "$percent%",
      style: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),
      ),
      // ignore: deprecated_member_use
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: const Color.fromARGB(255, 176, 209, 177),
      backgroundColor: Colors.grey[300],
      leading: const Text("City 1",style: TextStyle(color: Colors.grey,fontSize: 20,),),
      trailing: Text("$percent/1234"),
      ),
        
    
       const SizedBox(height: 30,),

          LinearPercentIndicator( //leaner progress bar
      animation: true,
      animationDuration: 1000,
      lineHeight: 25.0,
      percent:percent2/100,
      barRadius: const Radius.circular(10),
      center: Text(
      "$percent2%",
      style: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),
      ),
      // ignore: deprecated_member_use
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: const Color.fromARGB(255, 176, 209, 177),
      backgroundColor: Colors.grey[300],
      leading: const Text("City 2",style: TextStyle(color: Colors.grey,fontSize: 20,),),
      trailing: Text("$percent2/1234"),
      ),
     const SizedBox(height: 30,),
          LinearPercentIndicator( //leaner progress bar
      animation: true,
      animationDuration: 1000,
      lineHeight: 25.0,
      percent:percent3/100,
      barRadius: const Radius.circular(10),
      center: Text(
      "$percent3%",
      style: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),
      ),
      // ignore: deprecated_member_use
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: const Color.fromARGB(255, 176, 209, 177),
      backgroundColor: Colors.grey[300],
      leading: const Text("City 3",style: TextStyle(color: Colors.grey,fontSize: 20,),),
      trailing: Text("$percent3/1234"),
      ),
     const SizedBox(height: 30,),
          LinearPercentIndicator( //leaner progress bar
      animation: true,
      animationDuration: 1000,
      lineHeight: 25.0,
      percent:percent4/100,
      barRadius: const Radius.circular(10),
      center: Text(
      "$percent4%",
      style: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),
      ),
      // ignore: deprecated_member_use
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: const Color.fromARGB(255, 176, 209, 177),
      backgroundColor: Colors.grey[300],
      leading: const Text("City 4",style: TextStyle(color: Colors.grey,fontSize: 20,),),
      trailing: Text("$percent4/1234"),
      ),
     const SizedBox(height: 30,),
          LinearPercentIndicator( //leaner progress bar
      animation: true,
      animationDuration: 1000,
      lineHeight: 25.0,
      percent:percent/100,
      barRadius: const Radius.circular(10),
      center: Text(
      "$percent%",
      style: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),
      ),
      // ignore: deprecated_member_use
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: const Color.fromARGB(255, 176, 209, 177),
      backgroundColor: Colors.grey[300],
      leading: const Text("City 5",style: TextStyle(color: Colors.grey,fontSize: 20,),),
      trailing: Text("$percent/1234"),
      ),
     const SizedBox(height: 30,),
          LinearPercentIndicator( //leaner progress bar
      animation: true,
      animationDuration: 1000,
      lineHeight: 25.0,
      percent:percent/100,
      barRadius: const Radius.circular(10),
      center: Text(
      "$percent%",
      style: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),
      ),
      // ignore: deprecated_member_use
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: const Color.fromARGB(255, 176, 209, 177),
      backgroundColor: Colors.grey[300],
      leading: const Text("City 6",style: TextStyle(color: Colors.grey,fontSize: 20,),),
      trailing: Text("$percent/1234"),
      ),
      const SizedBox(height: 30,),
          LinearPercentIndicator( //leaner progress bar
      animation: true,
      animationDuration: 1000,
      lineHeight: 25.0,
      percent:percent/100,
      barRadius: const Radius.circular(10),
      center: Text(
      "$percent%",
      style: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),
      ),
      // ignore: deprecated_member_use
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: const Color.fromARGB(255, 176, 209, 177),
      backgroundColor: Colors.grey[300],
      leading: const Text("City 7",style: TextStyle(color: Colors.grey,fontSize: 20,),),
      trailing: Text("$percent/1234"),
      ),
      const SizedBox(height: 30,),
          LinearPercentIndicator( //leaner progress bar
      animation: true,
      animationDuration: 1000,
      lineHeight: 25.0,
      percent:percent/100,
      barRadius: const Radius.circular(10),
      center: Text(
      "$percent%",
      style: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),
      ),
      // ignore: deprecated_member_use
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: const Color.fromARGB(255, 176, 209, 177),
      backgroundColor: Colors.grey[300],
      leading: const Text("City 8",style: TextStyle(color: Colors.grey,fontSize: 20,),),
      trailing: Text("$percent/1234"),
      ),
      const SizedBox(height: 30,),
          LinearPercentIndicator( //leaner progress bar
      animation: true,
      animationDuration: 1000,
      lineHeight: 25.0,
      percent:percent/100,
      barRadius: const Radius.circular(10),
      center: Text(
      "$percent%",
      style: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),
      ),
      // ignore: deprecated_member_use
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: const Color.fromARGB(255, 176, 209, 177),
      backgroundColor: Colors.grey[300],
      leading: const Text("City 9",style: TextStyle(color: Colors.grey,fontSize: 20,),),
      trailing: Text("$percent/1234"),
      ),
          ],
        ),
      );
  }
}