import 'package:flutter/material.dart';
import 'package:truck_tracking/widgets/total_driving_time/line_chart.dart';
class LineChartPage extends StatefulWidget {
  const LineChartPage({super.key});

  @override
  State<LineChartPage> createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {
  @override
  Widget build(BuildContext context) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        color: const Color(0xff020227),
        child: const Padding(
          padding: EdgeInsets.only(top: 16),
          child: LineChartWidget(),
        ),
      );
}