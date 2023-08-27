import 'package:flutter/material.dart';
import 'package:truck_tracking/widgets/add_driver_form.dart';
import 'package:truck_tracking/widgets/add_vehicle_form.dart';

import '../../config/colors/colors.dart';
import '../../config/fonts/fonts.dart';
import '../../config/padding/padding.dart';
import '../../shared/leftdrawer.dart';

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
          Padding(padding: AppDimensions.smallPadding),
          Container(
            padding: AppDimensions.mediumPadding,
            width: 284,
            child: LeftDrawer(),
          ),
          SizedBox(
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
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                       color:AppColors.WelcomeContainerColor,
                       borderRadius: BorderRadius.circular(AppBorderRadius.small),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 15,),
                          Text("Welcome Back!",style:AppFonts.medium.copyWith(color:Colors.black)),
                          Spacer(),
                          TextButton.icon(
                          onPressed: () {
                             showDialog(context: context, builder: (context)=>AlertDialog(
                              title: Text("Driver Information",style:AppFonts.bold.copyWith(color:Colors.black)),
                              content: Driver_Info_form(),
                              actions: [
                                TextButton(onPressed: (){}, child:Text("Submit",style:AppFonts.medium))
                              ],
                             )  
                             );                           
                            ;
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
                              content: Vehicle_Info_form(),
                              actions: [
                                TextButton(onPressed: (){}, child:Text("Submit",style:AppFonts.medium))
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
                          SizedBox(width:30)
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
