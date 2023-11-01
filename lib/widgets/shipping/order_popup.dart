// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:truck_tracking/config/fonts/fonts.dart';
import 'package:truck_tracking/config/json/order.dart';

void showOrdersPopup(BuildContext context, List<Order> orders, Function(double, double) updateLocationCallback,String status) {
  final filteredOrders = status.isEmpty
      ? orders
      : orders.where((order) => order.status == status).toList();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned(
            top: 50,
            right: 50,
            child: AlertDialog(
              title: Text(
                status.isEmpty ? 'Total Orders' : '$status Orders',
                style: AppFonts.bold,
              ),
              content: Container(
                width: 300,
                height: 300,
                child: ListView.builder(
                  itemCount: filteredOrders.length,
                  itemBuilder: (context, index) {
                    final order = filteredOrders[index];
                    return ListTile(
                      title: Text(order.id),
                      subtitle: Text(order.address),
                      onTap: () {
                        showOrderDetailsPopup(context, order, updateLocationCallback);
                      },
                    );
                  },
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

void showOrderDetailsPopup(BuildContext context, Order order, Function(double, double) updateLocationCallback) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Order Details'),
        content: Container(
          width: 400,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Order ID:', '${order.id}'),
              _buildDetailRow('Address:', '${order.address}'),
              _buildDetailRow('Status:', '${order.status}'),
              _buildDetailRow('Aadhar:', '${order.aadhar}'),
              _buildDetailRow('PAN:', '${order.pan}'),
              _buildDetailRow('Driver\'s License:', '${order.driversLicense}'),
              _buildDetailRow('Driver\'s Name:', '${order.name}'),
              _buildDetailRow('Vehicle Type:', '${order.vehicleType}'),
              _buildDetailRow('Package Type:', '${order.packageType}'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              _trackOrder(context, order, updateLocationCallback);
            },
            child: const Text('Track'),
          ),
        ],
      );
    },
  );
}

void _trackOrder(BuildContext context, Order order, Function(double, double) updateLocationCallback) {
  final newLat = order.latitude;
  final newLng = order.longitude;
  updateLocationCallback(newLat, newLng);
  Navigator.of(context).pop();
  Navigator.of(context).pop();
}

Widget _buildDetailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppFonts.mediumBold),
        Text(value, style: AppFonts.regular),
      ],
    ),
  );
}
