import 'package:flutter/material.dart';
import 'package:truck_tracking/config/fonts/fonts.dart';
import 'package:truck_tracking/config/json/order.dart';

class DialogManager {
  static int _dialogCount = 1;

  static void increment() {
    _dialogCount++;
  }

  static void decrement() {
    _dialogCount--;
  }

  static int get dialogCount => _dialogCount;
}

void showOrdersPopup(BuildContext context, List<Order> orders, Function(double, double) updateLocationCallback,String status) {
  final filteredOrders = status.isEmpty ? orders : orders.where((order) => order.status == status).toList();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      DialogManager.increment();
      return Stack(
        children: [
          Positioned(
            top: 50,
            right: 50,
            child: AlertDialog(
              title: Text(
                status.isEmpty ? 'Total Orders' : '$status Orders'.toUpperCase(),
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
                    DialogManager.decrement();
                  },
                  child: Text('Close'),
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
      DialogManager.increment();
      return AlertDialog(
        title: Text('Order Details'),
        content: Container(
          width: 400,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Order ID:', '${order.id}'),
              _buildDetailRow('Address:', '${order.address}'),
              _buildDetailRow('Status:', '${order.status}'),
              /*_buildDetailRow('Aadhar:', '${order.aadhar}'),
              _buildDetailRow('PAN:', '${order.pan}'),*/
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
              DialogManager.decrement();
            },
            child: Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              _trackOrder(context, order, updateLocationCallback);
            },
            child: Text('Track'),
          ),
        ],
      );
    },
  );
}

void _trackOrder(BuildContext context, Order order, Function(double, double) updateLocationCallback) {
  if (order != null) {
    final newLat = order.latitude;
    final newLng = order.longitude;
    updateLocationCallback(newLat, newLng);
    while (DialogManager.dialogCount >= 2) {
      Navigator.of(context).pop();
      DialogManager.decrement();
    }
  }
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