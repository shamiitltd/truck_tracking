import 'package:flutter/material.dart';
import 'package:truck_tracking/config/Padding/padding.dart';

import '../../Widgets/PaymentCards.dart';
import '../../Widgets/PaymentInfoWidgets.dart';
import '../../Widgets/TextFieldWidget.dart';

import 'transparent_background.dart';

class PaymentDetail extends StatelessWidget {
  TextEditingController _NameonCard = TextEditingController();
  TextEditingController _CardNumber = TextEditingController();
  TextEditingController _ExpiryDate = TextEditingController();
  TextEditingController _Cvv = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaymentInfoWidget(),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.37 / 0.94,
            height: 700,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.withOpacity(0.5)),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 103, 183, 220).withOpacity(0.7),
                  Color.fromARGB(255, 209, 133, 159).withOpacity(0.5),
                ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                  child: Text(
                    "Payment Details",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 8, 80, 139)),
                  ),
                ),
                PaymentCardWidget(),
                myTextField2(
                  thecontroller: _NameonCard,
                  thehintText: 'Name on Card',
                  theicon: null,
                  theWidth: 500.0,
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
                  theWidth: 500.0,
                  theHeight: 45.0,
                  themargin: AppDimensions.PaymentTextFieldMargin1,
                  thesuffixIcon: null,
                  obsecureText: false,
                  thecontentPadding: AppDimensions.PaymentTextFieldPadding1,
                  themaxLength: null,
                ),
                Row(
                  children: [
                    myTextField2(
                      thecontroller: _ExpiryDate,
                      thehintText: 'Expiry Date',
                      theicon: null,
                      theWidth: MediaQuery.sizeOf(context).width * 0.149 / 1.0,
                      theHeight: 45.0,
                      themargin: AppDimensions.PaymentTextFieldMargin1,
                      thesuffixIcon: null,
                      obsecureText: false,
                      thecontentPadding: AppDimensions.PaymentTextFieldPadding1,
                      themaxLength: null,
                    ),
                    myTextField2(
                      thecontroller: _Cvv,
                      thehintText: 'Cvv',
                      theicon: null,
                      theWidth: MediaQuery.sizeOf(context).width * 0.149 / 1.0,
                      theHeight: 45.0,
                      themargin: AppDimensions.PaymentTextFieldMargin2,
                      thesuffixIcon: null,
                      obsecureText: false,
                      thecontentPadding: AppDimensions.PaymentTextFieldPadding1,
                      themaxLength: null,
                    ),
                  ],
                ),
                PaymentInfoWidget2(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    alignment: Alignment.center,
                    height: 40,
                    width: 500,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(0, 39, 106, 1)),
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
    );
  }
}
