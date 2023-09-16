import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'order.dart';

Future<List<Order>> readJsonData() async {
  final jsondata = await rootBundle.rootBundle.loadString('assets/orders.json');
  final data = json.decode(jsondata);

  final ordersList = (data['Orders'] as List).map((e) =>
      Order(
        id: e['id'],
        address: e['address'],
        status: e['status'],
        aadhar: e['aadhar'],
        pan: e['pan'],
        driversLicense: e['drivers_license'],
        name: e['name'],
        vehicleType: e['vehicle_type'],
        packageType: e['package_type'],
        latitude: e['latitude'],
        longitude: e['longitude'],
      )
  ).toList();
  return ordersList;
}