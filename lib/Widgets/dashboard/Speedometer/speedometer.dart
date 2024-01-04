// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:fl_chart/fl_chart.dart';
class Speedometer extends StatelessWidget {
  const Speedometer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Radial Gauge
          Container(
            height: 200,
            width: 300,
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue:70,
                      color: Colors.lightBlue
                    ),
                    GaugeRange(
                      startValue:70,
                      endValue: 100,
                      color: Colors.lightBlueAccent
                    ),

                  ],
                  pointers: <GaugePointer>[
                    const NeedlePointer(
                      value: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Line Graph
          Container(
            height:200,
            width: 300,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: true),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: const Color(0xff37434d),
                    width: 1,
                  ),
                ),
                minX: 0,
                maxX: 5,
                minY: 20,
                maxY: 80,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 20),
                      const FlSpot(1, 35),
                      const FlSpot(2, 68),
                      const FlSpot(3, 72),
                      const FlSpot(4, 50),
                      const FlSpot(5, 29),
                    ],
                    isCurved: true,
                    colors: [Colors.blue],
                    dotData: FlDotData(show: true),
                    belowBarData: BarAreaData(show: false)
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
     );
  }
}