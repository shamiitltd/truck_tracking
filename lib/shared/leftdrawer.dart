// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:truck_tracking/config/routes/routes.dart';

import 'package:truck_tracking/config/colors/colors.dart';
import 'package:truck_tracking/config/fonts/fonts.dart';
import 'package:truck_tracking/config/padding/padding.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimensions.horizontalMediumPadding,
      
      decoration:  BoxDecoration(
        color: AppColors.leftDrawerColor,
        borderRadius: BorderRadius.circular(AppBorderRadius.large),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const SizedBox(
              height: AppDimensions.largeBoxSize,
              ),

          const SizedBox(
            height: AppDimensions.defuaultPadding,
          ),
          Expanded(
            child: Column(
        
              children: [
                DashboardListTile(
                  title: "DashBoard",
                  icon: const Icon(Icons.dashboard),
                  press: () {
                    Navigator.pushNamed(context, MyRoutes.dashboard);
                  },
                ),
                const SizedBox(
                  height: AppDimensions.defuaultPadding,
                ),
                 DashboardListTile(
                  title: "Shipping",
                  icon: const Icon(Icons.local_shipping),
                  press: () {
                     Navigator.pushNamed(context, MyRoutes.shipping);
                  },
                ),
                const SizedBox(
                  height: AppDimensions.defuaultPadding,
                ),
                DashboardListTile(
                  title: "Add Shipment",
                  icon: const Icon(Icons.add_to_photos),
                  press: () {
                     Navigator.pushNamed(context, MyRoutes.addshipmentscreen);
                  },
                ),
                const SizedBox(
                  height: AppDimensions.defuaultPadding,
                ),
                DashboardListTile(
                  title: "Report",
                  icon: const Icon(Icons.bar_chart),
                  press: () {
                      Navigator.pushNamed(context, MyRoutes.reportscreen);
                  },
                ),
                const SizedBox(
                  height:AppDimensions.defuaultPadding,
                ),
                DashboardListTile(
                  title: "Prediction",
                  icon: const Icon(Icons.batch_prediction),
                  press: () {   
                    Navigator.pushNamed(context, MyRoutes.predictionscreen);
                  },
                ),
                const SizedBox(
                  height: AppDimensions.defuaultPadding,
                ),
                DashboardListTile(
                  title: "Settings",
                  icon: const Icon(Icons.settings),
                  press: () {
                    Navigator.pushNamed(context, MyRoutes.settingsscreen);
                  },
                ),
              ],
            ),
          ),


        ],
      ),

    );
  }
}




class DashboardListTile extends StatelessWidget {
  const DashboardListTile({
    required this.title,
    required this.icon,
    required this.press,
    this.iconColor,
    this.textStyle,
  });

  final String title;
  final Icon icon;
  final VoidCallback press;
  final Color? iconColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: iconColor ?? AppColors.drawerTextColor,
      textColor: textStyle?.color ?? AppColors.drawerTextColor,
      visualDensity: const VisualDensity(vertical: -4),
      dense: true,
      onTap: press,
      leading: Icon(
        icon.icon,
        color: iconColor ?? AppColors.drawerTextColor,
      ),
      title: Text(
        title,
        style: textStyle ?? AppFonts.medium.copyWith(color: AppColors.drawerTextColor),
      ),
    );
  }
}
