import 'package:flutter/material.dart';

import '../Pages/AddShipment/transparent_background.dart';

class PaymentCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 40),
          child: TransparentBackground(
              theWidth: MediaQuery.sizeOf(context).width * 0.09 / 1.3,
              theHeight: 80.0,
              theChild: Container(
                child: Image.asset(
                  "assets/images/mastercard2.png",
                  height: 100,
                ),
              )),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TransparentBackground(
              theWidth: MediaQuery.sizeOf(context).width * 0.09 / 1.3,
              theHeight: 80.0,
              theChild: Container(
                child: Image.asset(
                  "assets/images/visa.png",
                ),
              )),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TransparentBackground(
              theWidth: MediaQuery.sizeOf(context).width * 0.09 / 1.3,
              theHeight: 80.0,
              theChild: Container(
                child: Image.asset(
                  "assets/images/rupay.png",
                  height: 100,
                ),
              )),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TransparentBackground(
              theWidth: MediaQuery.sizeOf(context).width * 0.09 / 1.65,
              theHeight: 70.0,
              theChild: Container(
                  child: Text(
                "See All",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.w500),
              ))),
        )
      ],
    );
  }
}
