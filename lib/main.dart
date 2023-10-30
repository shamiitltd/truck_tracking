// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:provider/provider.dart';
import 'package:truck_tracking/config/routes/routes.dart';
import 'package:truck_tracking/provider/theme_provider.dart';
import 'package:truck_tracking/screens/Add_shipment/add_shipment.dart';
import 'package:truck_tracking/screens/Login_Page/login_page.dart';
import 'package:truck_tracking/screens/Login_Page/registration_page.dart';
import 'package:truck_tracking/screens/Reports/UI/reports_screen.dart';
import 'package:truck_tracking/screens/Settings/setting_page.dart';
import 'package:truck_tracking/screens/dashboard/dashboard.dart';
import 'package:truck_tracking/screens/Shipping/shippingpage.dart';

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
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider()..loadTheme(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.themeData,
            routes: {
              MyRoutes.dashboard:(context) => Dashboard(),
              MyRoutes.shipping: (context) =>  ShippingPage(),
              MyRoutes.reportscreen: (context) =>  Reports(),
              MyRoutes.addshipmentscreen: (context) =>  AddShipping(),
              MyRoutes.settingsscreen: (context) =>  SettingPage(),
              MyRoutes.loginscreen:(context)=>LoginPage(),
              MyRoutes.registrationscreen:(context)=>RegistrationPage()
            },
            home:  Dashboard(),
          );
        },
      ),
    );
  }
}