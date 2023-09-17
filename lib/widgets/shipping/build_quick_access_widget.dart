import 'package:flutter/material.dart';
import 'package:truck_tracking/screens/Shipping/quickaccess.dart';
Widget buildQuickAccessWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        //margin: EdgeInsets.only(top: 160),
        height: 510,
        width: 540,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 10, 1),
              child: Text(
                'Quick Access',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  children: const [
                    QuickAccess(
                      isFirst: true,
                      isLast: false,
                      isPast: true,
                      events: Text(
                        "Arrived at first station",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    QuickAccess(
                      isFirst: false,
                      isLast: false,
                      isPast: true,
                      events: Text("Arrived at Delivery"),
                    ),
                    QuickAccess(
                      isFirst: false,
                      isLast: false,
                      isPast: true,
                      events: Text("Order Verified at Point"),
                    ),
                    QuickAccess(
                      isFirst: false,
                      isLast: false,
                      isPast: false,
                      events: Row(
                        children: [
                          Text(
                            "Ready For Delivery",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          /*SizedBox(width: 150),
                          Text(
                            "Pending",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
                          ),*/
                        ],
                      ),
                    ),
                    QuickAccess(
                      isFirst: false,
                      isLast: true,
                      isPast: false,
                      events: Row(
                        children: [
                          Text(
                            "Arrived Destination",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          /*SizedBox(width: 149),
                          Text(
                            "Pending",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
                          ),*/
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}