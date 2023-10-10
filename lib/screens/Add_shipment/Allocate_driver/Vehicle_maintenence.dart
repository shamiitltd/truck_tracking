import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:flutter/services.dart' show rootBundle;

class DrivingData {
  final String FleetEvents;
  final String HarshBreaking;
  final String Excessive;
  final String HarshAcceleration;
  final String Towing;
  final String BatteryTamper;
  // final int hashAcceleration;
  // final int hashCornering;
  //final int hashBreaking;
  // final String idleTime;

  DrivingData({
    required this.FleetEvents,
    required this.HarshBreaking,
    required this.Excessive,
    required this.HarshAcceleration,
    required this.Towing,
    required this.BatteryTamper,
    // required this.hashAcceleration,
    // required this.hashCornering,
    //  required this.hashBreaking,
    // required this.idleTime,
  });
}

class VehicleMaintance extends StatefulWidget {
  const VehicleMaintance({super.key});

  @override
  State<VehicleMaintance> createState() => _VehicleMaintanceState();
}

class _VehicleMaintanceState extends State<VehicleMaintance> {
  List<DrivingData> drivingDataList = [];

  @override
  void initState() {
    super.initState();
    _loadDataFromJson();
  }

  Future<void> _loadDataFromJson() async {
    try {
      String jsonData =
          await rootBundle.loadString('asset/json/VehicleMaintance.json');
      Map<String, dynamic> jsonObject = convert.json.decode(jsonData);

      setState(() {
        List<dynamic> jsonList = jsonObject['entries'];
        drivingDataList = jsonList.map((json) {
          return DrivingData(
            FleetEvents: json['Fleet events'] ?? 0,
            HarshBreaking: json['Harsh breaking'] ?? '',
            Excessive: json['Excessive'] ?? 0,
            HarshAcceleration: json['Harsh acceleration'] ?? 0,
            Towing: json['Towing'] ?? 0,
            BatteryTamper: json['Battery tamper'] ?? '',
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
      width: double.infinity,
      height: 161,
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
            Column(
              children: [DataTable(columns: const [], rows: const [])],
            )
          ],
        ),
      ),
    ));
  }
}