import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(OverspeedingApp());
}

class OverspeedingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overspeeding Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OverspeedingScreen(),
    );
  }
}

class OverspeedingScreen extends StatefulWidget {
  @override
  _OverspeedingScreenState createState() => _OverspeedingScreenState();
}

class _OverspeedingScreenState extends State<OverspeedingScreen> {
  List<FlSpot> overspeedingData = [
    FlSpot(1, 3), // Example data: Date 1 - 3 incidents
    FlSpot(2, 1), // Example data: Date 2 - 1 incidents
    FlSpot(3, 5), // Example data: Date 3 - 5 incidents
    FlSpot(4, 2), // Example data: Date 3 - 5 incidents
    FlSpot(5, 7), // Example data: Date 3 - 5 incidents
    // Add more data points as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overspeeding Tracker'),
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
                      color: Colors.blue,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: true),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Overspeeding Incidents Over Time',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
     ),
);
}
}