import 'package:flutter/material.dart';
import 'package:truck_tracking/config/fonts/fonts.dart';

// ignore: camel_case_types
class Driver_Info_form extends StatelessWidget {
  const Driver_Info_form({
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
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
              print(nameController.text);
              print(emailController.text);
              print(stateController.text);
              print(addressController.text);
              print(contactController.text);
              print(pinCodeController.text);
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
      title: Text('Driver Details'),
      content: Column(
        children: [
          SizedBox(height: 10,),
          TextFormField(

            decoration: InputDecoration(
              labelText: 'Full Name',
              hintText: "Enter Your Name",
              border: FormTextBoxRadius.normal,
            ),
            controller: nameController,

          ),
          SizedBox(height: 20,),

          TextFormField(

            decoration: InputDecoration(
              labelText: 'Email',
              hintText: "Enter Your Email",
              border: FormTextBoxRadius.normal,
            ),
            controller: emailController,

          ),
          SizedBox(height: 20,),

          TextFormField(

            decoration: InputDecoration(
              labelText: 'Mobile Number',
              hintText: "Enter Your Mobile Number",
              border: FormTextBoxRadius.normal,
            ),
            controller: contactController,

          ),
          SizedBox(height: 20,),

          TextFormField(

            decoration: InputDecoration(
              labelText: 'Address',
              hintText: "Enter Your Address",
              border: FormTextBoxRadius.normal,
            ),
            controller: addressController,

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
          SizedBox(height: 20,),

          TextFormField(

            decoration: InputDecoration(
              labelText: 'Pincode',
              hintText: "Enter Your Pincode",
              border: FormTextBoxRadius.normal,
            ),
            controller: pinCodeController,

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
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 20,)
        ],
      ),

    ),
  ];
}
