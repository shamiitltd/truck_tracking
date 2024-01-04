// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
          width: MediaQuery.sizeOf(context).width * 0.1 / 1.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius,
            color: Boxcolor,
          ),
          padding: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical:
                  sizingInformation.deviceScreenType == DeviceScreenType.desktop
                      ? 10.0
                      : 10.0),
          child: Container(
            height:
                sizingInformation.deviceScreenType == DeviceScreenType.desktop
                    ? MediaQuery.sizeOf(context).height * 0.1 / 3.4
                    : 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Icon(
                      TheIcon,
                      color: Colors.blueGrey,
                      size: 24,
                    )),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.1 / 50,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: sizingInformation.deviceScreenType ==
                              DeviceScreenType.desktop
                          ? MediaQuery.sizeOf(context).width * 1 / 10.9
                          : sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet
                              ? MediaQuery.sizeOf(context).width * 1.1 / 7.3
                              : 100,
                      child: Text(
                        Title,
                        style: TextStyle(
                            fontSize: sizingInformation.deviceScreenType ==
                                    DeviceScreenType.desktop
                                ? 12
                                : 12,
                            fontWeight: FontWeight.w500,
                            height: 1.2),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                Text(
                  Data.toString(),
                  style: TextStyle(
                    fontSize: sizingInformation.deviceScreenType ==
                            DeviceScreenType.desktop
                        ? 15
                        : 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
