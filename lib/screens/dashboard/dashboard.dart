// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:truck_tracking/config/colors/colors.dart';
import 'package:truck_tracking/config/fonts/fonts.dart';
import 'package:truck_tracking/config/padding/padding.dart';
import 'package:truck_tracking/shared/leftdrawer.dart';
import 'package:truck_tracking/widgets/dashboard/Fleet_events%20&%20ADNOC/ADNOC%20events/adnoc_fleet_event.dart';
import 'package:truck_tracking/widgets/dashboard/Fleet_events%20&%20ADNOC/Fleet_events/Fleet_events.dart';
import 'package:truck_tracking/widgets/dashboard/appBar/Add_driver/add_driver_form.dart';
import 'package:truck_tracking/widgets/dashboard/appBar/Add_vehicle/add_vehicle_form.dart';
import 'package:truck_tracking/widgets/dashboard/appBar/notification_icon.dart';
import 'package:truck_tracking/widgets/dashboard/total_driving_time_widget/total_driving_time.dart';
import 'package:truck_tracking/widgets/dashboard/total_trips_widget/total_trips.dart';
import 'package:truck_tracking/widgets/dashboard/vehicle_category_widget/vehicle_category.dart';
import 'package:truck_tracking/widgets/dashboard/trips_duration_widget/trips_duration.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: AppDimensions.smallPadding),
          Container(
            padding: AppDimensions.mediumPadding,
            width: 284,
            child: const LeftDrawer(),
          ),
          const SizedBox(
            width: AppDimensions.defuaultPadding,
          ),
          Expanded(
            child: Padding(
              padding: AppDimensions
                  .mediumPadding, // Use the same padding as the LeftDrawer
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 242, 239),
                  borderRadius: BorderRadius.circular(AppBorderRadius.large),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 45,
                        width: double.infinity,
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.WelcomeContainerColor,
                          borderRadius:
                              BorderRadius.circular(AppBorderRadius.small),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Text("Welcome Back!",
                                style: AppFonts.medium
                                    .copyWith(color: Colors.black)),
                            const Spacer(),
                            TextButton.icon(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text("Driver Information",
                                                style: AppFonts.bold.copyWith(
                                                    color: Colors.black)),
                                            content: Container(
                                              height: 600,
                                              width: 650,
                                              child: const Driver_Info_form(),
                                            ),
                                          ));
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 24.0,
                                ),
                                label: Text('Add Driver',
                                    style: AppFonts.medium
                                        .copyWith(color: Colors.black))),
                            TextButton.icon(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text("Vehicle Information",
                                                style: AppFonts.bold.copyWith(
                                                    color: Colors.black)),
                                            content: Container(
                                              height: 600,
                                              width: 650,
                                              child: const Vehicle_Info_form(),
                                            ),
                                          ));
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 24.0,
                                ),
                                label: Text('Add Vehicle',
                                    style: AppFonts.medium
                                        .copyWith(color: Colors.black))),
                            const SizedBox(width: 30),
                            const NotificationIcon()
                          ],
                        ),
                      ),
                      ScreenTypeLayout.builder(
                        desktop: (p0) => dashboardDesktopView(),
                        tablet: (p0) => dashboardDesktopView(),
                        mobile: (p0) => dashboardDesktopView(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class dashboardDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
          margin: const EdgeInsets.all(12),
          child: StaggeredGrid.count(
            crossAxisCount:
                sizingInformation.deviceScreenType == DeviceScreenType.desktop
                    ? 4
                    : 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: sizingInformation.deviceScreenType ==
                        DeviceScreenType.desktop
                    ? 1
                    : 3,
                mainAxisCellCount: 1,
                child: sizingInformation.deviceScreenType ==
                        DeviceScreenType.desktop
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Tripsduration(),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Vehicle_Catagories(),
                      ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: sizingInformation.deviceScreenType ==
                        DeviceScreenType.desktop
                    ? 2
                    : 1,
                mainAxisCellCount: 1,
                child: sizingInformation.deviceScreenType ==
                        DeviceScreenType.desktop
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Vehicle_Catagories(),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Tripsduration(),
                      ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TotalDrivingTimeWidget(),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TotalTripsWidget(),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TotalDrivingTimeWidget(),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const AdnocEventFleet(),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const FleetEvent(),
                ),
              ),
            ],
          )),
    );
  }
}
