import 'package:flutter/material.dart';

import '../../Widgets/TextFieldWidget.dart';
import '../../Widgets/TextStyle.dart';

class AccountSetting extends StatefulWidget {
  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  TextEditingController _FirstName = TextEditingController();
  TextEditingController _LastName = TextEditingController();
  TextEditingController _Country = TextEditingController();
  TextEditingController _UserName = TextEditingController();
  TextEditingController _PersonalNumber = TextEditingController();
  TextEditingController _OptionalNumber = TextEditingController();
  TextEditingController _Email = TextEditingController();
  TextEditingController _OldPassword = TextEditingController();
  TextEditingController _NewPassword = TextEditingController();
  TextEditingController _ConfirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.37 / 0.94,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.9)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Account",
                  style: heading(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Review and update your account details",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                    "Please make sure that this detail are up to date as they will be used for bookings, and communincation with hotels"),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("> Learn More about that",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "1.Edit Profile",
                  style: title4(),
                ),
              ),
              Row(
                children: [
                  myTextField(
                    thecontroller: _FirstName,
                    thehintText: 'First Name',
                    theicon: Icon(Icons.person),
                    theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                    theHeight: 45.0,
                    themarginHorizontal: 15.0,
                    themarginVertical: 20.0,
                    thesuffixIcon: null,
                    obsecureText: false,
                    thecontentPaddingHorizontal: 0.0,
                    thecontentPaddingVertical: 13.0,
                    themaxLength: null,
                  ),
                  myTextField(
                    thecontroller: _LastName,
                    thehintText: 'Last Name',
                    theicon: Icon(Icons.person),
                    theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                    theHeight: 45.0,
                    themarginHorizontal: 15.0,
                    themarginVertical: 20.0,
                    thesuffixIcon: null,
                    obsecureText: false,
                    thecontentPaddingHorizontal: 0.0,
                    thecontentPaddingVertical: 13.0,
                    themaxLength: null,
                  ),
                ],
              ),
              Row(
                children: [
                  myTextField(
                    thecontroller: _Country,
                    thehintText: 'Country',
                    theicon: Icon(Icons.location_city),
                    theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                    theHeight: 45.0,
                    themarginHorizontal: 15.0,
                    themarginVertical: 20.0,
                    thesuffixIcon: null,
                    obsecureText: false,
                    thecontentPaddingHorizontal: 0.0,
                    thecontentPaddingVertical: 13.0,
                    themaxLength: null,
                  ),
                  myTextField(
                    thecontroller: _UserName,
                    thehintText: 'User name',
                    theicon: Icon(Icons.person),
                    theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                    theHeight: 45.0,
                    themarginHorizontal: 15.0,
                    themarginVertical: 20.0,
                    thesuffixIcon: null,
                    obsecureText: false,
                    thecontentPaddingHorizontal: 0.0,
                    thecontentPaddingVertical: 13.0,
                    themaxLength: null,
                  ),
                ],
              ),
              Row(
                children: [
                  myTextField(
                    thecontroller: _PersonalNumber,
                    thehintText: 'Personal Number',
                    theicon: Icon(Icons.phone),
                    theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                    theHeight: 45.0,
                    themarginHorizontal: 15.0,
                    themarginVertical: 20.0,
                    thesuffixIcon: null,
                    obsecureText: false,
                    thecontentPaddingHorizontal: 0.0,
                    thecontentPaddingVertical: 13.0,
                    themaxLength: null,
                  ),
                  myTextField(
                    thecontroller: _OptionalNumber,
                    thehintText: 'Optional Number',
                    theicon: Icon(Icons.phone),
                    theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                    theHeight: 45.0,
                    themarginHorizontal: 15.0,
                    themarginVertical: 20.0,
                    thesuffixIcon: null,
                    obsecureText: false,
                    thecontentPaddingHorizontal: 0.0,
                    thecontentPaddingVertical: 13.0,
                    themaxLength: null,
                  ),
                ],
              ),
              Row(
                children: [
                  myTextField(
                    thecontroller: _Email,
                    thehintText: 'Email',
                    theicon: Icon(Icons.email),
                    theWidth: MediaQuery.sizeOf(context).width * 0.144,
                    theHeight: 45.0,
                    themarginHorizontal: 15.0,
                    themarginVertical: 20.0,
                    thesuffixIcon: null,
                    obsecureText: false,
                    thecontentPaddingHorizontal: 0.0,
                    thecontentPaddingVertical: 13.0,
                    themaxLength: null,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 480,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(0, 39, 106, 1)),
                    child: Text(
                      "Save Change",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.9)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "2.Edit Password",
                  style: title4(),
                ),
              ),
              Row(
                children: [
                  myTextField(
                    thecontroller: _OldPassword,
                    thehintText: 'Old Password',
                    theicon: Icon(Icons.key_sharp),
                    theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                    theHeight: 45.0,
                    themarginHorizontal: 15.0,
                    themarginVertical: 20.0,
                    thesuffixIcon: null,
                    obsecureText: true,
                    thecontentPaddingHorizontal: 0.0,
                    thecontentPaddingVertical: 13.0,
                    themaxLength: null,
                  ),
                  myTextField(
                    thecontroller: _NewPassword,
                    thehintText: 'New Password',
                    theicon: Icon(Icons.key_sharp),
                    theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                    theHeight: 45.0,
                    themarginHorizontal: 15.0,
                    themarginVertical: 20.0,
                    thesuffixIcon: null,
                    obsecureText: true,
                    thecontentPaddingHorizontal: 0.0,
                    thecontentPaddingVertical: 13.0,
                    themaxLength: null,
                  ),
                ],
              ),
              myTextField(
                thecontroller: _ConfirmPassword,
                thehintText: 'Confirm Password',
                theicon: Icon(Icons.key_sharp),
                theWidth: MediaQuery.sizeOf(context).width * 0.144 / 1.0,
                theHeight: 45.0,
                themarginHorizontal: 15.0,
                themarginVertical: 15.0,
                thesuffixIcon: null,
                obsecureText: true,
                thecontentPaddingHorizontal: 0.0,
                thecontentPaddingVertical: 13.0,
                themaxLength: null,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 480,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(0, 39, 106, 1)),
                    child: Text(
                      "Save Change",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.9)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
