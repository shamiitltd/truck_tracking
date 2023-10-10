import 'package:flutter/material.dart';
import 'package:truck_tracking/config/Box%20decoration/boxDecoration.dart';
import 'package:truck_tracking/config/colors/colors.dart';

class TripReport {
  final String driverId;
  final String name;
  final DateTime tripDate;
  final double distance;
  final double fare;

  TripReport({
    required this.driverId,
    required this.name,
    required this.tripDate,
    required this.distance,
    required this.fare,
  });
}

class FilterOptionsWidget extends StatefulWidget {
  @override
  _FilterOptionsWidgetState createState() => _FilterOptionsWidgetState();
}

class _FilterOptionsWidgetState extends State<FilterOptionsWidget> {
  String? selectedFilter;
  bool anyDateSelected = false;
  TextEditingController sortingInputController = TextEditingController();
  DateTime? pickedDate;
  List<TripReport> tripReports = [
    TripReport(driverId: '1', name: 'John', tripDate: DateTime(2023, 10, 1), distance: 1020, fare: 550),
    TripReport(driverId: '2', name: 'Alice', tripDate: DateTime(2023, 12, 2), distance: 1530, fare: 560),
    TripReport(driverId: '3', name: 'Doe', tripDate: DateTime(2023, 11, 1), distance: 1002, fare: 650),
    TripReport(driverId: '4', name: 'Mandy', tripDate: DateTime(2023, 09, 2), distance: 1250, fare: 360),
    TripReport(driverId: '5', name: 'Candy', tripDate: DateTime(2023, 08, 1), distance: 1200, fare: 850),
    TripReport(driverId: '6', name: 'Linda', tripDate: DateTime(2023, 05, 2), distance: 1500, fare: 960),
  ];

  List<TripReport> filteredReports = [];

  @override
  void dispose() {
    sortingInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Sort By dropdown
        Container(
          width: 150,
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [boxDecor.shadow],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Icon(Icons.sort),
                SizedBox(width: 30,),
                DropdownButton<String>(
                  hint: Text("Sort By"),
                  value: selectedFilter, // Current selected filter
                  items: <String>[
                    'Driver id',
                    'Name',
                    'Distance',
                    'Fare',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFilter = newValue;
                      sortingInputController.clear();
                    });
                    filterAndSortReports();
                  },
                  underline: Container(),
                ),
              ],
            ),
          ),
        ),
        // Input field for sorting
        if (selectedFilter != null)
          TextField(
            controller: sortingInputController,
            decoration: InputDecoration(labelText: 'Sort by ${selectedFilter!}'),
            onChanged: (_) {
              filterAndSortReports();
            },
          ),
        SizedBox(height: 20),
        // Any Date dropdown
        Container(
          width: 150,
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [boxDecor.shadow],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Icon(Icons.date_range),
                SizedBox(width: 30),
                DropdownButton<String>(
                  hint: Text("Any Date"),
                  value: anyDateSelected ? 'Any Date' : null,
                  items: <String>[
                    'Any Date',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue == 'Any Date') {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      ).then((date) {
                        if (date != null) {
                          setState(() {
                            pickedDate = date;
                            anyDateSelected = true;
                          });
                          filterAndSortReports();
                        }
                      });
                    } else {
                      setState(() {
                        anyDateSelected = true;
                        sortingInputController.clear();
                      });
                      filterAndSortReports();
                    }
                  },
                  underline: Container(),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredReports.length,
            itemBuilder: (context, index) {
              final report = filteredReports[index];
              return ListTile(
                title: Text('Driver ID: ${report.driverId}'),
                subtitle: Text('Name: ${report.name}\nDate: ${report.tripDate}\nDistance: ${report.distance}\nFare: ${report.fare}'),
              );
            },
          ),
        ),
      ],
    );
  }

  void filterAndSortReports() {
    List<TripReport> filteredList = List.from(tripReports);

    if (selectedFilter == 'Driver id') {
      filteredList = filteredList.where((report) => report.driverId.contains(sortingInputController.text)).toList();
    } else if (selectedFilter == 'Name') {
      filteredList = filteredList.where((report) => report.name.toLowerCase().contains(sortingInputController.text.toLowerCase())).toList();
    } else if (selectedFilter == 'Distance') {
      filteredList = filteredList.where((report) => report.distance >= double.parse(sortingInputController.text)).toList();
    } else if (selectedFilter == 'Fare') {
      filteredList = filteredList.where((report) => report.fare >= double.parse(sortingInputController.text)).toList();
    }

    if (anyDateSelected && pickedDate != null) {
      filteredList = filteredList.where((report) {
        return report.tripDate.year == pickedDate!.year &&
            report.tripDate.month == pickedDate!.month &&
            report.tripDate.day == pickedDate!.day;
      }).toList();
    }

    if (sortingInputController.text.isNotEmpty) {
      if (selectedFilter == 'Driver id') {
        filteredList.sort((a, b) => a.driverId.compareTo(b.driverId));
      } else if (selectedFilter == 'Name') {
        filteredList.sort((a, b) => a.name.compareTo(b.name));
      } else if (selectedFilter == 'Distance') {
        filteredList.sort((a, b) => a.distance.compareTo(b.distance));
      } else if (selectedFilter == 'Fare') {
        filteredList.sort((a, b) => a.fare.compareTo(b.fare));
      }
    } else {
      filteredList.sort((a, b) => a.tripDate.compareTo(b.tripDate));
    }
    setState(() {
      filteredReports = filteredList;
    });
  }
}

/*
void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold(body: FilterOptionsWidget(),),));
}*/
