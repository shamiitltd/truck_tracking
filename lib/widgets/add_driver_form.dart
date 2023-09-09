import 'package:flutter/material.dart';
import 'package:truck_tracking/config/fonts/fonts.dart';

// ignore: camel_case_types
class Driver_Info_form extends StatelessWidget {
  const Driver_Info_form({
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
              const Text("Name",style:AppFonts.vehicleformtext),
              const SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your Name",
                  border: FormTextBoxRadius.normal
                ),                                        
              ),
              ///////////////////////////////
              const SizedBox(height: 15,),
              const Text("E-mail Adress",style:AppFonts.vehicleformtext),
              const SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your email id",
                  border: FormTextBoxRadius.normal
                ),                                        
              ),
              /////////////////////////////
              const SizedBox(height: 15,),
              const Text("Contact",style:AppFonts.vehicleformtext),
              const SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your Phone number",
                  border:FormTextBoxRadius.normal
                ),                                        
              ),    
              /////////////////////////////
              const SizedBox(height: 15,),
              const Text("Employee ID",style:AppFonts.vehicleformtext),
              const SizedBox(height: 5,),
              TextField(
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: "Enter Your Employee ID",
                  border: FormTextBoxRadius.normal
                ),                                        
              ), 
              /////////////////////////////
              const SizedBox(height: 15,),
              const Text("Address",style:AppFonts.vehicleformtext),
              const SizedBox(height: 5,),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Enter Your residential address",
                  border: FormTextBoxRadius.normal
                ),                                        
              ),
            //////////////////////////////////
            const SizedBox(height: 15,),
            const Padding(padding:EdgeInsets.all(0),child: Row(
              children: [
                Text("Pin Code",style:AppFonts.vehicleformtext),
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
                  hintText: "Enter Your Pin code",
                  border: FormTextBoxRadius.normal
                ), 
                  ),
              ),
              const SizedBox(width: 16), // Add some space between the text fields
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                  hintText: "Enter Your State",
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