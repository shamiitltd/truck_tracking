import 'package:flutter/material.dart';

class Legendd extends StatelessWidget {
  const Legendd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.only(left: 30, top: 20, bottom: 30),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2000),
                      color: const Color(0xff4A4A4A),
                    ),
                  ),
                  const Text(
                    "Driving",
                    style: TextStyle(fontSize: 12.5),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2000),
                      color: const Color(0xff898989),
                    ),
                  ),
                  const Text(
                    "Standing",
                    style: TextStyle(fontSize: 12.5),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2000),
                      color: const Color(0xffB0ADAD),
                    ),
                  ),
                  const Text(
                    "Halt Duration",
                    style: TextStyle(fontSize: 12.5),
                  )
                ],
              )
            ],
          ),
        )
     ;
  }
}