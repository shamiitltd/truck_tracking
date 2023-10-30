import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:truck_tracking/config/colors/colors.dart';
import 'package:truck_tracking/config/BoxDecorations/box_decoration.dart';

class TotalTripsWidget extends StatefulWidget {
  const TotalTripsWidget({super.key});

  @override
  _TotalTripsWidgetState createState() => _TotalTripsWidgetState();
}

class _TotalTripsWidgetState extends State<TotalTripsWidget> {
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
        {"date": "Sep 21, 2021", "trips": 100},
        {"date": "Sep 22, 2021", "trips": 150},
        {"date": "Sep 23, 2021", "trips": 200},
        {"date": "Sep 24, 2021", "trips": 100}
      ]
    ''';

    final List<dynamic> jsonList = json.decode(jsonData);
    // Convert JSON data into _ChartData objects
    final List<_ChartData> dataList = jsonList.map((item) {
      return _ChartData(item['date'], item['trips'].toDouble());
    }).toList();

    return dataList;
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
            // margin: EdgeInsets.only(left: 100, top: 200),
            height: screenHeight * 0.6,
            width: screenWidth * 0.3,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.primaryWhite,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [boxDecor.shadow],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Trips',
                  style: TextStyle(
                    fontSize: screenHeight * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.025),
                Row(
                  children: [
                    Container(
                      width: screenHeight * 0.015,
                      height: screenHeight * 0.015,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.trips_graphPurple,
                      ),
                    ),
                    SizedBox(width: screenHeight * 0.01),
                    Text(
                      "Total amount",
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.04),
                Expanded(
                  child: Container(
                    height: screenHeight * 0.4,
                    width: screenWidth * 0.27,
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
                          color: Colors.deepPurple[50]
                      ),
                      SplineSeries<_ChartData, String>(
                        dataSource: data,
                        xValueMapper: (_ChartData data, _) => data.date,
                        yValueMapper: (_ChartData data, _) => data.time,
                        width: 2,
                        color: Colors.deepPurple[400],
                        markerSettings: MarkerSettings(
                            isVisible: true,
                            color: Colors.deepPurple[400],
                            width: 8,
                            height: 8
                        ),
                      ),
                      ],
                    ),
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

