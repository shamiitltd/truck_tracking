// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:truck_tracking/screens/Reports/API_calls/driver_list_api_call.dart';

class PerformanceApi extends StatefulWidget {
  const PerformanceApi({Key? key}) : super(key: key);

  @override
  _PerformanceApiState createState() => _PerformanceApiState();
}

class _PerformanceApiState extends State<PerformanceApi> {

  var data ;
  Future<void> getUserApi ()async{
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/Arnabiem/Truck_tracking-_system_json_files/main/performance.json'));

    if(response.statusCode == 200){
      data = jsonDecode(response.body.toString());
    }else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi (),
              builder: (context , snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }else {
                  return data.length==null?Center(child: CircularProgressIndicator())
                  :ListView.builder(
                    itemCount: data.length,
                      itemBuilder: (context, index){
                    return Card(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ReusbaleRow( v1: data[index]['driver_id'].toString(),
                            v2: data[index]['name'].toString(),
                            v3: data[index]['total_trips'].toString(),
                            v4:data[index]['completed_trips'].toString() ,
                            v5:data[index]['average_rating'].toString()),                           
                          ],
                        ),
                      ),
                    );
                  });
                }

              },
            ),
          )
        ],
      ),
    );
  }
}