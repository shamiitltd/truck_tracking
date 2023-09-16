import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:truck_tracking/config/json/read_json_data.dart';
import '../../config/json/order.dart';
import 'order_popup.dart';

// ignore: must_be_immutable
class SuccessfulOrdersWidget extends StatelessWidget {
  int _previousSuccessfulOrders = 0;
  final Function(double, double) updateLocationCallback;
  SuccessfulOrdersWidget({Key? key, required this.updateLocationCallback,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile = sizingInformation.isMobile;

        return FutureBuilder<List<Order>>(
          future: readJsonData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Text('No data available');
            } else {
              final orders = snapshot.data;
              final successfulOrders =
                  orders?.where((orders) => orders.status == 'successful').length ??
                      0;
              final totalOrders = orders?.length ?? 1;
              final successfulOrdersPercentage =
                  (successfulOrders / totalOrders) * 100;
              final isIncreased = successfulOrders > _previousSuccessfulOrders;

              _previousSuccessfulOrders = successfulOrders;

              return Container(
                width: 260,
                child: Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      if (orders != null) {
                        showOrdersPopup(
                            context, orders, updateLocationCallback, 'successful');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Orders data is not available')));
                      }
                    },
                    child: Container(
                      height: isMobile ? 100 : 90,
                      // Adjust height for mobile view
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Positioned(
                            left: isMobile ? 20 : 40,
                            child: Container(
                              width: isMobile ? 30 : 50,
                              height: isMobile ? 30 : 50,
                              // Adjust size for mobile view
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.greenAccent[100],
                                border: Border.all(
                                  color: Colors.greenAccent.shade100,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '${isIncreased ? '+' : '-'}${successfulOrdersPercentage.toStringAsFixed(0)}%',
                                  style: TextStyle(
                                    fontSize: isMobile ? 10 : 12,
                                    // Adjust font size for mobile view
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: isMobile ? 55 : 115,
                              ),
                              // Adjust padding for mobile view
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'Successful Order',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      '$successfulOrders',
                                      style: TextStyle(
                                        fontSize: isMobile ? 18 : 23,
                                        // Adjust font size for mobile view
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo.shade900,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}