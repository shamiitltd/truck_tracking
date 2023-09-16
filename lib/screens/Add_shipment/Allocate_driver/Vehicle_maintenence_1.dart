import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

class TrackingData {
  final String vehicle;
  final String device;
  final String driver;
  final String fleet;
  final String location;
  final String start;
  final String end;
  final String details;

  TrackingData({
    required this.vehicle,
    required this.device,
    required this.driver,
    required this.fleet,
    required this.location,
    required this.start,
    required this.end,
    required this.details,
  });
}

class TrackingContainer extends StatefulWidget {
  const TrackingContainer({super.key});

  @override
  _TrackingContainerState createState() => _TrackingContainerState();
}

class _TrackingContainerState extends State<TrackingContainer> {
  List<TrackingData> trackingList = [];

  @override
  void initState() {
    super.initState();
    loadTrackingData();
  }

  Future<void> loadTrackingData() async {
    String jsonString = await rootBundle.loadString('assets/Vehicle.json');
    List<dynamic> jsonList = json.decode(jsonString);

    setState(() {
      trackingList = jsonList.map((json) {
        return TrackingData(
          vehicle: json['vehicle'],
          device: json['device'],
          driver: json['driver'],
          fleet: json['fleet'],
          location: json['location'],
          start: json['start'],
          end: json['end'],
          details: json['details'],
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 161,
      decoration: const BoxDecoration(color: Color(0x99D5D8E0)),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 60,
            columns: const [
              DataColumn(
                label: Text(
                  'Driver',
                  style: TextStyle(
                    color: Color(0xFF1F1F29),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Status',
                  style: TextStyle(
                    color: Color(0xFF1F1F29),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Fleet',
                  style: TextStyle(
                    color: Color(0xFF1F1F29),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Vehicle',
                  style: TextStyle(
                    color: Color(0xFF1F1F29),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Location',
                  style: TextStyle(
                    color: Color(0xFF1F1F29),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Last Update',
                  style: TextStyle(
                    color: Color(0xFF1F1F29),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Driver Time Left',
                  style: TextStyle(
                    color: Color(0xFF1F1F29),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'On Duty Time Left',
                  style: TextStyle(
                    color: Color(0xFF1F1F29),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            rows: trackingList.map((data) {
              return DataRow(cells: [
                DataCell(Text(
                  data.vehicle,
                  style: TextStyle(color: Colors.blue),
                )),
                DataCell(Text(data.device, style: TextStyle(fontSize: 12))),
                DataCell(Text(data.driver, style: TextStyle(fontSize: 12))),
                DataCell(Text(data.fleet, style: TextStyle(fontSize: 12))),
                DataCell(Text(data.location, style: TextStyle(fontSize: 12))),
                DataCell(Text(data.start, style: TextStyle(fontSize: 12))),
                //  DataCell(LinearPercentIndicator( width: 100,lineHeight: 8.0,percent: 0.5,progressColor: Colors.green, linearStrokeCap: LinearStrokeCap.roundAll, barRadius: Radius.circular(10),)),

                // ignore: deprecated_member_use
                // DataCell(LinearPercentIndicator( width: 100,lineHeight: 8.0,percent: 0.5,progressColor: Colors.green, linearStrokeCap: LinearStrokeCap.roundAll, barRadius: Radius.circular(10),)),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}