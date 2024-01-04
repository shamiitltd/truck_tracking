// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:truck_tracking/widgets/Settings/help_info_widget.dart';

class NeedHelp extends StatefulWidget {
  @override
  State<NeedHelp> createState() => _NeedHelpState();
}

class _NeedHelpState extends State<NeedHelp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Container(
          margin: EdgeInsets.symmetric(
              horizontal:
                  sizingInformation.deviceScreenType == DeviceScreenType.desktop
                      ? 15
                      : 0),
          padding: EdgeInsets.symmetric(
              horizontal:
                  sizingInformation.deviceScreenType == DeviceScreenType.desktop
                      ? 20
                      : 0,
              vertical: 20),
          width: sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? MediaQuery.sizeOf(context).width * 0.23
              : MediaQuery.sizeOf(context).width * 1 / 1.6,
          decoration:
              sizingInformation.deviceScreenType == DeviceScreenType.desktop
                  ? BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10))
                  : BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: HelpInfoWidget(
                    theheading: 'Account',
                    theicon: Icons.settings,
                    theparagraph:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard dummy text ever since"),
              ),
              HelpInfoWidget(
                  theheading: 'Notification',
                  theicon: Icons.notifications,
                  theparagraph:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard dummy text ever since"),
              HelpInfoWidget(
                  theheading: 'Security',
                  theicon: Icons.security_sharp,
                  theparagraph:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard dummy text ever since"),
              HelpInfoWidget(
                  theheading: 'Appearance',
                  theicon: Icons.image,
                  theparagraph:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard dummy text ever since"),
              HelpInfoWidget(
                  theheading: 'Billing',
                  theicon: Icons.image,
                  theparagraph:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard dummy text ever since"),
              HelpInfoWidget(
                  theheading: 'Integrations',
                  theicon: Icons.integration_instructions,
                  theparagraph:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard dummy text ever since"),
            ],
          ),
        ),
      ),
    );
  }
}
