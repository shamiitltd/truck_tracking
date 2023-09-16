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
import 'package:truck_tracking/screens/Reports/report_widget.dart';
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
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 5, 15, 0),
              child: Column(
                children: [
                Container(            
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 20,top: 20),  
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
                            listHeading(heading: 'Drivers'), 
                             SizedBox(
                              height: 10,
                            ),
                            Divider(thickness: 2),                         
                            listTiles(title: "Drivers list",icon: Icon(Icons.list_alt),content: driverList(context),),
                             Divider(thickness: 1),
                             listTiles(title: "Performance",icon: Icon(Icons.tv),content: performance(context)),
                             Divider(thickness: 1),
                            listTiles(title: "Scoring",icon: Icon(Icons.scoreboard),content: dummyList(context)),                          
                             Divider(thickness: 1),                          
                            listTiles(title: "Best drivers",icon: Icon(Icons.person),content: bestDrivers(context)),                          
                              Divider(thickness: 1),
                            listTiles(title: "Driver Statistics",icon: Icon(Icons.bar_chart),content: driverStat(context)),                          
                             Divider(thickness: 1),
                            listTiles(title: "Risky Drivers",icon: Icon(Icons.group),content: riskyDriver(context)),                          
                          ],
                        ),
                    ],
                  ),
                ), 
                    
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 20,top: 20),
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
                          listHeading(heading: 'Trips'),                        
                             SizedBox(
                              height: 10,
                            ),
                            Divider(thickness: 2),                          
                            listTiles(title: "Trips details",icon: Icon(Icons.person),content: tripsDetails(context)),                           
                              Divider(thickness: 1),
                              listTiles(title: "Trips location",icon: Icon(Icons.location_history),content: tripsDetails(context)),                       
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
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 20,top: 25),  
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
                          listHeading(heading: 'Vehicles'),
                           SizedBox(
                            height: 10,
                          ),
                          Divider(thickness: 2),
                         listTiles(title: "Vehicles",icon: Icon(Icons.car_crash_rounded),content: vehicleDetails(context)),
                        ],
                      ),
                  ],
                ),
          
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 20,top: 20),
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
                        listHeading(heading: 'Violations'),
                           SizedBox(
                            height: 10,
                          ),
                          Divider(thickness: 2),
                          listTiles(title: "Violation details",icon: Icon(Icons.person),content: dummyList(context)), 
                            Divider(thickness: 1),
                            listTiles(title: "Duration",icon: Icon(Icons.timelapse),content: dummyList(context)),
                          Divider(thickness: 1),
                          listTiles(title: "Locations",icon: Icon(Icons.location_history),content: dummyList(context)),                             Divider(thickness: 1),
                             listTiles(title: "Overview",icon: Icon(Icons.info),content: dummyList(context)),                             
                            Divider(thickness: 1),
                            listTiles(title: "Violation summary",icon: Icon(Icons.summarize_outlined),content: dummyList(context)),                             
                          Divider(thickness: 1),
                          listTiles(title: "Statistics",icon: Icon(Icons.bar_chart),content: dummyList(context)),                             
                      ],
                    )
                ]),
              )
            ]),
          ),
          Container(
            child: Column(children: [
               Container(            
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 20,top: 25,right: 15),   
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
                          listHeading(heading: "Activity",),
                           SizedBox(
                            height: 10,
                          ),
                          Divider(thickness: 2),
                         listTiles(title: "Activity timeline",icon: Icon(Icons.timeline),content: dummyList(context)),                          
                           Divider(thickness: 1),
                          listTiles(title: "Summary",icon: Icon(Icons.summarize_outlined),content: dummyList(context)),                          
                        ],
                      ),
                  ],
                ),          
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 20,top: 20,right: 15),
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
                        listHeading(heading: 'Others'),                        
                           SizedBox(
                            height: 10,
                          ),
                          Divider(thickness: 2),
                            listTiles(title: "Distance driven",icon: Icon(Icons.social_distance),content: dummyList(context)),                           
                            Divider(thickness: 1),
                            listTiles(title: "Long trip rest violation",icon: Icon(Icons.trip_origin_outlined),content: dummyList(context)),                             
                          Divider(thickness: 1),
                          listTiles(title: "Power Violation",icon: Icon(Icons.power),content: dummyList(context)),                             
                          Divider(thickness: 1),
                          listTiles(title: "RAG",icon: Icon(Icons.list_alt),content: dummyList(context)),                             
                          Divider(thickness: 1),
                          listTiles(title: "Tacho Graph",icon: Icon(Icons.bar_chart_rounded),content: dummyList(context)),  
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