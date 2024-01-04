// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:truck_tracking/config/json/read_json_data.dart';
import 'package:truck_tracking/widgets/shipping/order_popup.dart';
import 'package:truck_tracking/config/json/order.dart';


// ignore: must_be_immutable
class TotalOrdersWidget extends StatelessWidget {
  int _previousTotalOrders = 0;
  final Function(double, double) updateLocationCallback;

  TotalOrdersWidget({
    Key? key,
    required this.updateLocationCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile = sizingInformation.isMobile;

        return FutureBuilder<List<Order>>(
          future: readJsonData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('No data available');
            } else {
              final orders = snapshot.data;
              final totalOrders = orders?.length ?? 0;

              final totalOrdersPercentage = (totalOrders / totalOrders) * 100;
              final isIncreased = totalOrders > _previousTotalOrders;
              _previousTotalOrders = totalOrders;

              return Container(
                width: 260,
                child: Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      if (orders != null) {
                        showOrdersPopup(
                            context, orders, updateLocationCallback, '');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Orders data is not available')));
                      }
                    },
                    child: Container(
                      height: isMobile ? 100 : 90,
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
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue[100],
                                border: Border.all(
                                  color: Colors.blue.shade100,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                    '${isIncreased
                                        ? '+'
                                        : '-'}${totalOrdersPercentage
                                        .toStringAsFixed(0)}%',
                                    style: TextStyle(
                                      fontSize: isMobile ? 10 : 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: isMobile ? 55 : 120,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'Total Order',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      '$totalOrders',
                                      style: TextStyle(
                                        fontSize: isMobile ? 18 : 23,
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