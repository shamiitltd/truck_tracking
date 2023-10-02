import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../utilis/color.dart';
import 'detail_page.dart';

class ExpensesWidget extends StatefulWidget {
  const ExpensesWidget({super.key});

  @override
  State<ExpensesWidget> createState() => _ExpensesWidgetState();
}

class _ExpensesWidgetState extends State<ExpensesWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Container(
              height: 277,
              width: 1138,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 40, right: 40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Expenses
                        Text(
                          'Expenses',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 27),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(),
                              ),
                            );
                          },
                          child: Text(
                            'View Details',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Yearly',
                          style: GoogleFonts.roboto(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        const PieChartWidget(
                          maintenanceCost: 3200,
                          labourCost: 1500,
                          fuelCost: 1000,
                          otherCost: 1600,
                        ),

                        SizedBox(width: 90),
                        //Maintenance Expense
                        DifferentExpensesWidget(
                          expenseType: 'Maintenance',
                          expenseCost: '₹3200',
                          expensePercentage: '55%',
                          expenseColor: MyColors.maintenance,
                        ),

                        //Labour Cost Expense
                        DifferentExpensesWidget(
                          expenseType: 'Labour Cost',
                          expenseCost: '₹1500',
                          expensePercentage: '14%',
                          expenseColor: MyColors.labourCost,
                        ),
                        //Fuel Expense
                        DifferentExpensesWidget(
                          expenseType: 'Fuel',
                          expenseCost: '₹1000',
                          expensePercentage: '15%',
                          expenseColor: MyColors.fuel,
                        ),
                        //Other Expense
                        DifferentExpensesWidget(
                          expenseType: 'Others',
                          expenseCost: '₹1600',
                          expensePercentage: '22%',
                          expenseColor: MyColors.others,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    super.key,
    required this.maintenanceCost,
    required this.labourCost,
    required this.fuelCost,
    required this.otherCost,
  });
  final double maintenanceCost;
  final double labourCost;
  final double fuelCost;
  final double otherCost;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: 150,
          child: PieChart(
            dataMap: {
              "Maintenance": maintenanceCost,
              "Labour Cost": labourCost,
              "Fuel": fuelCost,
              "Others": otherCost,
            },
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            colorList: [
              MyColors.maintenance,
              MyColors.labourCost,
              MyColors.fuel,
              MyColors.others,
            ],
            initialAngleInDegree: -80,
            chartType: ChartType.ring,
            ringStrokeWidth: 16,
            centerText: null,

            legendOptions: const LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: false,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: false,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
            // gradientList: ---To add gradient colors---
            // emptyColorGradient: ---Empty Color gradient---
          ),
        ),
        Positioned(
          top: 50,
          child: Container(
            height: 150,
            width: 150,
            child: Column(
              children: [
                Text(
                  '₹7,300',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Total Expenses',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class DifferentExpensesWidget extends StatelessWidget {
  const DifferentExpensesWidget(
      {super.key,
      required this.expenseType,
      required this.expenseCost,
      required this.expensePercentage,
      required this.expenseColor});
  final String expenseType;
  final String expenseCost;
  final String expensePercentage;
  final Color expenseColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: expenseColor,
          radius: 8,
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenseType,
              style: GoogleFonts.roboto(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              expenseCost,
              style: GoogleFonts.roboto(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
        Text(
          expensePercentage,
          style: GoogleFonts.roboto(
              textStyle:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
        ),
        SizedBox(width: 40),
      ],
    );
  }
}
