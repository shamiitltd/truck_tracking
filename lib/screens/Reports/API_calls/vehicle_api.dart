import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:truck_tracking/screens/Reports/API_calls/driver_list_api_call.dart';

class VehiclesApi extends StatefulWidget {
  const VehiclesApi({Key? key}) : super(key: key);

  @override
  _VehiclesApiState createState() => _VehiclesApiState();
}

class _VehiclesApiState extends State<VehiclesApi> {

  var data ;
  Future<void> getUserApi ()async{
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/Arnabiem/Truck_tracking-_system_json_files/main/vehicles.json'));

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
                  return const Center(child: CircularProgressIndicator());
                }else {
                  return data.length==null?const Center(child: CircularProgressIndicator())
                  :ListView.builder(
                    itemCount: data.length,
                      itemBuilder: (context, index){
                    return Card(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ReusbaleRow( v1: data[index]['driver_id'].toString(),
                            v2: data[index]['driver_name'].toString(),
                            v3: data[index]['vehicle_make'].toString(),
                            v4:data[index]['vehicle_model'].toString() ,
                            v5:data[index]['cargo_capacity_kg'].toString()),                           
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