import 'package:flutter/material.dart';
import 'package:truck_tracking/config/fonts/fonts.dart';

// ignore: camel_case_types
class Vehicle_Info_form extends StatelessWidget {
  const Vehicle_Info_form({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(  
          width:800,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.large)
          ), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Vehicle Type",style:AppFonts.vehicleformtext),
              const SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your Vehicle Type",
                  border: FormTextBoxRadius.normal
                ),                                        
              ),
              ///////////////////////////////
              const SizedBox(height: 15,),
              const Text("Registration No.",style:AppFonts.vehicleformtext),
              const SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your Vehicle Registraion number",
                  border: FormTextBoxRadius.normal
                ),                                        
              ),
              /////////////////////////////
              const SizedBox(height: 15,),
              const Text("Owners Name",style:AppFonts.vehicleformtext),
              const SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Owner Name",
                  border: FormTextBoxRadius.normal
                ),                                        
              ),    
              /////////////////////////////
              const SizedBox(height: 15,),
              const Text("Vehicle ID Number",style:AppFonts.vehicleformtext),
              const SizedBox(height: 5,),
              TextField(
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: "Enter Your Vehicle ID",
                  border: FormTextBoxRadius.normal
                ),                                        
              ), 
            //////////////////////////////////
            const SizedBox(height: 15,),
            const Padding(padding:EdgeInsets.all(0),child: Row(
              children: [
                Text("Status",style:AppFonts.vehicleformtext),
                SizedBox(width:350 ,),
                Text("State",style:AppFonts.vehicleformtext),
                
              ],
            ), ),
            Padding(padding: const EdgeInsets.all(0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                  hintText: "Enter Vehicle Status",
                  border: FormTextBoxRadius.normal
                ), 
                  ),
              ),
              const SizedBox(width: 16), // Add some space between the text fields
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                  hintText: "Enter State",
                  border: FormTextBoxRadius.normal
                ), 
                ),
              ),
            ],
            ),)
            ],
          ),
                                 ),
    );
  }
}