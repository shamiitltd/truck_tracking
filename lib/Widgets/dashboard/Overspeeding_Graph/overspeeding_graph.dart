// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const OverspeedingApp());
}

class OverspeedingApp extends StatelessWidget {
  const OverspeedingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overspeeding Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OverspeedingScreen(),
    );
  }
}

class OverspeedingScreen extends StatefulWidget {
  const OverspeedingScreen({super.key});

  @override
  _OverspeedingScreenState createState() => _OverspeedingScreenState();
}

class _OverspeedingScreenState extends State<OverspeedingScreen> {
  List<FlSpot> overspeedingData = [
    const FlSpot(1, 3), // Example data: Date 1 - 3 incidents
    const FlSpot(2, 1), // Example data: Date 2 - 1 incidents
    const FlSpot(3, 5), // Example data: Date 3 - 5 incidents
    const FlSpot(4, 2), // Example data: Date 3 - 5 incidents
    const FlSpot(5, 7), // Example data: Date 3 - 5 incidents
    // Add more data points as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overspeeding Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 2.0,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: const Color(0xff37434d), width: 1),
                  ),
                  minX: 1,
                  maxX: overspeedingData.length.toDouble(),
                  minY: 0,
                  maxY: overspeedingData.fold(0, (max, spot) => spot.y > max ? spot.y.toInt() : max).toDouble() + 2,
                  lineBarsData: [
                    LineChartBarData(
                      spots: overspeedingData,
                      isCurved: true,
                      colors: [Colors.blue],
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: true),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Overspeeding Incidents Over Time',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
     ),
);
}
}