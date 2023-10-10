
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fl_chart/fl_chart.dart';
import 'package:truck_tracking/config/colors/colors.dart';







class LineChartPage extends StatefulWidget {
  const LineChartPage({super.key});

  @override
  _LineChartPageState createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {
  Future<List<Map<String, dynamic>>> loadDataFromJson() async {
    final jsonString = await rootBundle.loadString('assets/data.json');
    final jsonData = json.decode(jsonString);
    return List<Map<String, dynamic>>.from(jsonData);
  }

  // Define variables to keep track of the selected state
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          // Add a Container to create additional space between rows
          Container(
            height: 20, // Adjust the height to control the space
          ),

          // First Row: Toggle Button with increased spacing
          Padding(
            padding: const EdgeInsets.only(top: 20), // Adjust the top padding as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  isSelected: isSelected,
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                        if (buttonIndex == index) {
                          isSelected[buttonIndex] = true;
                        } else {
                          isSelected[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  color: AppColors.grey, // Background color when unselected
                  selectedColor: AppColors.graphColor3, // Background color when selected
                  fillColor: AppColors.grey, // Fill color when unselected
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                  focusColor: AppColors.grey, // Focus color
                  borderColor: AppColors.grey,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Show Stat',
                        style: TextStyle(
                          fontSize: 16,
                          color: isSelected[0] ? AppColors.primaryWhite : AppColors.black, // Text color when selected
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Show Graph',
                        style: TextStyle(
                          fontSize: 16,
                          color: isSelected[1] ? AppColors.primaryWhite : AppColors.black, // Text color when selected
                        ),
                      ),
                    ),
                  ], // Border color
                ),
              ],
            ),
          ),

          // Second Row: Container with Excessive Idling title and Dropdown Calendar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Excessive Idling',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now(),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey, // Gray background color
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.calendar_today, // Calendar icon
                          color: AppColors.primaryWhite, // Icon color
                        ),
                        SizedBox(width: 8), // Add some space between icon and text
                        Text(
                          'Any Date',
                          style: TextStyle(
                            color:AppColors.primaryWhite, // Text color
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.primaryWhite, // Arrow color
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Third Row: Line Chart
          // Third Row: Line Chart
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Add padding here
              child: SizedBox(
                width: double.infinity,
                height: 300, // Adjust the height as needed
                child: FutureBuilder(
                  future: loadDataFromJson(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final data = snapshot.data as List<Map<String, dynamic>>;

                      // Calculate a suitable maximum value with some extra margin
                      double maxDataValue = data
                          .map((entry) => entry['value'].toDouble())
                          .reduce((max, value) => value > max ? value : max);
                      double maxY = maxDataValue + 10; // Add some extra margin

                      // Add some padding by adjusting minX and maxX values
                      double minX = -0.5; // Add padding on the left side
                      double maxX = data.length.toDouble() - 0.5; // Add padding on the right side

                      return SizedBox(
                        width: double.infinity,
                        height: 300, // Adjust the height as needed
                        child: LineChart(
                          LineChartData(
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(
                              bottomTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 30,
                                getTextStyles: (context, value) => const TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                                // Manually specify x-axis labels based on your data
                                getTitles: (value) {
                                  if (value >= 0 && value < data.length) {
                                    final index = value.toInt();
                                    final dateStr = data[index]['date'];
                                    final date = DateTime.parse(dateStr);
                                    return '${date.day}-${date.month}-${date.year}';
                                  }
                                  return '';
                                },
                                interval: 1, // Set this to 1 to display all labels
                              ),
                              leftTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (context, value) => const TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                                // Customize the labels on the left y-axis here
                                getTitles: (value) {
                                  return value.toStringAsFixed(0);
                                },
                              ),
                              rightTitles: SideTitles(
                                showTitles: false, // Hide labels on the right y-axis
                              ),
                              topTitles: SideTitles(
                                showTitles: false, // Hide labels on the top x-axis
                              ),
                            ),
                            minX: minX,
                            maxX: maxX,
                            minY: 0,
                            maxY: maxY, // Set the calculated maximum value
                            lineBarsData: [
                              LineChartBarData(
                                spots: data.asMap().entries.map((entry) {
                                  final index = entry.key.toDouble();
                                  final value = entry.value['value'].toDouble();
                                  return FlSpot(index, value);
                                }).toList(),
                                isCurved: false, // Disable curve for straight lines
                                colors: [AppColors.graphColor3],
                                dotData: FlDotData(
                                  show: true, // Show dots
                                  //  dotSize: 6.0, // Adjust dot size as needed
                                  //  dotColor: Colors.blue, // Dot color
                                ),
                                belowBarData: BarAreaData(show: false),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ),

          // Fourth Row: Excessive Idling Bullet
          Padding(
            padding: const EdgeInsets.only(bottom: 8), // Adjust the bottom padding as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: AppColors.graphColor3, // Bullet color
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8), // Add some space between bullet and text
                const Text('Excessive Idling'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
