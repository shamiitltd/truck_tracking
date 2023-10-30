import 'package:flutter/material.dart';
import 'package:truck_tracking/config/colors/colors.dart';

class Legendd extends StatelessWidget {
  const Legendd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2000),
                  color: AppColors.bluebar,
                ),
              ),
              Text(
                "Driving",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.0073),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5, left: 5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2000),
                  color: AppColors.cyanbar,
                ),
              ),
              Text(
                "Standing",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.0073),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.only(right: 5, left: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2000),
                  color: AppColors.purplebar,
                ),
              ),
              Text(
                "Halt Duration",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.0073),
              )
            ],
          )
        ],
      ),
    );
  }
}