import 'package:flutter/material.dart';
import 'package:truck_tracking/config/colors/colors.dart';
import 'package:truck_tracking/screens/Reports/API_calls/risky_driver_api.dart';
import 'package:truck_tracking/screens/Reports/report_widget.dart';


Widget riskyDriver(BuildContext context){
 return Container(
          height: MediaQuery.of(context).size.height *.85,
          width: MediaQuery.of(context).size.width *.7,   
          child:  Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            // color: AppColors.graphCardColor,
            child:Column(
              children: [
                HeadingRow(v1: 'Driver id', v2: 'Name', 
                v3: 'Accidents', v4: 'Traffic Violations', v5: 'Safety Score'),
                Divider(thickness: 2,color: AppColors.loginTextColor,),                   
                SizedBox(height: MediaQuery.of(context).size.height *.6,
                child: RiskyDriversApi()
                ),
              ],
            ),          
            ), 
        );
}