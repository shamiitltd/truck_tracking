import 'package:flutter/material.dart';
import 'package:truck_tracking/config/json/order.dart';
import 'package:truck_tracking/config/json/read_json_data.dart';
import 'package:truck_tracking/screens/dashboard/main_screen.dart';
import 'package:truck_tracking/widgets/shipping/build_quick_access_widget.dart';
import 'package:truck_tracking/widgets/shipping/build_shipping_status_widget.dart';
import 'package:truck_tracking/widgets/shipping/cancelled_orders_widget.dart';
import 'package:truck_tracking/widgets/shipping/location_tracking.dart';
import 'package:truck_tracking/widgets/shipping/ongoing_orders_widget.dart';
import 'package:truck_tracking/widgets/shipping/successful_orders_widget.dart';
import 'package:truck_tracking/widgets/shipping/total_orders_widget.dart';


class ShippingPage extends StatefulWidget {
  ShippingPage({Key? key}) : super(key: key);

  @override
  State<ShippingPage> createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  List<Order> ordersList = [];
  List<Order> shippingOrdersList = [];
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    loadOrderData();
  }

  Future<void> loadOrderData() async {
    final allOrdersList = await readJsonData();

    shippingOrdersList = allOrdersList.where((order) => order.status == "ongoing").toList();

    if (shippingOrdersList.isNotEmpty) {
      setState(() {
        latitude = shippingOrdersList[0].latitude;
        longitude = shippingOrdersList[0].longitude;
      });
    }
  }

  void updateLocationCallback(double newLat, double newLng) {
    setState(() {
      latitude = newLat;
      longitude = newLng;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          Size _size = MediaQuery.of(context).size;
          final bool isDashboardVisible = MediaQuery.of(context).size.width > 940;

          final bool isLargeScreen = MediaQuery.of(context).size.width >= 1100;

          return Stack(
            children: [
              if (isDashboardVisible) const MainScreen(),
              Container(
                margin: EdgeInsets.only(left: isDashboardVisible ? 380 : 20, top: 40),
                child: Text(
                  "Shipping",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 80, left: isDashboardVisible ? 380 : 20, right: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isLargeScreen)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(flex: _size.width > 800 ? 2 : 4, child: TotalOrdersWidget(updateLocationCallback: updateLocationCallback)),
                          SizedBox(width: 20,),
                          Expanded(flex: _size.width > 800 ? 2 : 4, child: SuccessfulOrdersWidget(updateLocationCallback: updateLocationCallback)),
                          SizedBox(width: 20,),
                          Expanded(flex: _size.width > 800 ? 2 : 4, child: OngoingOrdersWidget(updateLocationCallback: updateLocationCallback)),
                          SizedBox(width: 20,),
                          Expanded(flex: _size.width > 800 ? 2 : 4, child: CancelledOrdersWidget(updateLocationCallback: updateLocationCallback)),
                          SizedBox(width: 20,),
                        ],
                      )
                    else
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: _size.width > 800 ? 2 : 4, child: TotalOrdersWidget(updateLocationCallback: updateLocationCallback)),
                          SizedBox(width: 20,),
                          Expanded(flex: _size.width > 800 ? 2 : 4, child: SuccessfulOrdersWidget(updateLocationCallback: updateLocationCallback)),
                          SizedBox(width: 20,)
                        ],
                      ),
                    if (!isLargeScreen) SizedBox(height: 20),
                    if (!isLargeScreen)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: _size.width > 800 ? 2 : 4, child: OngoingOrdersWidget(updateLocationCallback: updateLocationCallback)),
                          SizedBox(width: 20,),
                          Expanded(flex: _size.width > 800 ? 2 : 4, child: CancelledOrdersWidget(updateLocationCallback: updateLocationCallback)),
                          SizedBox(width: 20,)
                        ],
                      ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 190, left: isDashboardVisible ? 380 : 20, right: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isLargeScreen)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: _size.width > 800 ? 2 : 4, child: LocationTracking(latitude: latitude ?? 0.0, longitude: longitude ?? 0.0,)),
                          SizedBox(width: 20),
                          Expanded(flex: _size.width > 800 ? 2 : 4, child: buildQuickAccessWidget()),
                          SizedBox(width: 20,)
                        ],
                      )
                    else
                      if (!isLargeScreen) SizedBox(height: 130, width: 130,),
                    if (!isLargeScreen)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: _size.width > 800 ? 2 : 4, child: latitude != null && longitude != null ? LocationTracking(latitude: latitude ?? 0.0, longitude: longitude ?? 0.0,) : CircularProgressIndicator()),
                          SizedBox(width: 20,),
                          //Expanded(flex: _size.width > 800 ? 2 : 4, child: buildQuickAccessWidget()),
                          SizedBox(width: 20,)

                        ],
                      ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 460, left: isDashboardVisible ? 378 : 20, right: 590),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isLargeScreen)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: _size.width > 800 ? 2 : 4, child: buildShippingStatusWidget(shippingOrdersList: shippingOrdersList, updateLocationCallback: updateLocationCallback)),
                          SizedBox(width: 20,)
                        ],
                      )
                    else
                      if (!isLargeScreen) SizedBox(height: 130, width: 130,),
                    if (!isLargeScreen)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*Expanded(flex: _size.width > 800 ? 2 : 4, child: buildShippingStatusWidget(shippingOrdersList, ordersList, updateLocationCallback: updateLocationCallback)),
                          SizedBox(width: 20,)*/
                        ],
                      ),
                  ],
                ),
              ),
              //buildShippingStatusWidget(shippingOrdersList, ordersList, updateLocationCallback: updateLocationCallback),
            ],
          );
        },
      ),
    );
  }
}