import 'dart:developer';

import 'package:flutter/material.dart';

import '../../Widgets/TextFieldWidget.dart';
import '../../Widgets/TextStyle.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactShippingShipment extends StatefulWidget {
  @override
  State<ContactShippingShipment> createState() =>
      _ContactShippingShipmentState();
}

class _ContactShippingShipmentState extends State<ContactShippingShipment> {
  TextEditingController _FirstName = TextEditingController();

  TextEditingController _LastName = TextEditingController();

  TextEditingController _Email = TextEditingController();

  TextEditingController _ContactNumber = TextEditingController();

  TextEditingController _ShipFrom = TextEditingController();

  TextEditingController _ShipTo = TextEditingController();

  TextEditingController _PickPoint = TextEditingController();

  TextEditingController _DeliveryPoint = TextEditingController();

  TextEditingController _Type = TextEditingController();

  TextEditingController _abc = TextEditingController();

  void saveUser() async {
    String FirstName = _FirstName.text.trim();
    String LastName = _LastName.text.trim();
    String Email = _Email.text.trim();
    String ContactNumber = _ContactNumber.text.trim();
    String ShipFrom = _ShipFrom.text.trim();
    String ShipTo = _ShipTo.text.trim();
    String PickPoint = _PickPoint.text.trim();
    String Type = _Type.text.trim();
    String abc = _abc.text.trim();

    _FirstName.clear();
    _LastName.clear();
    _Email.clear();
    _ContactNumber.clear();
    _ShipFrom.clear();
    _ShipTo.clear();
    _PickPoint.clear();
    _Type.clear();
    _abc.clear();

    if (FirstName != "" &&
        LastName != "" &&
        Email != "" &&
        ContactNumber != "" &&
        ShipFrom != "" &&
        ShipTo != "" &&
        PickPoint != "" &&
        Type != "" &&
        abc != "") {
      Map<String, dynamic> userData = {
        "First Name": FirstName,
        "Last Name": LastName,
        "Email": Email,
        "Contact Number": ContactNumber,
        "Ship From": ShipFrom,
        "Ship To": ShipTo,
        "Pickup Point": PickPoint,
        "Type": Type,
        "abc": abc
      };
      FirebaseFirestore.instance.collection("AddShipment").add(userData);
      log("Sucessfully Added");
    } else {
      log("Please fill all the fields!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.37 / 0.94,
      height: 600,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.9))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Contact Details",
                style: title1(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                myTextField(
                  thecontroller: _FirstName,
                  thehintText: 'First Name',
                  theicon: Icon(Icons.person),
                  theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                  theHeight: 45.0,
                  themarginHorizontal: 15.0,
                  themarginVertical: 20.0,
                  thesuffixIcon: null,
                  obsecureText: false,
                  thecontentPaddingHorizontal: 0.0,
                  thecontentPaddingVertical: 13.0,
                  themaxLength: null,
                ),
                myTextField(
                  thecontroller: _LastName,
                  thehintText: 'Last Name',
                  theicon: Icon(Icons.person),
                  theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                  theHeight: 45.0,
                  themarginHorizontal: 15.0,
                  themarginVertical: 20.0,
                  thesuffixIcon: null,
                  obsecureText: false,
                  thecontentPaddingHorizontal: 0.0,
                  thecontentPaddingVertical: 13.0,
                  themaxLength: null,
                )
              ],
            ),
            Row(
              children: [
                myTextField(
                  thecontroller: _Email,
                  thehintText: 'Email',
                  theicon: Icon(Icons.email),
                  theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                  theHeight: 45.0,
                  themarginHorizontal: 15.0,
                  themarginVertical: 0.0,
                  thesuffixIcon: null,
                  obsecureText: false,
                  thecontentPaddingHorizontal: 0.0,
                  thecontentPaddingVertical: 13.0,
                  themaxLength: null,
                ),
                myTextField(
                  thecontroller: _ContactNumber,
                  thehintText: 'Contact Number',
                  theicon: Icon(Icons.phone),
                  theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                  theHeight: 45.0,
                  themarginHorizontal: 15.0,
                  themarginVertical: 0.0,
                  thesuffixIcon: null,
                  obsecureText: false,
                  thecontentPaddingHorizontal: 0.0,
                  thecontentPaddingVertical: 13.0,
                  themaxLength: null,
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Shipment Details",
                style: title1(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                myTextField(
                  thecontroller: _ShipFrom,
                  thehintText: 'Ship From',
                  theicon: Icon(Icons.location_on),
                  theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                  theHeight: 45.0,
                  themarginHorizontal: 15.0,
                  themarginVertical: 20.0,
                  thesuffixIcon: null,
                  obsecureText: false,
                  thecontentPaddingHorizontal: 0.0,
                  thecontentPaddingVertical: 13.0,
                  themaxLength: null,
                ),
                myTextField(
                  thecontroller: _ShipTo,
                  thehintText: 'Ship To',
                  theicon: Icon(Icons.location_on),
                  theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                  theHeight: 45.0,
                  themarginHorizontal: 15.0,
                  themarginVertical: 20.0,
                  thesuffixIcon: null,
                  obsecureText: false,
                  thecontentPaddingHorizontal: 0.0,
                  thecontentPaddingVertical: 13.0,
                  themaxLength: null,
                ),
              ],
            ),
            Row(
              children: [
                myTextField(
                  thecontroller: _PickPoint,
                  thehintText: 'Pickup Point',
                  theicon: Icon(Icons.location_on),
                  theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                  theHeight: 45.0,
                  themarginHorizontal: 15.0,
                  themarginVertical: 0.0,
                  thesuffixIcon: null,
                  obsecureText: false,
                  thecontentPaddingHorizontal: 0.0,
                  thecontentPaddingVertical: 13.0,
                  themaxLength: null,
                ),
                myTextField(
                  thecontroller: _DeliveryPoint,
                  thehintText: 'Delivery Point',
                  theicon: Icon(Icons.location_on),
                  theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                  theHeight: 45.0,
                  themarginHorizontal: 15.0,
                  themarginVertical: 0.0,
                  thesuffixIcon: null,
                  obsecureText: false,
                  thecontentPaddingHorizontal: 0.0,
                  thecontentPaddingVertical: 13.0,
                  themaxLength: null,
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Shipment Type",
                style: title1(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                myTextField(
                  thecontroller: _Type,
                  thehintText: 'Type',
                  theicon: Icon(Icons.abc),
                  theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                  theHeight: 45.0,
                  themarginHorizontal: 15.0,
                  themarginVertical: 20.0,
                  thesuffixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_drop_down)),
                  obsecureText: false,
                  thecontentPaddingHorizontal: 0.0,
                  thecontentPaddingVertical: 13.0,
                  themaxLength: null,
                ),
                myTextField(
                  thecontroller: _abc,
                  thehintText: null,
                  theicon: Icon(Icons.abc),
                  theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                  theHeight: 45.0,
                  themarginHorizontal: 15.0,
                  themarginVertical: 20.0,
                  thesuffixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_drop_down)),
                  obsecureText: false,
                  thecontentPaddingHorizontal: 0.0,
                  thecontentPaddingVertical: 13.0,
                  themaxLength: null,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () {
                  /*
                  CollectionReference collRef =  FirebaseFirestore.instance
                      .collection('AddShipment');
                  collRef.add({
                    'First Name': _FirstName.text,
                    'Last Name': _LastName.text,
                    'Email': _Email.text,
                    'Contact Number': _ContactNumber.text,
                    'Ship From': _ShipFrom.text,
                    'Ship To': _ShipTo.text,
                    'Pickup Point': _PickPoint.text,
                    'Delivery Point': _DeliveryPoint.text,
                    'Type': _Type.text,
                    'abc': _abc.text
                  }); */
                  saveUser();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 490,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 39, 106, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Add",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
