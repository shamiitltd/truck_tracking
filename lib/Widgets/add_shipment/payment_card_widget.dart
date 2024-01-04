// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:truck_tracking/screens/Add_shipment/transparent_background.dart';

class PaymentCardWidget extends StatelessWidget {
  const PaymentCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 40),
            child: TransparentBackground(
                theWidth: sizingInformation.deviceScreenType ==
                        DeviceScreenType.desktop
                    ? MediaQuery.sizeOf(context).width * 1 / 15
                    : MediaQuery.sizeOf(context).width * 1 / 10,
                theHeight: 80.0,
                theChild: Container(
                  child: Image.asset(
                    "assets/add_shipment/images/mastercard.png",
                    height: 100,
                  ),
                )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TransparentBackground(
                theWidth: sizingInformation.deviceScreenType ==
                        DeviceScreenType.desktop
                    ? MediaQuery.sizeOf(context).width * 1 / 15
                    : MediaQuery.sizeOf(context).width * 1 / 10,
                theHeight: 80.0,
                theChild: Container(
                  child: Image.asset(
                    "assets/add_shipment/images/visa.png",
                  ),
                )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TransparentBackground(
                theWidth: sizingInformation.deviceScreenType ==
                        DeviceScreenType.desktop
                    ? MediaQuery.sizeOf(context).width * 1 / 15
                    : MediaQuery.sizeOf(context).width * 1 / 10,
                theHeight: 80.0,
                theChild: Container(
                  child: Image.asset(
                    "assets/add_shipment/images/rupay.png",
                    height: 100,
                  ),
                )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TransparentBackground(
                theWidth: sizingInformation.deviceScreenType ==
                        DeviceScreenType.desktop
                    ? MediaQuery.sizeOf(context).width * 1 / 18
                    : MediaQuery.sizeOf(context).width * 1 / 10,
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
      ),
    );
  }
}
