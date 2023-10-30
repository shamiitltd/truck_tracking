import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:truck_tracking/config/colors/colors.dart';

class Vehicle_Catagories extends StatefulWidget {
  const Vehicle_Catagories({super.key});

  @override
  State<Vehicle_Catagories> createState() => _Vehicle_CatagoriesState();
}

class _Vehicle_CatagoriesState extends State<Vehicle_Catagories> {
  List<vehiclecatagories> data = [];
  @override
  void initState() {
    super.initState();
    _loadDataFromJson();
  }

  Future<void> _loadDataFromJson() async {
    final jsonStr =
        await rootBundle.loadString('assets/dashboard/vehicle_category_widget_data/vehicle_catagories.json');
    final jsonData = json.decode(jsonStr) as List<dynamic>;
    setState(() {
      data = jsonData
          .map((e) => vehiclecatagories(
                e['total_vehicles'] as double,
                e['running_vehicles'] as double,
                e['vehicle_type'] as String,
              ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              child: const Text("Vehicles categories"),
            ),
            const Expanded(child: Text("")),
            Container(
              child: Text(
                "4800",
                style: TextStyle(
                    color: const Color(0xff9A80FF),
                    fontSize: MediaQuery.of(context).size.width * 0.017),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              child: const Text("total amount"),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 10),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(left: 5),
                child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                    pointers: <GaugePointer>[
                      NeedlePointer(
                          value: data[index].running_vehicles,
                          needleLength: 0.47,
                          enableAnimation: true,
                          animationType: AnimationType.ease,
                          needleStartWidth: 0.3,
                          needleEndWidth: 4,
                          knobStyle: const KnobStyle(
                              knobRadius: 0.08,
                              borderWidth: 0.06,
                              borderColor: Color.fromRGBO(198, 198, 198, 1))),
                      RangePointer(
                        gradient:  SweepGradient(colors: <Color>[
                          AppColors.vehiclecatgradient2,
                          AppColors.vehiclecatgradient1
                        ], stops: <double>[
                          0.25,
                          0.75
                        ]),
                        enableAnimation: true,
                        value: data[index].running_vehicles,
                        cornerStyle: CornerStyle.bothCurve,
                        width: 0.23,
                        sizeUnit: GaugeSizeUnit.factor,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          positionFactor: 2.28,
                          angle: 90,
                          widget: Column(
                            children: [
                              Text(
                                '${data[index].running_vehicles.toStringAsFixed(0)}% / ${data[index].total_vehicles}',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.009,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                data[index].vehicle_type,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.007,
                                ),
                              ),
                            ],
                          ))
                    ],
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    axisLineStyle: const AxisLineStyle(
                      thickness: 0.2,
                      cornerStyle: CornerStyle.bothCurve,
                      color: Color.fromARGB(30, 0, 169, 181),
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                  )
                ]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class vehiclecatagories {
  vehiclecatagories(
      this.total_vehicles, this.running_vehicles, this.vehicle_type);
  final double total_vehicles;
  final double running_vehicles;
  final String vehicle_type;
}