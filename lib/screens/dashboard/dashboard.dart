import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:truck_tracking/widgets/dashboard/add_driver_form.dart';
import 'package:truck_tracking/widgets/dashboard/add_vehicle_form.dart';
import 'package:truck_tracking/config/colors/colors.dart';
import 'package:truck_tracking/config/fonts/fonts.dart';
import 'package:truck_tracking/config/padding/padding.dart';
import 'package:truck_tracking/shared/leftdrawer.dart';
import 'package:truck_tracking/widgets/dashboard/stepper_widget.dart';

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
              padding: AppDimensions.mediumPadding, // Use the same padding as the LeftDrawer
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whitePageColor,
                  borderRadius: BorderRadius.circular(AppBorderRadius.large),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 45, 
                      width: double.infinity,
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                       color:AppColors.WelcomeContainerColor,
                       borderRadius: BorderRadius.circular(AppBorderRadius.small),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 15,),
                          Text("Welcome Back!",style:AppFonts.medium.copyWith(color:Colors.black)),
                          const Spacer(),
                          TextButton.icon(
                          onPressed: () {
                             showDialog(context: context, builder: (context)=>AlertDialog(
                              title: Text("Driver Information",style:AppFonts.bold.copyWith(color:Colors.black)),
                              content: const Driver_Info_form(),
                              actions: [
                                TextButton(onPressed: (){}, child:const Text("Submit",style:AppFonts.medium))
                              ],
                             )  
                             );                           
                          },
                          icon: const Icon(
                            Icons.add ,
                            color: Colors.black,
                            size: 24.0,
                          ),
                          label: Text('Add Driver',style:AppFonts.medium.copyWith(color:Colors.black))
                          ),
                          TextButton.icon(
                          onPressed: () {
                              showDialog(context: context, builder: (context)=>AlertDialog(
                              title: Text("Vehicle Information",style:AppFonts.bold.copyWith(color:Colors.black)),
                              content: const Vehicle_Info_form(),
                              actions: [
                                TextButton(onPressed: (){}, child:const Text("Submit",style:AppFonts.medium))
                              ],
                             )  
                             ); 
                          },
                          icon: const Icon(
                            Icons.add ,
                            color: Colors.black,
                            size: 24.0,
                          ),
                          label: Text('Add Vehicle',style:AppFonts.medium.copyWith(color:Colors.black))
                          ),
                          ///////////////////////////////////////////////////////////////////////////////
                          TextButton.icon(
                          onPressed: () {
                             showDialog(context: context, builder: (context)=>AlertDialog(
                              title: Text("Stepper widget",style:AppFonts.bold.copyWith(color:Colors.black)),
                              content: const Stepper_widget(),
                              actions: [
                                TextButton(onPressed: (){
                                  FirebaseFirestore.instance.collection('drivers').doc(const Stepper_widget().email).set({
                                    "name":const Stepper_widget().name,
                                    "email":const Stepper_widget().email,
                                    "contact":const Stepper_widget().contact,
                                    "address":const Stepper_widget().address,
                                    "pincode":const Stepper_widget().pincode,
                                    "state":const Stepper_widget().state,
                                    
                                    });
                                }, child:const Text("Submit",style:AppFonts.medium))
                              ],
                              )
                             );
                            },
                            icon: const Icon(
                            Icons.add ,
                            color: Colors.black,
                            size: 24.0,
                          ),
                          label: Text('Add Stepper',style:AppFonts.medium.copyWith(color:Colors.black))
                          ),
                          const SizedBox(width:30),

                          
                        ],
                      ),
                    )
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
