import 'package:flutter/material.dart';

import 'contact_shipping_shipment.dart';
import 'payment_detail.dart';

class AddShipping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  "Add Shipment",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
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
      ),
    );
  }
}
