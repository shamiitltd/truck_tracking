// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Driver {
  final int id;
  final String name;
  final int age;
  final String licenseNumber;
  final String phone;

  Driver({
    required  this.id,
    required  this.name,
    required  this.age,
    required  this.licenseNumber,
    required  this.phone,
});

  // factory Driver.fromJson(Map<String, dynamic> json) {
  //   return Driver(
  //     id: json['id'],
  //     name: json['name'],
  //     age: json['age'],
  //     licenseNumber: json['license_number'],
  //     phone: json['phone'],
  //   );
  // }
}

class DriverList extends StatefulWidget {
  const DriverList({Key? key}) : super(key: key);

  @override
  _DriverListState createState() => _DriverListState();
}

class _DriverListState extends State<DriverList> {
  List<Driver> drivers = [];

  @override
  void initState() {
    super.initState();
    loadDriversList();
  }

  Future<void> loadDriversList() async {    
     String jsonContent = await rootBundle.loadString('assets/reportsdata/drivers_list.json');
    List<dynamic> driverList = json.decode(jsonContent)['drivers'];
    // drivers = driverList.map((driverData) => Driver(
    //       driverData['id'],
    //       driverData['name'],
    //       driverData['age'],
    //       driverData['licenseNumber'],
    //       driverData['phone'],
    //     )).toList();    
    setState(() {
      drivers = driverList.map((json) {
        return Driver(
          id:json['id'],
          name:json['name'],
          age:json['age'],
          licenseNumber:json['licenseNumber'],
          phone:json['phone'],
        );
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
      return Container(
      width: 100,
      height: 100,
        child: FutureBuilder(
          future: loadDriversList(),
          builder: (context,snapshot){
            return ListView.builder(
            itemCount: drivers.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    DriverRow(driver: drivers[index]),
                  ],
                ),
              );
            },
          );
        }),
      );
  }
}

class DriverRow extends StatelessWidget {
  final Driver driver;

  const DriverRow({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(driver.id.toString()),
          Text(driver.name.toString()),
          Text(driver.age.toString()),
          Text(driver.licenseNumber.toString()),
          Text(driver.phone.toString()),      
        ],        
      ),
    );
  }
}