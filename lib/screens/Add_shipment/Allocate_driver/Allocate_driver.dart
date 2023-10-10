import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:flutter/services.dart' show rootBundle;

class DrivingData {
  final String VehicleTtype;
  // final String Service;
  final String VinNumber;
  final String LicensePlate;
  final String Location;
  // final String Status;
  // final int hashAcceleration;
  // final int hashCornering;
  //final int hashBreaking;
  // final String idleTime;

  DrivingData({
    required this.VehicleTtype,
    // required this.Service,
    required this.VinNumber,
    required this.LicensePlate,
    required this.Location,
    // required this.Status,
    // required this.hashAcceleration,
    // required this.hashCornering,
    //  required this.hashBreaking,
    // required this.idleTime,
  });
}

class AlocateDriverWithVehicle extends StatefulWidget {
  const AlocateDriverWithVehicle({Key? key}) : super(key: key);

  @override
  _AlocateDriverWithVehicleState createState() =>
      _AlocateDriverWithVehicleState();
}

class _AlocateDriverWithVehicleState extends State<AlocateDriverWithVehicle> {
  List<DrivingData> drivingDataList = [];

  @override
  void initState() {
    super.initState();
    _loadDataFromJson();
  }

  Future<void> _loadDataFromJson() async {
    try {
      String jsonData =
          await rootBundle.loadString('asset/json/AlocateDrive.json');
      Map<String, dynamic> jsonObject = convert.json.decode(jsonData);

      setState(() {
        List<dynamic> jsonList = jsonObject['entries'];
        drivingDataList = jsonList.map((json) {
          return DrivingData(
            VehicleTtype: json['Vehicle Type'] ?? 0,
            //   Service: json['Service'] ?? '',
            VinNumber: json['Vin Number'] ?? 0,
            LicensePlate: json['License Plate'] ?? 0,
            Location: json['Location'] ?? 0,
            //  Status: json['Status'] ?? '',
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
    return Scaffold(
      body: Container(
        width: 700,
        height: 500,
        decoration: const BoxDecoration(color: Color(0xFFF5F5FA)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: const Text(
                  "Registered Vehicles",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              DataTable(
                columnSpacing: 60,
                columns: const [
                  DataColumn(
                    label: Text(
                      'VEHICLE TYPE',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // DataColumn(
                  //  label: Text(
                  //    'Service',
                  //   style: TextStyle(
                  //      color: Colors.black,
                  //      fontSize: 12,
                  //     fontFamily: 'Roboto',
                  //      fontWeight: FontWeight.w500,
                  //    ),
                  //  ),
                  // ),
                  DataColumn(
                    label: Text(
                      'VIN NUMBER',
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
                      'LICENSE PLATE',
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
                      'LOCATION',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // DataColumn(
                  //   label: Text(
                  //     'Status',
                  //     style: TextStyle(
                  //      color: Colors.black,
                  //      fontSize: 12,
                  //      fontFamily: 'Roboto',
                  //      fontWeight: FontWeight.w500,
                  //    ),
                  //  ),
                  //   ),
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
                    DataCell(Text(data.VehicleTtype.toString())),
                    //   DataCell(Text(data.Service)),
                    DataCell(Text(data.VinNumber.toString())),
                    DataCell(Text(data.LicensePlate.toString())),
                    DataCell(Text(data.Location.toString())),
                    //     DataCell(Text(data.Status)),
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
      ),
    );
  }
}