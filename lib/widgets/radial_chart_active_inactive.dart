import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../config/colors/colors.dart';
import '../config/fonts/fonts.dart';

class Driver {
  final String driverName;
  final String truckNumber;
  final String status;

  Driver(this.driverName, this.truckNumber, this.status);
}
class RadialChartWidget extends StatefulWidget {
  const RadialChartWidget({Key? key}) : super(key: key);

  @override
  _RadialChartWidgetState createState() => _RadialChartWidgetState();

}
class _RadialChartWidgetState extends State<RadialChartWidget> {
  late List<Driver> drivers = [];
  late num activeDriverCount;
  late num inactiveDriverCount;
  List<_RadialData> chartData=[]; // Declare the chartData list here

  @override
  void initState() {
    super.initState();
    loadDriverData();
  }

  num getActiveDriverCount() {
    return drivers.where((driver) => driver.status == 'active').length;
  }

  num getInactiveDriverCount() {
    return drivers.where((driver) => driver.status == 'inactive').length;
  }
Future<void> loadDriverData() async {
    String jsonContent = await rootBundle.loadString('assets/radial_chart_data_active_inactive.json');
    List<dynamic> driverList = json.decode(jsonContent)['data'];
    drivers = driverList.map((driverData) => Driver(
          driverData['driver_name'],
          driverData['truck_number'],
          driverData['status'],
        )).toList();

    // Calculate counts and initialize chartData after loading driver data
    activeDriverCount = getActiveDriverCount();
    inactiveDriverCount = getInactiveDriverCount();
     chartData = [
      _RadialData('Active', activeDriverCount),
      _RadialData('InActive', inactiveDriverCount),
    ];

    setState(() {});
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(''),
      // ),
      body: Container(
        width:MediaQuery.of(context).size.width *1,
        height: MediaQuery.of(context).size.height *.4,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
                  color: AppColors.whitePageColor,
                  borderRadius: BorderRadius.circular(AppBorderRadius.large),
                  
                ),
        child: SfCircularChart(
          //  backgroundColor: Colors.black,
            palette: const [ AppColors.graphColor3,AppColors.graphColor2,],
            title: ChartTitle(text: 'Active Vehicles',),
            legend: const Legend(isVisible: true),
     // Radial graph implementation
          series: [
            RadialBarSeries<_RadialData, String>(
               radius: '80%',
                innerRadius: '70%',
                gap: '8%',
                cornerStyle: CornerStyle.bothCurve,
              dataSource: chartData,
              xValueMapper: (_RadialData data, _) => data.xData,
              yValueMapper: (_RadialData data, _) => data.yData,
            ),
          ],
        ),
      ),
    );
  }
}
class _RadialData {
  _RadialData(this.xData, this.yData);
   final String xData;
  final num yData;
}