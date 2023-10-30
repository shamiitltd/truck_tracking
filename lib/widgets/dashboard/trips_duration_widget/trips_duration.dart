import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:truck_tracking/config/colors/colors.dart';
import 'package:truck_tracking/widgets/dashboard/trips_duration_widget/appBar_duration.dart';
import 'package:truck_tracking/widgets/dashboard/trips_duration_widget/legend.dart';


class Tripsduration extends StatefulWidget {
  const Tripsduration({super.key});
  @override
  State<Tripsduration> createState() => _TripsdurationState();
}

class _TripsdurationState extends State<Tripsduration> {
  List<Tripdata> _data = [];
  @override
  void initState() {
    super.initState();
    _loadDataFromJson();
  }

  Future<void> _loadDataFromJson() async {
    final jsonStr = await rootBundle.loadString('assets/dashboard/trips_duration_widget_data/tripsduration.json');
    final jsonData = json.decode(jsonStr) as List<dynamic>;
    setState(() {
      _data = jsonData
          .map((e) => Tripdata(
                e['truckid'] as String,
                e['driving'] as double,
                e['standing'] as double,
                e['halt_duration'] as double,
              ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Appbarduration(),
        const Legendd(),
        Expanded(
          child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryYAxis: NumericAxis(
                  labelStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.007),
                  interval: 1,
                  axisLine: const AxisLine(width: 0),
                  majorGridLines: const MajorGridLines(
                      color: Color.fromARGB(255, 156, 156, 156))),
              // Initialize category axis
              primaryXAxis: CategoryAxis(
                labelStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.0065),
                majorGridLines: const MajorGridLines(width: 0),
              ),
              series: <ColumnSeries<Tripdata, String>>[
                ColumnSeries<Tripdata, String>(
                  // Bind data source
                  color: AppColors.bluebar,
                  dataSource: _data,
                  xValueMapper: (Tripdata sales, _) => sales.truckid,
                  yValueMapper: (Tripdata sales, _) => sales.driving,
                  spacing: 0.22,
                ),
                ColumnSeries<Tripdata, String>(
                  // Bind data source
                  color: AppColors.cyanbar,
                  dataSource: _data,
                  xValueMapper: (Tripdata sales, _) => sales.truckid,
                  yValueMapper: (Tripdata sales, _) => sales.standing,
                  spacing: 0.22,
                ),
                ColumnSeries<Tripdata, String>(
                  color: AppColors.purplebar,

                  // Bind data source
                  dataSource: _data,
                  xValueMapper: (Tripdata sales, _) => sales.truckid,
                  yValueMapper: (Tripdata sales, _) => sales.haltDuration,
                  spacing: 0.22,
                ),
              ]),
        ),
      ],
    );
  }
}

class Tripdata {
  Tripdata(this.truckid, this.driving, this.standing, this.haltDuration);
  final String truckid;
  final double driving;
  final double standing;
  final double haltDuration;
}