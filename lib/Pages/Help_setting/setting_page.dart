import 'package:flutter/material.dart';
import 'package:truck_tracking/config/Padding/padding.dart';

import 'account_setting.dart';
import 'need_help.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.949),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: AppDimensions.SettingPage,
                child: Text(
                  "Help ?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  NeedHelp(),
                  SizedBox(
                    width: 20,
                  ),
                  AccountSetting()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
