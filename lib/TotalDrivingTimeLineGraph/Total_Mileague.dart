

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TotalMileague extends StatelessWidget {
  const TotalMileague({super.key});

  @override
  Widget build(BuildContext context) {
    return DrivingTimeGraph();
  }
}

class DrivingTimeGraph extends StatelessWidget {
  const DrivingTimeGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
   
        children: [
          Padding(padding: EdgeInsets.all(20)),
          Text("Total Mileage" ,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Container(
               height: 500,
               width: 500,
               color: Colors.white,
               child: _LineChart()
            ),
          )
          
        ],
       ),
    );
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1
    );
  }
}

LineChartData get sampleData1 => LineChartData(
   gridData: gridData,
   titlesData: titleData,
   borderData: borderData,
   lineBarsData: lineBarsData,
   minX: 0,
   maxX: 25,
   maxY: 8,
   minY: 0,
);

List<LineChartBarData> get lineBarsData => [
   LineChartBarData1
];



FlTitlesData get titleData => FlTitlesData(
  bottomTitles: AxisTitles(
    sideTitles: bottomTitles,
  ),
  rightTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: false),
  ),
  topTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: false)
  ),
  leftTitles: AxisTitles(
    sideTitles: leftTitles(),
  )

);

Widget leftTitlesWidget(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );

  String text;

  switch(value.toInt()){
    case 1:
     text = '2k';
     break;
      case 2:
     text = '3k';
     break;

      case 3:
     text = '4k';
     break;

      case 4:
     text = '5k';
     break;

      case 5:
     text = '6k';
     break;

      case 6:
     text = '7k';
     break;

      case 7:
     text = '8k';
     break;



     default:
     return Container();
  }
  return Text(text,style: style, textAlign: TextAlign.center,);
}

SideTitles leftTitles() => SideTitles(
  getTitlesWidget: leftTitlesWidget,
  showTitles: true,
  interval: 1,
  reservedSize: 50,
);

Widget bottomTitlesWidget(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );

Widget text;

  switch(value.toInt()){

    case 2:
     text = const Text('Mon',style: style,);
     break;

     case 7:
     text = const Text('tue',style: style,);
     break;

     case 12:
     text = const Text('wed',style: style,);
     break;

     case 17:
     text = const Text('thu',style: style,);
     break;

     case 22:
     text = const Text('fri',style: style,);
     break;

     
     
     default:
     text = const Text('');
     break;
  }

  return SideTitleWidget(
     axisSide: meta.axisSide,
     space: 5,
     child: text,

  );
}

SideTitles get bottomTitles => SideTitles(
    getTitlesWidget: bottomTitlesWidget,
  showTitles: true,
  interval: 1,
  reservedSize: 32,
);

FlGridData get gridData => FlGridData(
  show: false,
);

FlBorderData get borderData => FlBorderData(
  show: true,
  border: Border(
    bottom: BorderSide(color: Colors.grey,width: 4),
    left: const BorderSide(color: Colors.grey),
    right: const BorderSide(color: Colors.transparent),
    top: const BorderSide(color: Colors.transparent),
  ),

);

LineChartBarData get LineChartBarData1 => LineChartBarData(
   isCurved: true,
   color: Colors.blue,
   barWidth: 4,
   isStrokeCapRound: true,
   dotData: FlDotData(show: false),
   belowBarData: BarAreaData(show: false),
   spots: const [
    FlSpot(1, 1),
     FlSpot(2, 2.5),
      FlSpot(7, 3.5),
       FlSpot(10, 2),
        FlSpot(12, 2.5),
         FlSpot(13, 1.6),
          FlSpot(14, 1.9),
          FlSpot(17, 3),
          FlSpot(20, 1.9),
   ]

);



