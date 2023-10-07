import 'package:flutter/material.dart';
import 'package:truck_tracking/config/Box%20decoration/boxDecoration.dart';
import 'package:truck_tracking/config/fonts/fonts.dart';
import 'package:truck_tracking/config/colors/colors.dart';
import 'package:truck_tracking/config/json/order.dart';
import 'order_popup.dart';

class buildShippingStatusWidget extends StatefulWidget {
  final List<Order> shippingOrdersList;
  final void Function(double newLat, double newLng) updateLocationCallback;

  buildShippingStatusWidget({
    required this.shippingOrdersList,
    required this.updateLocationCallback,
  });

  @override
  State<buildShippingStatusWidget> createState() => _buildShippingStatusWidgetState();
}

class _buildShippingStatusWidgetState extends State<buildShippingStatusWidget> {
  int selectOrderIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 550,
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [boxDecor.shadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text("Ongoing Shipping", style: AppFonts.mediumBold),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(
              itemCount: widget.shippingOrdersList.length,
              itemBuilder: (context, index) {
                final order = widget.shippingOrdersList[index];

                return ListTile(
                  leading: Icon(Icons.data_saver_off_rounded),
                  title: InkWell(
                    onTap: () {
                      showOrderDetailsPopup(context, order, widget.updateLocationCallback);
                    },
                    child: Row(
                      children: [
                        Flexible(child: Text(order.id, overflow: TextOverflow.ellipsis, maxLines: 1,)),
                        SizedBox(width: 25,),
                        Flexible(child: Text(order.address, overflow: TextOverflow.ellipsis, maxLines: 1,)),
                      ],
                    ),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      showOrderDetailsPopup(context, order, widget.updateLocationCallback);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.account_circle_rounded),
                        SizedBox(width: 25,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            order.status.toUpperCase(),
                            style: AppFonts.mediumBoldGreen,
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
}