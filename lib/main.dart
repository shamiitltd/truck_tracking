import 'package:flutter/material.dart';
import 'package:truck_tracking/Pages/AddShipment/add_shipment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Widgets/FleetEvent/FleetEvent.dart';
import 'Widgets/adnoc/adnocfleetevent.dart';
import 'firebase_options.dart';
import 'Pages/AlocateDrive/AlocateDrive.dart';
import 'Pages/AlocateDrive/VehicleMaintance.dart';
import 'Pages/Help_setting/setting_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SettingPage());
  }
}
