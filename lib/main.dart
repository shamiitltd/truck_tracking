import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:truck_tracking/screens/dashboard/dashboard.dart';
import 'package:truck_tracking/total_trips/Bar_Chart_model2.dart';
import 'package:truck_tracking/total_trips/datepicker.dart';



void main() async {
  try{
    final GoogleMapsFlutterPlatform mapsImplementation = GoogleMapsFlutterPlatform.instance;
    if (mapsImplementation is GoogleMapsFlutterAndroid) {
      mapsImplementation.useAndroidViewSurface = false;
      mapsImplementation.initializeWithRenderer(AndroidMapRenderer.latest);
    }
  }catch(e){};
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
    final Future<FirebaseApp> initializeApp = Firebase.initializeApp(
      options: const FirebaseOptions(
           apiKey: "AIzaSyDcBv34SwzPx3TL01GNvwfDr9AnJ1ctK7c",
  authDomain: "trackingsystem-c2ed5.firebaseapp.com",
  projectId: "trackingsystem-c2ed5",
  storageBucket: "trackingsystem-c2ed5.appspot.com",
  messagingSenderId: "592178889466",
  appId: "1:592178889466:web:3f5c929a439b150bb4ff43",
  measurementId: "G-DWG74L4RBF"
      )
  );
  final navigatorKey = GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimpleSeriesLegend.withSampleData(),
    );
  }
}

