import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:truck_tracking/config/Box%20decoration/boxDecoration.dart';
import 'package:truck_tracking/config/fonts/fonts.dart';
import 'package:truck_tracking/config/colors/colors.dart';
import 'package:truck_tracking/config/json/order.dart';
import 'package:truck_tracking/config/json/read_json_data.dart';
import 'order_popup.dart';

//ignore: must_be_immutable
class CancelledOrdersWidget extends StatelessWidget {
  int _previousCancelledOrders = 0;
  final Function(double, double) updateLocationCallback;

  CancelledOrdersWidget({Key? key, required this.updateLocationCallback});

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
              final cancelledOrders = orders?.where((orders) => orders.status == 'cancelled').length ?? 0;
              final totalOrders = orders?.length ?? 0;

              final cancelledOrdersPercentage = (cancelledOrders / totalOrders) * 100;
              final isIncreased = cancelledOrders > _previousCancelledOrders;

              _previousCancelledOrders = cancelledOrders;

              return InkWell(
                onTap: () async {
                  if (orders != null) {
                    showOrdersPopup(
                        context, orders, updateLocationCallback, 'cancelled');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Orders data is not available')));
                  }
                },
                child: Container(
                  width: 260,
                  child: Expanded(
                    child: Container(
                      height: isMobile ? 100 : 90, // Adjust height for mobile view
                      decoration: BoxDecoration(
                        color: AppColors.primaryWhite,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [boxDecor.shadow],
                      ),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Positioned(
                            left: isMobile ? 20 : 40,
                            child: Container(
                              width: isMobile ? 30 : 50,
                              height: isMobile ? 30 : 45, // Adjust size for mobile view
                              decoration: boxDecor.redCircle,
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                    '${isIncreased ? '+' : '-'}${cancelledOrdersPercentage.toStringAsFixed(0)}%', style: AppFonts.customFont(isMobile),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: isMobile ? 55 : 115), // Adjust padding for mobile view
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text('Cancelled Order', style: AppFonts.medium),
                                  ),
                                  SizedBox(height: 3,),
                                  FittedBox(
                                    child: Text(
                                      '$cancelledOrders',
                                      style: AppFonts.customIndigo900(isMobile),
                                    ),
                                  )
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