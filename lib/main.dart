import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:truck_tracking/config/routes/routes.dart';
import 'package:truck_tracking/screens/Add_shipment/add_shipment.dart';
import 'package:truck_tracking/screens/Reports/UI/reports_screen.dart';
import 'package:truck_tracking/screens/dashboard/dashboard.dart';

import 'package:truck_tracking/widgets/dashboard/graph_widget.dart';
import 'package:truck_tracking/screens/Shipping/shippingpage.dart';


void main() async {
  try{
    final GoogleMapsFlutterPlatform mapsImplementation = GoogleMapsFlutterPlatform.instance;
    if (mapsImplementation is GoogleMapsFlutterAndroid) {
      mapsImplementation.useAndroidViewSurface = false;
      mapsImplementation.initializeWithRenderer(AndroidMapRenderer.latest);
    }
  }catch(e){}
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
    final Future<FirebaseApp> initializeApp = Firebase.initializeApp(
      options: const FirebaseOptions(
       apiKey: "AIzaSyB4feUvcioNMKRhgjFCMGPcDQuVIeq48T0",
    authDomain: "newconnection-fe695.firebaseapp.com",
    projectId: "newconnection-fe695",
    storageBucket: "newconnection-fe695.appspot.com",
    messagingSenderId: "123468366333",
    appId: "1:123468366333:web:788f80b3bd43ba4ae2d994",
    measurementId: "G-F13P9Q2S7X"
      )
  );
  
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.dashboard:(context) => const Dashboard(),
        MyRoutes.shipping: (context) =>  const ShippingPage(),
        MyRoutes.reportscreen: (context) =>  const Reports(),
        MyRoutes.addshipmentscreen: (context) =>  const AddShipping(),
        MyRoutes.graphwidgets:(context) =>  const LineChartPage(),
        //ek mera route
      },
      home:  const Dashboard(),
    );
  }
}
