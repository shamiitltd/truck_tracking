import 'package:flutter/material.dart';
import 'package:truck_tracking/config/colors/colors.dart';
import 'package:truck_tracking/screens/Reports/API_calls/trips_detail_api.dart';
import 'package:truck_tracking/screens/Reports/report_widget.dart';


Widget tripsDetails(BuildContext context){
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
                v3: 'Trip Date', v4: 'Distance', v5: 'Fare'),
                Divider(thickness: 2,color: AppColors.loginTextColor,),                    
                SizedBox(height: MediaQuery.of(context).size.height *.6,
                child: TripsDetailsApi()
                ),
              ],
            ),          
            ), 
        );
}