// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:truck_tracking/config/colors/colors.dart';
import 'package:truck_tracking/config/padding/padding.dart';
import 'package:truck_tracking/screens/Reports/View_data_widgets/Driver_list_widget.dart';
import 'package:truck_tracking/screens/Reports/View_data_widgets/best_drivers_widget.dart';
import 'package:truck_tracking/screens/Reports/View_data_widgets/driver_stat_widget.dart';
import 'package:truck_tracking/screens/Reports/View_data_widgets/dummy_widget.dart';
import 'package:truck_tracking/screens/Reports/View_data_widgets/performance_widget.dart';
import 'package:truck_tracking/screens/Reports/View_data_widgets/risky_driver_widget.dart';
import 'package:truck_tracking/screens/Reports/View_data_widgets/trips_details_widget.dart';
import 'package:truck_tracking/screens/Reports/View_data_widgets/vehicle_widget.dart';
import 'package:truck_tracking/screens/Reports/report_screen.dart';
import 'package:truck_tracking/shared/leftdrawer.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});
  @override
  State<Reports> createState() => _ReportsState();
}
class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
       body:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 15, 0),
              child: Column(
                children: [
                Container(            
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 20,top: 20),  
                  width: MediaQuery.of(context).size.width *.28,
                  height: MediaQuery.of(context).size.height *.6,   
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                     border:Border.all(color: AppColors.reportSceencolor,width: 2),
                  ),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [         
                        Column(        
                          children: [     
                            const listHeading(heading: 'Drivers'), 
                             const SizedBox(
                              height: 10,
                            ),
                            const Divider(thickness: 2),                         
                            listTiles(title: "Drivers list",icon: const Icon(Icons.list_alt),content: driverList(context),),
                             const Divider(thickness: 1),
                             listTiles(title: "Performance",icon: const Icon(Icons.tv),content: performance(context)),
                             const Divider(thickness: 1),
                            listTiles(title: "Scoring",icon: const Icon(Icons.scoreboard),content: dummyList(context)),                          
                             const Divider(thickness: 1),                          
                            listTiles(title: "Best drivers",icon: const Icon(Icons.person),content: bestDrivers(context)),                          
                              const Divider(thickness: 1),
                            listTiles(title: "Driver Statistics",icon: const Icon(Icons.bar_chart),content: driverStat(context)),                          
                             const Divider(thickness: 1),
                            listTiles(title: "Risky Drivers",icon: const Icon(Icons.group),content: riskyDriver(context)),                          
                          ],
                        ),
                    ],
                  ),
                ), 
                    
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 20,top: 20),
                        // padding: AppDimensions.largePadding,
                   width: MediaQuery.of(context).size.width *.28,
                  height: MediaQuery.of(context).size.height *.3,   
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                     border:Border.all(color: AppColors.reportSceencolor,width: 2),
                  ),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const listHeading(heading: 'Trips'),                        
                             const SizedBox(
                              height: 10,
                            ),
                            const Divider(thickness: 2),                          
                            listTiles(title: "Trips details",icon: const Icon(Icons.person),content: tripsDetails(context)),                           
                              const Divider(thickness: 1),
                              listTiles(title: "Trips location",icon: const Icon(Icons.location_history),content: tripsDetails(context)),                       
                        ],
                      )
                  ]),
                )
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                 Container(            
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 20,top: 25),  
                 width: MediaQuery.of(context).size.width *.25,
                height: MediaQuery.of(context).size.height *.2,   
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                   border:Border.all(color: AppColors.reportSceencolor,width: 2),
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [         
                      Column(        
                        children: [
                          const listHeading(heading: 'Vehicles'),
                           const SizedBox(
                            height: 10,
                          ),
                          const Divider(thickness: 2),
                         listTiles(title: "Vehicles",icon: const Icon(Icons.car_crash_rounded),content: vehicleDetails(context)),
                        ],
                      ),
                  ],
                ),
          
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 20,top: 20),
                      // padding: AppDimensions.largePadding,
                 width: MediaQuery.of(context).size.width *.25,
                height: MediaQuery.of(context).size.height *.6,   
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                   border:Border.all(color: AppColors.reportSceencolor,width: 2),
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const listHeading(heading: 'Violations'),
                           const SizedBox(
                            height: 10,
                          ),
                          const Divider(thickness: 2),
                          listTiles(title: "Violation details",icon: const Icon(Icons.person),content: dummyList(context)), 
                            const Divider(thickness: 1),
                            listTiles(title: "Duration",icon: const Icon(Icons.timelapse),content: dummyList(context)),
                          const Divider(thickness: 1),
                          listTiles(title: "Locations",icon: const Icon(Icons.location_history),content: dummyList(context)),                             const Divider(thickness: 1),
                             listTiles(title: "Overview",icon: const Icon(Icons.info),content: dummyList(context)),                             
                            const Divider(thickness: 1),
                            listTiles(title: "Violation summary",icon: const Icon(Icons.summarize_outlined),content: dummyList(context)),                             
                          const Divider(thickness: 1),
                          listTiles(title: "Statistics",icon: const Icon(Icons.bar_chart),content: dummyList(context)),                             
                      ],
                    )
                ]),
              )
            ]),
          ),
          Container(
            child: Column(children: [
               Container(            
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 20,top: 25,right: 15),   
                 width: MediaQuery.of(context).size.width *.25,
                height: MediaQuery.of(context).size.height *.3,   
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                   border:Border.all(color: AppColors.reportSceencolor,width: 2),
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [         
                      Column(        
                        children: [
                          const listHeading(heading: "Activity",),
                           const SizedBox(
                            height: 10,
                          ),
                          const Divider(thickness: 2),
                         listTiles(title: "Activity timeline",icon: const Icon(Icons.timeline),content: dummyList(context)),                          
                           const Divider(thickness: 1),
                          listTiles(title: "Summary",icon: const Icon(Icons.summarize_outlined),content: dummyList(context)),                          
                        ],
                      ),
                  ],
                ),          
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 20,top: 20,right: 15),
                      // padding: AppDimensions.largePadding,                   
                 width: MediaQuery.of(context).size.width *.25,
                height: MediaQuery.of(context).size.height *.52,   
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                   border:Border.all(color: AppColors.reportSceencolor,width: 2),                  
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const listHeading(heading: 'Others'),                        
                           const SizedBox(
                            height: 10,
                          ),
                          const Divider(thickness: 2),
                            listTiles(title: "Distance driven",icon: const Icon(Icons.social_distance),content: dummyList(context)),                           
                            const Divider(thickness: 1),
                            listTiles(title: "Long trip rest violation",icon: const Icon(Icons.trip_origin_outlined),content: dummyList(context)),                             
                          const Divider(thickness: 1),
                          listTiles(title: "Power Violation",icon: const Icon(Icons.power),content: dummyList(context)),                             
                          const Divider(thickness: 1),
                          listTiles(title: "RAG",icon: const Icon(Icons.list_alt),content: dummyList(context)),                             
                          const Divider(thickness: 1),
                          listTiles(title: "Tacho Graph",icon: const Icon(Icons.bar_chart_rounded),content: dummyList(context)),  
                      ],
                    )
                ]),
              )
            ]),
          )
        ],
      )
    );
  }
}