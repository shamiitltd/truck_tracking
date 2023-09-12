import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:flutter/services.dart' show rootBundle;

class DrivingData {
  final String TrackerNumber;
  final String Service;
  final String Category;
  final String Weight;
  final String Date;
  final String Status;
  // final int hashAcceleration;
  // final int hashCornering;
  //final int hashBreaking;
  // final String idleTime;

  DrivingData({
    required this.TrackerNumber,
    required this.Service,
    required this.Category,
    required this.Weight,
    required this.Date,
    required this.Status,
    // required this.hashAcceleration,
    // required this.hashCornering,
    //  required this.hashBreaking,
    // required this.idleTime,
  });
}

class DrivingDataTableWidget extends StatefulWidget {
  const DrivingDataTableWidget({Key? key}) : super(key: key);

  @override
  _DrivingDataTableWidgetState createState() => _DrivingDataTableWidgetState();
}

class _DrivingDataTableWidgetState extends State<DrivingDataTableWidget> {
  List<DrivingData> drivingDataList = [];

  @override
  void initState() {
    super.initState();
    _loadDataFromJson();
  }

  Future<void> _loadDataFromJson() async {
    try {
      String jsonData =
          await rootBundle.loadString('asset/images/scoreboardinfo.json');
      Map<String, dynamic> jsonObject = convert.json.decode(jsonData);

      setState(() {
        List<dynamic> jsonList = jsonObject['entries'];
        drivingDataList = jsonList.map((json) {
          return DrivingData(
            TrackerNumber: json['Tracker Number'] ?? 0,
            Service: json['Service'] ?? '',
            Category: json['Category'] ?? 0,
            Weight: json['Weight'] ?? 0,
            Date: json['Date'] ?? 0,
            Status: json['Status'] ?? '',
            // hashAcceleration: json['HashAcceleration'] ?? 0,
            // hashCornering: json['HashCornering'] ?? 0,
            // hashBreaking: json['HashBreaking'] ?? 0,
            // idleTime: json['Idle time'] ?? '',
          );
        }).toList();
      });
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 161,
      decoration: const BoxDecoration(color: Color(0xFFF5F5FA)),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                "History",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            DataTable(
              columnSpacing: 60,
              columns: const [
                DataColumn(
                  label: Text(
                    'Tracker Number',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Service',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Category',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Weight',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Date',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Status',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                /*  DataColumn(
                  label: Text(
                    'Hash Acceleration',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                   DataColumn(
                  label: Text(
                    'Hash Cornering',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Hash Breaking',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Idle time',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Actions',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),     */
              ],
              rows: drivingDataList.map((data) {
                return DataRow(cells: [
                  DataCell(Text(data.TrackerNumber.toString())),
                  DataCell(Text(data.Service)),
                  DataCell(Text(data.Category.toString())),
                  DataCell(Text(data.Weight.toString())),
                  DataCell(Text(data.Date.toString())),
                  DataCell(Text(data.Status)),
                  //   DataCell(Text(data.hashAcceleration.toString())),
                  //  DataCell(Text(data.hashCornering.toString())),
                  //   DataCell(Text(data.hashBreaking.toString())),
                  //   DataCell(Text(data.idleTime)),
                  //  DataCell(TextButton(
                  // onPressed: () {
                  // Perform action when the "view" button is tapped
                  // For example, navigate to another page
                  //  },
                  //  child: Text('View'),
                  // )),
                ]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
