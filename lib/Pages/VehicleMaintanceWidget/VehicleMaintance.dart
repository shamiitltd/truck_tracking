import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'UserModel.dart';

class VehicleMaintance extends StatefulWidget {
  @override
  State<VehicleMaintance> createState() => _VehicleMaintanceState();
}

class _VehicleMaintanceState extends State<VehicleMaintance> {
  late User data;
  bool isloading = false;
  @override
  void initState() {
    readLocalJson();
    super.initState();
  }

  readLocalJson() async {
    isloading = true;
    var d = await rootBundle.loadString("assets/json/json.json");
    data = userFromJson(d.toString());
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            height: 335,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "FLEET events",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8), fontSize: 20),
                      ),
                      Text(
                        data.fleet.toString(),
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8), fontSize: 20),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.car_repair,
                              color: Colors.white.withOpacity(0.8),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Harsh breaking",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        Text(
                          data.harshbreaking.toString(),
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.car_repair_sharp,
                            color: Colors.white.withOpacity(0.8),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Excessive idling",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 15),
                          ),
                        ],
                      ),
                      Text(
                        data.excessiveidling.toString(),
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8), fontSize: 20),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.car_repair_sharp,
                              color: Colors.white.withOpacity(0.8),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Harsh acceleration",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        Text(
                          data.harshacceleration.toString(),
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.car_repair_sharp,
                            color: Colors.white.withOpacity(0.8),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Towing",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 15),
                          ),
                        ],
                      ),
                      Text(
                        data.towing.toString(),
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8), fontSize: 20),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.battery_std,
                              color: Colors.white.withOpacity(0.8),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Battery tamper",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        Text(
                          data.batterytamper.toString(),
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
