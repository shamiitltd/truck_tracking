// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:truck_tracking/config/fonts/fonts.dart';
import 'package:truck_tracking/widgets/dashboard/appBar/upload_container.dart';

// ignore: camel_case_types
class Vehicle_Info_form extends StatelessWidget {
  const Vehicle_Info_form({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomStepper(),
    );
  }
}

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int _currentStep = 0;
  bool isComplete = false;
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController vehicleModelController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController vehicleTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp(options: const FirebaseOptions(
        apiKey: "AIzaSyBcrfTEhQAo9luCRmo_HK4Vp3jHMJNgcEQ",
    authDomain: "fleet-vision-360.firebaseapp.com",
    projectId: "fleet-vision-360",
    storageBucket: "fleet-vision-360.appspot.com",
    messagingSenderId: "82682254498",
    appId: "1:82682254498:web:a3f2d683ea7c18ecf833fb"
    )
);
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Stepper(
              type: StepperType.horizontal,
              elevation: 0,
              currentStep: _currentStep,
              onStepTapped: (step) {
                setState(() {
                  _currentStep = step;
                });
              },
              onStepContinue: () {
                if (_currentStep < getSteps().length - 1) {
                  setState(() {
                    _currentStep++;
                  });
                } else {
                  // Submit button pressed
                  isComplete = true;
                }
              },
              onStepCancel: () {
                if (_currentStep > 0) {
                  setState(() {
                    _currentStep--;
                  });
                }
              },
              steps: getSteps(),

              controlsBuilder: (context, details) {
                return Row(
                  children: [
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _currentStep == 1 ? null : details.onStepContinue, // Disable if it's the last step or if all steps are completed
                      child: Text(_currentStep == 1 ? 'Completed' : 'Continue'),
                    ),
                    const SizedBox(width: 16.0 , height: 16,),
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Cancel'),
                    ),
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Submit button pressed
               FirebaseFirestore.instance.collection('vehicles').doc(vehicleNumberController.text).set({
                "name":ownerNameController.text,
                "Vehicle number":vehicleNumberController.text,
                "vehicle type":vehicleTypeController.text,
                "Vehicle Model":vehicleModelController.text,
                "state":stateController.text,
                "color":colorController.text,

                }
                );
              print(ownerNameController.text);
              print(vehicleNumberController.text);
              print(stateController.text);
              print(vehicleTypeController.text);
              print(vehicleModelController.text);
              print(colorController.text);
              Navigator.pop(context);
            },
            child: const Text('Submit'),
          ),

          const SizedBox(height: 30,)
        ],
      ),
    );
  }

  List<Step> getSteps() => [
    Step(
      state: _currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: _currentStep >=0,
      title: const Text('Vehicle Details'),
      content: Column(
        children: [
          const SizedBox(height: 10,),
          TextFormField(

            decoration: InputDecoration(
              labelText: 'Owner Name',
              hintText: "Enter Vehicle Owner Name",
              border: FormTextBoxRadius.normal,
            ),
            controller: ownerNameController,

          ),
          const SizedBox(height: 20,),

          TextFormField(

            decoration: InputDecoration(
              labelText: 'Vehicle Number',
              hintText: "Enter Your Vehicle Number",
              border: FormTextBoxRadius.normal,
            ),
            controller: vehicleNumberController,

          ),
          const SizedBox(height: 20,),

          TextFormField(

            decoration: InputDecoration(
              labelText: 'Vehicle Model',
              hintText: "Enter Your Vehicle Model",
              border: FormTextBoxRadius.normal,
            ),
            controller: vehicleModelController,

          ),
          const SizedBox(height: 20,),

          TextFormField(

            decoration: InputDecoration(
              labelText: 'Vehicle Type',
              hintText: "Enter Your Vehicle Type (MGV, LMV, HMV, HGMV, HPMV, HTV, Trailer)",
              border: FormTextBoxRadius.normal,
            ),
            controller: vehicleTypeController,

          ),
          const SizedBox(height: 20,),

          TextFormField(

            decoration: InputDecoration(
              labelText: 'Pincode',
              hintText: "Enter Your Vehicle Color",
              border: FormTextBoxRadius.normal,
            ),
            controller: colorController,

          ),
          const SizedBox(height: 20,),

          TextFormField(

            decoration: InputDecoration(
              labelText: 'State',
              hintText: "Enter Your State",
              border: FormTextBoxRadius.normal,
            ),
            controller: stateController,
          ),
          const SizedBox(height: 20,)
        ],
      ),
    ),
    Step(
      state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: _currentStep > 0,
      title: const Text('Document'),
      content: const Column(
        children: [
          Uploadcontainer(doc: "RC"),
          SizedBox(height: 20,),
          Uploadcontainer(doc: "Insurance"),
          SizedBox(height: 20,),
          Uploadcontainer(doc: "PUC"),
          SizedBox(height: 20,)
        ],
      ),

    ),
  ];
}