import 'package:flutter/material.dart';

import 'order_detail.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.949),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: const Text(
                      "History",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 500,
                        height: 600,
                        color: Colors.black45,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        color: Colors.black45,
                        width: 500,
                        height: 600,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    height: 400,
                    width: 800,
                    decoration: const BoxDecoration(color: Color(0xFFF5F5FA)),
                    child: const DrivingDataTableWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}