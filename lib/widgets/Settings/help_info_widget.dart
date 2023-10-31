// ignore_for_file: prefer_typing_uninitialized_variables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

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
    return Column(children: [
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
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Container(
          child: Text(
            theparagraph,
            style: const TextStyle(
              letterSpacing: 0.1,
            ),
          ),
        ),
      ),
    ]);
  }
}