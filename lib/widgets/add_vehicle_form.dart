import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/fonts/fonts.dart';

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
              Text("Vehicle Type",style:AppFonts.medium.copyWith(color:Colors.black,fontWeight:FontWeight.bold)),
              SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your Vehicle Type",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),                                        
              ),
              ///////////////////////////////
              SizedBox(height: 15,),
              Text("Registration No.",style:AppFonts.medium.copyWith(color:Colors.black,fontWeight:FontWeight.bold)),
              SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your Vehicle Registraion number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),                                        
              ),
              /////////////////////////////
              SizedBox(height: 15,),
              Text("Owners Name",style:AppFonts.medium.copyWith(color:Colors.black,fontWeight:FontWeight.bold)),
              SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Owner Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),                                        
              ),    
              /////////////////////////////
              SizedBox(height: 15,),
              Text("Vehicle ID Number",style:AppFonts.medium.copyWith(color:Colors.black,fontWeight:FontWeight.bold)),
              SizedBox(height: 5,),
              TextField(
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: "Enter Your Vehicle ID",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),                                        
              ), 
            //////////////////////////////////
            SizedBox(height: 15,),
            Padding(padding:EdgeInsets.all(0),child: Row(
              children: [
                Text("Status",style:AppFonts.medium.copyWith(color:Colors.black,fontWeight:FontWeight.bold)),
                SizedBox(width:350 ,),
                Text("State",style:AppFonts.medium.copyWith(color:Colors.black,fontWeight:FontWeight.bold)),
                
              ],
            ), ),
            Padding(padding: EdgeInsets.all(0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                  hintText: "Enter Vehicle Status",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ), 
                  ),
              ),
              SizedBox(width: 16), // Add some space between the text fields
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                  hintText: "Enter State",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
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