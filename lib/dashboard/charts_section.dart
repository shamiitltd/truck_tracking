import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartSection extends StatelessWidget {
  const ChartSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 50),
        SizedBox(
          width: 100,
          height: 100,
          child: PieChart(PieChartData(sections: [
            PieChartSectionData(value: 152, color: Color(0xFFFC9D5DF)),
            PieChartSectionData(value: 52, color: Colors.green)
          ])),
        ),
        Spacer(),
        SizedBox(
            width: 100,
            height: 100,
            child: PieChart(PieChartData(sections: [
              PieChartSectionData(
                  value: 152,
                  color: Color(
                    0xFFFC9D5DF,
                  )),
              PieChartSectionData(value: 52, color: Colors.green)
            ]))),
        Spacer(),
        SizedBox(
          width: 100,
          height: 100,
          child: PieChart(PieChartData(sections: [
            PieChartSectionData(
                value: 152,
                color: Color(
                  0xFFFC9D5DF,
                )),
            PieChartSectionData(value: 52, color: Colors.green)
          ])),
        )
      ],
    );
  }
}
