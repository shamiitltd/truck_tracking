// import 'package:flutter/material.dart';
//  as charts;
// import 'package:truck_tracking/widgets/total_trips_widget/datepicker.dart';
// import 'package:truck_tracking/widgets/total_trips_widget/ordinaldistance.dart';

// class SimpleSeriesLegend extends StatefulWidget {
//   final List<charts.Series<dynamic, String>> seriesList;
//   final bool animate;
//   const SimpleSeriesLegend(this.seriesList, {super.key, this.animate=false});

//   factory SimpleSeriesLegend.withSampleData() {
//     return SimpleSeriesLegend(
//       _createSampleData(),
//       animate: false,
//     );
//   }

//   @override
//   State<SimpleSeriesLegend> createState() => _SimpleSeriesLegendState();

//   /// Create series list with multiple series
//   static List<charts.Series<OrdinalSales, String>> _createSampleData() {
//     final desktopSalesData = [
//       OrdinalSales('2014', 5),
//       OrdinalSales('2015', 25),
//       OrdinalSales('2016', 100),
//       OrdinalSales('2017', 75),
//     ];

//     final tabletSalesData = [
//       OrdinalSales('2014', 25),
//       OrdinalSales('2015', 50),
//       OrdinalSales('2016', 10),
//       OrdinalSales('2017', 20),
//     ];

//     final mobileSalesData = [
//       OrdinalSales('2014', 10),
//       OrdinalSales('2015', 15),
//       OrdinalSales('2016', 50),
//       OrdinalSales('2017', 45),
//     ];

//     final otherSalesData = [
//       OrdinalSales('2014', 20),
//       OrdinalSales('2015', 35),
//       OrdinalSales('2016', 15),
//       OrdinalSales('2017', 10),
//     ];

//     return [
//       charts.Series<OrdinalSales, String>(
//         id: 'Truck-1',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: desktopSalesData,
//       ),
//       charts.Series<OrdinalSales, String>(
//         id: 'Truck-2',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: tabletSalesData,
//       ),
//       charts.Series<OrdinalSales, String>(
//         id: 'Truck-3',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: mobileSalesData,
//       ),
//       charts.Series<OrdinalSales, String>(
//         id: 'Truck-4',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: otherSalesData,
      
//       ),
//     ];
//   }
// }
// class _SimpleSeriesLegendState extends State<SimpleSeriesLegend> {
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const PreferredSize(preferredSize: Size(40, 80), child: DatePicker() ),
//     body :charts.BarChart(
//       widget.seriesList,
//       animate: widget.animate,
//       barGroupingType: charts.BarGroupingType.grouped,
//       behaviors: [charts.SeriesLegend()],
//     )
    
//     );
//   }
// }