import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:truck_tracking/config/Box%20decoration/boxDecoration.dart';
import 'package:truck_tracking/config/colors/colors.dart';

class TotalDrivingTimeWidget extends StatefulWidget {
  const TotalDrivingTimeWidget({super.key});

  @override
  _TotalDrivingTimeWidgetState createState() => _TotalDrivingTimeWidgetState();
}

class _TotalDrivingTimeWidgetState extends State<TotalDrivingTimeWidget> {
  late Future<List<_ChartData>> chartData;
  Duration totalDuration = Duration();

  @override
  void initState() {
    super.initState();
    chartData = fetchData();
  }

  Future<List<_ChartData>> fetchData() async {
    const String jsonData = '''
      [
        {"date": "Sep 21, 2021", "time": 100},
        {"date": "Sep 22, 2021", "time": 150},
        {"date": "Sep 23, 2021", "time": 200},
        {"date": "Sep 24, 2021", "time": 100}
      ]
    ''';

    final List<dynamic> jsonList = json.decode(jsonData);
    // Convert JSON data into _ChartData objects
    final List<_ChartData> dataList = jsonList.map((item) {
      final double time = item['time'].toDouble();
      totalDuration += Duration(hours: time.toInt());
      return _ChartData(item['date'], time);
    }).toList();

    return dataList;
  }

  String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$hours : $minutes : $seconds";
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder<List<_ChartData>>(
      future: chartData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No data available');
        } else {
          final List<_ChartData> data = snapshot.data!;

          return Container(
            margin: EdgeInsets.only(left: 100, top: 200),
            height: screenHeight * 0.5,
            width: screenWidth * 0.35,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.primaryWhite,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [boxDecor.shadow],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Total Driving Time',
                      style: TextStyle(
                        fontSize: screenHeight * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          formatDuration(totalDuration),
                          style: TextStyle(
                            color: Colors.purple[400],
                            fontSize: screenHeight * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "hours",
                              style: TextStyle(
                                fontSize: screenHeight * 0.015,
                              ),
                            ),
                            SizedBox(width: 25),
                            Text(
                              "min",
                              style: TextStyle(
                                fontSize: screenHeight * 0.015,
                              ),
                            ),
                            SizedBox(width: 35),
                            Text(
                              "sec",
                              style: TextStyle(
                                fontSize: screenHeight * 0.015,
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.01),
                Row(
                  children: [
                    Container(
                      width: screenHeight * 0.015,
                      height: screenHeight * 0.015,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[500],
                      ),
                    ),
                    SizedBox(width: screenHeight * 0.01),
                    Text(
                      "Total Time",
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.04),
                Container(
                  height: screenHeight * 0.3,
                  width: screenWidth * 0.32,
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      majorGridLines: MajorGridLines(width: 0),
                      labelPlacement: LabelPlacement.onTicks,
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                    ),
                    primaryYAxis: NumericAxis(
                      interval: 100,
                      majorGridLines: MajorGridLines(width: 0),
                    ),
                    series: <ChartSeries<_ChartData, String>>[
                      SplineAreaSeries<_ChartData, String>(
                          dataSource: data,
                          xValueMapper: (_ChartData data, _) => data.date,
                          yValueMapper: (_ChartData data, _) => data.time,
                          color: Colors.lightBlue[50]
                      ),
                      SplineSeries<_ChartData, String>(
                        dataSource: data,
                        xValueMapper: (_ChartData data, _) => data.date,
                        yValueMapper: (_ChartData data, _) => data.time,
                        width: 4,
                        color: Colors.blue[500],
                        markerSettings: MarkerSettings(
                            isVisible: true,
                            color: Colors.blue[500],
                            width: 10,
                            height: 10
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class _ChartData {
  _ChartData(this.date, this.time);
  final String date;
  final double time;
}

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold(body: TotalDrivingTimeWidget())));
}