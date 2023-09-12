import 'package:flutter/material.dart';
import 'dart:convert';

import 'order_detail.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.949),
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
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Text(
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
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        color: Colors.black45,
                        width: 500,
                        height: 600,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    height: 400,
                    width: 800,
                    decoration: const BoxDecoration(color: Color(0xFFF5F5FA)),
                    child: DrivingDataTableWidget(),
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
