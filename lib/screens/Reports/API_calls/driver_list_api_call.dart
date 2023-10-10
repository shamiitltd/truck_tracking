import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DriverListApi extends StatefulWidget {
  const DriverListApi({Key? key}) : super(key: key);

  @override
  _DriverListApiState createState() => _DriverListApiState();
}

class _DriverListApiState extends State<DriverListApi> {

  var data ;
  Future<void> getUserApi ()async{
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/Arnabiem/Truck_tracking-_system_json_files/main/drivers_list.json'));

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
                            ReusbaleRow( v1: data[index]['id'].toString(),
                            v2: data[index]['name'].toString(),
                            v3: data[index]['age'].toString(),
                            v4:data[index]['license_number'].toString() ,
                            v5:data[index]['phone'].toString()),                           
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

// ignore: must_be_immutable
class ReusbaleRow extends StatelessWidget {
  String  v1,v2,v3,v4,v5 ;
  ReusbaleRow({Key? key , required this.v1,required this.v2,
  required this.v3,required this.v4,required this.v5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [          
          Text(v1),
          Text(v2),
          Text(v3),
          Text(v4),
          Text(v5),
        ],
      ),
    );
  }
}