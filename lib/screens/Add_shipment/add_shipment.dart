import 'package:flutter/material.dart';
import 'package:truck_tracking/config/padding/padding.dart';
import 'package:truck_tracking/screens/Add_shipment/Pages/contact_shipping_shipment.dart';
import 'package:truck_tracking/screens/Add_shipment/Pages/payment_detail.dart';
import 'package:truck_tracking/shared/leftdrawer.dart';

class AddShipping extends StatelessWidget {
  const AddShipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.949),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          const Padding(padding: AppDimensions.smallPadding),
          Container(
            padding: AppDimensions.mediumPadding,
            width: 284,
            child: const LeftDrawer(),
          ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: const Text(
                      "Add Shipment",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContactShippingShipment(),
                      SizedBox(
                        width: 10,
                      ),
                      PaymentDetail()
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}