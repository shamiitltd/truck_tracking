import 'package:flutter/material.dart';
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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: MediaQuery.sizeOf(context).width * 0.23,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            HelpInfoWidget(
                theheading: 'Account',
                theicon: Icons.settings,
                theparagraph:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard dummy text ever since"),
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
    );
  }
}