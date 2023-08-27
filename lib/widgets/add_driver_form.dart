import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/fonts/fonts.dart';

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
              Text("Name",style:AppFonts.medium.copyWith(color:Colors.black,fontWeight:FontWeight.bold)),
              SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),                                        
              ),
              ///////////////////////////////
              SizedBox(height: 15,),
              Text("E-mail Adress",style:AppFonts.medium.copyWith(color:Colors.black,fontWeight:FontWeight.bold)),
              SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your email id",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),                                        
              ),
              /////////////////////////////
              SizedBox(height: 15,),
              Text("Contact",style:AppFonts.medium.copyWith(color:Colors.black,fontWeight:FontWeight.bold)),
              SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your Phone number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),                                        
              ),    
              /////////////////////////////
              SizedBox(height: 15,),
              Text("Employee ID",style:AppFonts.medium.copyWith(color:Colors.black,fontWeight:FontWeight.bold)),
              SizedBox(height: 5,),
              TextField(
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: "Enter Your Employee ID",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),                                        
              ), 
              /////////////////////////////
              SizedBox(height: 15,),
              Text("Address",style:AppFonts.medium.copyWith(color:Colors.black,fontWeight:FontWeight.bold)),
              SizedBox(height: 5,),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Enter Your residential address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),                                        
              ),
            //////////////////////////////////
            SizedBox(height: 15,),
            Padding(padding:EdgeInsets.all(0),child: Row(
              children: [
                Text("Pin Code",style:AppFonts.medium.copyWith(color:Colors.black,fontWeight:FontWeight.bold)),
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
                  hintText: "Enter Your Pin code",
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
                  hintText: "Enter Your State",
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