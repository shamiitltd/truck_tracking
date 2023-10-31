// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:truck_tracking/config/Padding/padding.dart';
import 'package:truck_tracking/shared/leftdrawer.dart';

import 'contact_shipping_shipment.dart';
import 'payment_detail.dart';

class AddShipping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
          const Padding(padding: AppDimensions.smallPadding),
          Container(
            padding: AppDimensions.mediumPadding,
            width: 284,
            child: const LeftDrawer(),
          ),
          const SizedBox(
            width: AppDimensions.defuaultPadding,
          ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: const Text(
                        "Add Shipment",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        ContactShippingShipment(),
                        const SizedBox(
                          width: 10,
                        ),
                        PaymentDetail()
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}