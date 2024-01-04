// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:truck_tracking/config/padding/padding.dart';
import 'package:truck_tracking/widgets/add_shipment/payment_card_widget.dart';
import 'package:truck_tracking/widgets/add_shipment/payment_widget.dart';
import 'package:truck_tracking/widgets/add_shipment/textfield_widget.dart';

// ignore: must_be_immutable
class PaymentDetail extends StatelessWidget {
  TextEditingController _NameonCard = TextEditingController();
  TextEditingController _CardNumber = TextEditingController();
  TextEditingController _ExpiryDate = TextEditingController();
  TextEditingController _Cvv = TextEditingController();

  PaymentDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PaymentInfoWidget(),
            const SizedBox(
              height: 10,
            ),
            Container(
              width:
                  sizingInformation.deviceScreenType == DeviceScreenType.desktop
                      ? MediaQuery.sizeOf(context).width * 1 / 2.65
                      : MediaQuery.sizeOf(context).width * 0.37 / 0.68,
              height: 700,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  gradient: LinearGradient(colors: [
                    const Color.fromARGB(255, 103, 183, 220).withOpacity(0.7),
                    const Color.fromARGB(255, 209, 133, 159).withOpacity(0.5),
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 25),
                    child: const Text(
                      "Payment Details",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 8, 80, 139)),
                    ),
                  ),
                  const PaymentCardWidget(),
                  myTextField2(
                    thecontroller: _NameonCard,
                    thehintText: 'Name on Card',
                    theicon: null,
                    theWidth: sizingInformation.deviceScreenType ==
                            DeviceScreenType.desktop
                        ? 300
                        : MediaQuery.sizeOf(context).width * 1 / 2,
                    theHeight: 45.0,
                    themargin: AppDimensions.PaymentTextFieldMargin1,
                    thesuffixIcon: null,
                    obsecureText: false,
                    thecontentPadding: AppDimensions.PaymentTextFieldPadding1,
                    themaxLength: null,
                  ),
                  myTextField2(
                    thecontroller: _CardNumber,
                    thehintText: 'Card Number',
                    theicon: null,
                    theWidth: sizingInformation.deviceScreenType ==
                            DeviceScreenType.desktop
                        ? 500.0
                        : MediaQuery.sizeOf(context).width * 1 / 2,
                    theHeight: 45.0,
                    themargin: AppDimensions.PaymentTextFieldMargin1,
                    thesuffixIcon: null,
                    obsecureText: false,
                    thecontentPadding: AppDimensions.PaymentTextFieldPadding1,
                    themaxLength: null,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        myTextField2(
                          thecontroller: _ExpiryDate,
                          thehintText: 'Expiry Date',
                          theicon: null,
                          theWidth: sizingInformation.deviceScreenType ==
                                  DeviceScreenType.desktop
                              ? MediaQuery.sizeOf(context).width * 1 / 8
                              : MediaQuery.sizeOf(context).width * 1 / 5.2,
                          theHeight: 45.0,
                          themargin: AppDimensions.PaymentTextFieldMargin1,
                          thesuffixIcon: null,
                          obsecureText: false,
                          thecontentPadding:
                              AppDimensions.PaymentTextFieldPadding1,
                          themaxLength: null,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: sizingInformation.deviceScreenType ==
                                      DeviceScreenType.desktop
                                  ? 50
                                  : 35),
                          child: myTextField2(
                            thecontroller: _Cvv,
                            thehintText: 'Cvv',
                            theicon: null,
                            theWidth: sizingInformation.deviceScreenType ==
                                    DeviceScreenType.desktop
                                ? MediaQuery.sizeOf(context).width * 1 / 8
                                : MediaQuery.sizeOf(context).width * 1 / 5.3,
                            theHeight: 45.0,
                            themargin: AppDimensions.PaymentTextFieldMargin2,
                            thesuffixIcon: null,
                            obsecureText: false,
                            thecontentPadding:
                                AppDimensions.PaymentTextFieldPadding1,
                            themaxLength: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const PaymentInfoWidget2(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      alignment: Alignment.center,
                      height: 40,
                      width: 500,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(0, 39, 106, 1)),
                      child: Text(
                        "Pay ₹1499",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.9)),
                      ),
                    ),
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
