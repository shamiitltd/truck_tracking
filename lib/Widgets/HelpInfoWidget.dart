import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HelpInfoWidget extends StatelessWidget {
  const HelpInfoWidget({
    Key? key,
    required this.theheading,
    required this.theicon,
    required this.theparagraph,
  }) : super(key: key);
  final theheading;
  final theicon;
  final theparagraph;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) => Container(
              child:
                  sizingInformation.deviceScreenType == DeviceScreenType.desktop
                      ? Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  theicon,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  child: Text(
                                    theheading,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            child: Container(
                              child: Text(
                                theparagraph,
                                style: TextStyle(
                                  letterSpacing: 0.1,
                                ),
                              ),
                            ),
                          ),
                        ])
                      : Card(
                          child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  theicon,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  child: Text(
                                    theheading,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            child: Container(
                              child: Text(
                                theparagraph,
                                style: TextStyle(
                                  letterSpacing: 0.1,
                                ),
                              ),
                            ),
                          ),
                        ])),
            ));
  }
}
