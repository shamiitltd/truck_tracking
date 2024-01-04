// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:truck_tracking/config/padding/padding.dart';
import 'package:truck_tracking/shared/leftdrawer.dart';

import 'account_setting.dart';
import 'need_help.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.949),
      body: SafeArea(
        child: Row(
          children: [
            const Padding(padding: AppDimensions.smallPadding),
            Container(
              padding: AppDimensions.mediumPadding,
              width: 284,
              child: const LeftDrawer(),
            ),
            const SizedBox(
              width: AppDimensions.defuaultPadding,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: AppDimensions.SettingPage,
                      child: const Text(
                        "Help ?",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ),
                    ScreenTypeLayout.builder(
                      desktop: (p0) => SettingPageDesktopView(),
                      tablet: (p0) => SettingPageTabletView(),
                      mobile: (p0) => SettingPageTabletView(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget SettingPageDesktopView() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        width: 10,
      ),
      NeedHelp(),
      const SizedBox(
        width: 20,
      ),
      AccountSetting()
    ],
  );
}

Widget SettingPageTabletView() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        width: 10,
      ),
      NeedHelp(),
      const SizedBox(
        width: 20,
      ),
      AccountSetting()
    ],
  );
}
