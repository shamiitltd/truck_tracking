import 'package:final_dashboard/constants/contants.dart';
import 'package:final_dashboard/dashboard/charts_section.dart';
import 'package:final_dashboard/dashboard/header.dart';
import 'package:final_dashboard/dashboard/map.dart';
import 'package:flutter/material.dart';
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(children: [
        Header(),
        SizedBox(height: defaultPadding),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Dashboard",
                            style: TextStyle(color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Cameras",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                  ChartSection(),
                  Container(
                    height: 300,
                     child:GoogleMap(),
                  
                   ),
                  SizedBox(height: defaultPadding),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Driver List",
                            style: Theme.of(context).textTheme.subtitle1),
                        SizedBox(
                          width: double.infinity,
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text("Driver")),
                              DataColumn(label: Text("Vehicle")),
                              DataColumn(label: Text("Status")),
                              DataColumn(label: Text("Fleet")),
                              DataColumn(label: Text("Last Location")),
                            ],
                            rows: [
                              DataRow(
                                cells: [
                                  DataCell(Row(
                                    children: [Text("James")],
                                  )),
                                  DataCell(Text("TATA")),
                                  DataCell(Text("active")),
                                  DataCell(Text("West")),
                                  DataCell(Text("FC"))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
