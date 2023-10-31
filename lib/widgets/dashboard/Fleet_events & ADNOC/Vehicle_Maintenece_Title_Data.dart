// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class VehicleMaintanceTitleDataWidget extends StatelessWidget {
  const VehicleMaintanceTitleDataWidget({
    required this.Title,
    required this.Data,
    required this.Size,
    required this.fontWeight,
    Key? key,
  }) : super(key: key);
  final Title;
  final Data;
  final Size;
  final fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Title,
          style: TextStyle(fontSize: Size, fontWeight: fontWeight),
        ),
        Text(
          Data.toString(),
          style: TextStyle(fontSize: Size, fontWeight: fontWeight),
        )
      ],
    );
  }
}

class TitleDataWidget extends StatelessWidget {
  const TitleDataWidget({
    required this.Title,
    required this.Data,
    required this.Boxcolor,
    required this.BorderRadius,
    required this.TheIcon,
    Key? key,
  }) : super(key: key);
  final Title;
  final Data;
  final Boxcolor;
  final BorderRadius;
  final TheIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width * 0.1 / 1.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius,
          color: Boxcolor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.1 / 3.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(TheIcon, color: Colors.blueGrey),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.1 / 0.88,
                    child: Text(
                      Title,
                      style:
                          const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Text(
                Data.toString(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ));
  }
}