import 'package:flutter/material.dart';
import 'package:truck_tracking/config/fonts/fonts.dart';


// ignore: must_be_immutable
class Stepper_widget extends StatefulWidget {
   Stepper_widget({super.key});

  String? get email => null;
  get name => null;
  get contact => null;
  get address => null;
  get pincode => null;
  get state => null;
    
  @override
  State<Stepper_widget> createState() => _Stepper_widgetState();
}
class _Stepper_widgetState extends State<Stepper_widget> {
  
  int activestepindex=0;
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController contactController = TextEditingController();
    TextEditingController stateProvinceController = TextEditingController();
    TextEditingController pincodeController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    String email='',name='',contact='',state='',pincode='',address='';

    
    
  List<Step> step_list()=>[
    Step(
      state: activestepindex<=0 ? StepState.editing:StepState.complete,
      isActive: activestepindex>=0,
      title:const Text("Personal Information"),
      content: Center(
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
                controller: nameController,                                   
              ),
              //////////////////////////////////////////////
           const SizedBox(height: 15,),
            const Padding(padding:EdgeInsets.all(0),child: Row(
              children: [
                Text("Contact",style:AppFonts.vehicleformtext),
                SizedBox(width:345 ,),
                Text("E-mail",style:AppFonts.vehicleformtext),
                
              ],
            ), ),
           Padding(padding: const EdgeInsets.all(0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                  hintText: "Enter Your Contact number",
                  border: FormTextBoxRadius.normal
                ), 
                controller: contactController,                                   

                  ),
              ),
              const SizedBox(width: 16), // Add some space between the text fields
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                  hintText: "Enter Your  e-mail address",
                  border: FormTextBoxRadius.normal
                ),
                controller: emailController,                                   
                ),
              ),
            ],
            ),),
              /////////////////////////////////////////////////
             
            const SizedBox(height: 15,),
            const Padding(padding:EdgeInsets.all(0),child: Row(
              children: [
                Text("Pin Code",style:AppFonts.vehicleformtext),
                SizedBox(width:345 ,),
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
                controller: pincodeController,                                   

                  ),
              ),
              const SizedBox(width: 16), // Add some space between the text fields
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                  hintText: "Enter Your State",
                  border: FormTextBoxRadius.normal
                ), 
                controller: stateProvinceController,                                   
                ),
              ),
            ],
            ),),
              /////////////////////////////////////////////////    
              const SizedBox(height: 15,),
              const Text("Address",style:AppFonts.vehicleformtext),
              const SizedBox(height: 5,),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Enter Your residential address",
                  border: FormTextBoxRadius.normal
                ), 
                controller: addressController,                                   
              ),
              ]
            )
    )),
    Step(
      state: activestepindex<=1 ? StepState.editing:StepState.complete,
      isActive: activestepindex>=1,
      title: const Text("Document Information"),
      content: Center(
        child: Text("Documents"),
    ))
  ];

  
  @override
  Widget build(BuildContext context) {
    

    return Container(
      width: 800,
      child: Stepper(
        steps: step_list(),
        currentStep: activestepindex,
        type: StepperType.horizontal,
        onStepContinue:(){
          if(activestepindex<(step_list().length-1)){
            activestepindex +=1;
          }
          setState(() {
            email=emailController.text;
            contact=contactController.text;
            name=nameController.text;
            state=stateProvinceController.text;
            pincode=pincodeController.text;
            address=addressController.text;

          });
        },
        onStepCancel: (){
          if(activestepindex>0){
            activestepindex -=1;
          }
          setState(() {
            
          });
        },
      ),
    );
  }
}


// Future<void> pick_image() async{
//     if(!kIsWeb){
//       final ImagePicker _picker=ImagePicker();
//       XFile? image=await _picker.pickImage(source: ImageSource.gallery);
//       if(image != null){
//         var selected=File(image.path);
//       }
// }
// }


