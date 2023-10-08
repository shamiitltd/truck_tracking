import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:truck_tracking/widgets/dashboard/add_driver_form.dart';
import 'package:truck_tracking/widgets/dashboard/add_vehicle_form.dart';
import 'package:truck_tracking/config/colors/colors.dart';
import 'package:truck_tracking/config/fonts/fonts.dart';
import 'package:truck_tracking/config/padding/padding.dart';
import 'package:truck_tracking/shared/leftdrawer.dart';
import 'package:truck_tracking/widgets/dashboard/stepper_widget.dart';
import 'package:truck_tracking/widgets/dashboard/vehicle_catagories.dart';

import '../../widgets/dashboard/tripsduration.dart';

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
                child: Column(
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
                                          content: const Driver_Info_form(),
                                          actions: [
                                            TextButton(
                                                onPressed: () {},
                                                child: const Text("Submit",
                                                    style: AppFonts.medium))
                                          ],
                                        ));
                                ;
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
                                          content: const Vehicle_Info_form(),
                                          actions: [
                                            TextButton(
                                                onPressed: () {},
                                                child: const Text("Submit",
                                                    style: AppFonts.medium))
                                          ],
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
                          ///////////////////////////////////////////////////////////////////////////////
                          TextButton.icon(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text("Stepper widget",
                                              style: AppFonts.bold.copyWith(
                                                  color: Colors.black)),
                                          content: Stepper_widget(),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  FirebaseFirestore.instance
                                                      .collection('drivers')
                                                      .doc(Stepper_widget()
                                                          .email)
                                                      .set({
                                                    "name":
                                                        Stepper_widget().name,
                                                    "email":
                                                        Stepper_widget().email,
                                                    "contact": Stepper_widget()
                                                        .contact,
                                                    "address": Stepper_widget()
                                                        .address,
                                                    "pincode": Stepper_widget()
                                                        .pincode,
                                                    "state":
                                                        Stepper_widget().state,
                                                  });
                                                },
                                                child: const Text("Submit",
                                                    style: AppFonts.medium))
                                          ],
                                        ));
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 24.0,
                              ),
                              label: Text('Add Stepper',
                                  style: AppFonts.medium
                                      .copyWith(color: Colors.black))),
                          const SizedBox(width: 30),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                            margin: const EdgeInsets.all(12),
                            child: StaggeredGrid.count(
                              crossAxisCount: 4,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              children: [
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Tripsduration(),
                                  ),
                                ),
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 2,
                                  mainAxisCellCount: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Vehicle_Catagories(),
                                  ),
                                ),
                              ],
                            )))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
