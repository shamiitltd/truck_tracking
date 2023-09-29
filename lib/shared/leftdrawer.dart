import 'package:flutter/material.dart';
import 'package:truck_tracking/config/routes/routes.dart';

import '../config/colors/colors.dart';
import '../config/fonts/fonts.dart';
import '../config/padding/padding.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimensions.horizontalMediumPadding,
      decoration: BoxDecoration(
        color: AppColors.leftDrawerColor,
        borderRadius: BorderRadius.circular(AppBorderRadius.large),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppDimensions.largeBoxSize,
          ),
          SizedBox(
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
                  height: AppDimensions.defuaultPadding,
                ),
                DashboardListTile(
                  title: "Prediction",
                  icon: const Icon(Icons.batch_prediction),
                  press: () {},
                ),
                const SizedBox(
                  height: AppDimensions.defuaultPadding,
                ),
                DashboardListTile(
                  title: "Settings",
                  icon: const Icon(Icons.settings),
                  press: () {},
                ),
                const SizedBox(
                  height: AppDimensions.defuaultPadding,
                ),
                DashboardListTile(
                  title: "Trips Duration",
                  icon: const Icon(Icons.fire_truck),
                  press: () {
                    Navigator.pushNamed(context, MyRoutes.tripsduration);
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
      visualDensity: VisualDensity(vertical: -4),
      dense: true,
      onTap: press,
      leading: Icon(
        icon.icon,
        color: iconColor ?? AppColors.drawerTextColor,
      ),
      title: Text(
        title,
        style: textStyle ??
            AppFonts.medium.copyWith(color: AppColors.drawerTextColor),
      ),
    );
  }
}
