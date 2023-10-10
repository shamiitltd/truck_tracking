import 'package:flutter/material.dart';
import 'package:truck_tracking/config/fonts/fonts.dart';
import 'package:truck_tracking/widgets/dashboard/uploadcontainer.dart';

// ignore: camel_case_types
class Vehicle_Info_form extends StatelessWidget {
  const Vehicle_Info_form({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStepper(),
    );
  }
}

class CustomStepper extends StatefulWidget {
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
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _currentStep == 1 ? null : details.onStepContinue, // Disable if it's the last step or if all steps are completed
                      child: Text(_currentStep == 1 ? 'Completed' : 'Continue'),
                    ),
                    SizedBox(width: 16.0 , height: 16,),
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: Text('Cancel'),
                    ),
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Submit button pressed
              print(ownerNameController.text);
              print(vehicleNumberController.text);
              print(stateController.text);
              print(vehicleTypeController.text);
              print(vehicleModelController.text);
              print(colorController.text);
              Navigator.pop(context);
            },
            child: Text('Submit'),
          ),

          SizedBox(height: 30,)
        ],
      ),
    );
  }

  List<Step> getSteps() => [
    Step(
      state: _currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: _currentStep >=0,
      title: Text('Vehicle Details'),
      content: Column(
        children: [
          SizedBox(height: 10,),
          TextFormField(

            decoration: InputDecoration(
              labelText: 'Owner Name',
              hintText: "Enter Vehicle Owner Name",
              border: FormTextBoxRadius.normal,
            ),
            controller: ownerNameController,

          ),
          SizedBox(height: 20,),

          TextFormField(

            decoration: InputDecoration(
              labelText: 'Vehicle Number',
              hintText: "Enter Your Vehicle Number",
              border: FormTextBoxRadius.normal,
            ),
            controller: vehicleNumberController,

          ),
          SizedBox(height: 20,),

          TextFormField(

            decoration: InputDecoration(
              labelText: 'Vehicle Model',
              hintText: "Enter Your Vehicle Model",
              border: FormTextBoxRadius.normal,
            ),
            controller: vehicleModelController,

          ),
          SizedBox(height: 20,),

          TextFormField(

            decoration: InputDecoration(
              labelText: 'Vehicle Type',
              hintText: "Enter Your Vehicle Type (MGV, LMV, HMV, HGMV, HPMV, HTV, Trailer)",
              border: FormTextBoxRadius.normal,
            ),
            controller: vehicleTypeController,

          ),
          SizedBox(height: 20,),

          TextFormField(

            decoration: InputDecoration(
              labelText: 'Pincode',
              hintText: "Enter Your Vehicle Color",
              border: FormTextBoxRadius.normal,
            ),
            controller: colorController,

          ),
          SizedBox(height: 20,),

          TextFormField(

            decoration: InputDecoration(
              labelText: 'State',
              hintText: "Enter Your State",
              border: FormTextBoxRadius.normal,
            ),
            controller: stateController,
          ),
          SizedBox(height: 20,)
        ],
      ),
    ),
    Step(
      state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: _currentStep > 0,
      title: Text('Document'),
      content: Column(
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
