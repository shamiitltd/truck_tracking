import 'package:flutter/material.dart';
import 'package:truck_tracking/config/json/order.dart';
import 'order_popup.dart';

Widget buildShippingStatusWidget(List<Order> shippingOrdersList, List<Order> orders, {required void Function(double newLat, double newLng) updateLocationCallback}) {
  return Container(
    //margin: EdgeInsets.only(top: 460, left: 378, right: 0),
    height: 240,
    width: 550,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15, top: 15),
          child: Text(
            "Ongoing Shipping",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5,),
        Expanded(
          child: ListView.builder(
            itemCount: shippingOrdersList.length,
            itemBuilder: (context, index) {
              final order = shippingOrdersList[index];
              return GestureDetector(
                onTap: (){
                    showOrderDetailsPopup(context, order, updateLocationCallback);
                },
                child: ListTile(
                  leading: const Icon(Icons.check_box),
                  title: Row(
                    children: [
                      Text(order.id),
                      const SizedBox(width: 35,),
                      Text(order.address),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(width: 15,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          order.status.toUpperCase(),
                          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    ),
  );
}