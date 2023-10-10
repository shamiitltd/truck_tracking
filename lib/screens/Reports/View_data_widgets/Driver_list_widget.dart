import 'package:flutter/material.dart';
import 'package:truck_tracking/config/colors/colors.dart';
import 'package:truck_tracking/screens/Reports/API_calls/driver_list_api_call.dart';
import 'package:truck_tracking/screens/Reports/report_widget.dart';

Widget driverList(BuildContext context){
 return SizedBox(
          height: MediaQuery.of(context).size.height *.85,
          width: MediaQuery.of(context).size.width *.7,   
          child:  Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            // color: AppColors.graphCardColor,
            child:Column(
              children: [
                HeadingRow(v1: 'Id', v2: 'Name', v3: 'Age', v4: 'License_number', v5: 'Phone'),
                const Divider(thickness: 2,color: AppColors.loginTextColor,),                    
                SizedBox(height: MediaQuery.of(context).size.height *.6,
                child: const DriverListApi()
                // child: DriverList()
                ),
              ],
            ),          
            ), 
        );
}