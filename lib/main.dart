import 'package:final_dashboard/controller/MenuAppController.dart';
import 'package:final_dashboard/screens/fatigue_screen.dart';
import 'package:final_dashboard/screens/main_screen.dart';
import 'package:final_dashboard/screens/tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'constants/contants.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        canvasColor: secondaryColor,
      ),
      routes: {
        MyRoutes.homeRoute: (context) => const MainScreen(),
        MyRoutes.trackingRoute: (context) => const TrackingScreen(),
        MyRoutes.fatigueRoute: (context) => const FatigueScreen(),
        },
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MenuAppController())
        ],
        child: const MainScreen(),
      ),
    );
  }
}


class MyRoutes {
  static String homeRoute = "/home";
  static String trackingRoute = "/tracking";
  static String scorecardRoute = "/scorecard";
  static String insightsRoute = "/insights";
  static String messsagingRoute = "/messaging";
  static String docsRoute = "/docs";
  static String journeyRoute = "/journey";
  static String maintenenceRoute = "/maintenence";
  static String fatigueRoute = "/fatigue";
  static String reportRoute = "/report";
  static String smartjobsRoute ="/smartjobs";
}
