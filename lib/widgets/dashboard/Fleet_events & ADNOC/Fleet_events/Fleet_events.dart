import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:truck_tracking/config/colors/colors.dart';
import 'package:truck_tracking/config/fonts/textstyle_subhagya.dart';
import 'package:truck_tracking/widgets/dashboard/Fleet_events%20&%20ADNOC/Fleet_events/Usermodel3.dart';
import 'package:truck_tracking/widgets/dashboard/Fleet_events%20&%20ADNOC/Vehicle_Maintenece_Title_Data.dart';



class FleetEvent extends StatefulWidget {
  const FleetEvent({super.key});

  @override
  State<FleetEvent> createState() => _FleetEvent();
}

class _FleetEvent extends State<FleetEvent> {
  late User data;
  bool isloading = false;
  @override
  void initState() {
    readLocalJson();
    super.initState();
  }

  readLocalJson() async {
    isloading = true;
    var d = await rootBundle.loadString("assets/dashboard/adnoc&fleetevents/fleet_event.json");
    data = userFromJson(d.toString());
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            height: MediaQuery.sizeOf(context).height * 0.7 / 1.647,
            width: MediaQuery.sizeOf(context).width * 0.2 / 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey)),
            child: ListView.custom(
                childrenDelegate: SliverChildListDelegate(
              [
                _building(data.fleet.toString()),
                TitleDataWidget(
                  Title: 'Harsh breaking',
                  Data: data.harshbreaking.toString(),
                  Boxcolor: AppColors.lightblue,
                  BorderRadius: null,
                  TheIcon: Icons.car_repair_sharp,
                ),
                TitleDataWidget(
                  Title: 'Excessive idling',
                  Data: data.excessiveidling.toString(),
                  Boxcolor: null,
                  BorderRadius: null,
                  TheIcon: Icons.car_repair_sharp,
                ),
                TitleDataWidget(
                  Title: 'Harsh acceleration',
                  Data: data.harshacceleration.toString(),
                  Boxcolor: AppColors.lightblue,
                  BorderRadius: null,
                  TheIcon: Icons.car_repair_sharp,
                ),
                TitleDataWidget(
                  Title: 'Towing',
                  Data: data.towing.toString(),
                  Boxcolor: null,
                  BorderRadius: null,
                  TheIcon: Icons.car_repair_sharp,
                ),
                TitleDataWidget(
                  Title: 'Battery tamper',
                  Data: data.batterytamper.toString(),
                  Boxcolor: AppColors.lightblue,
                  BorderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  TheIcon: Icons.battery_std,
                )
              ],
            )),
          );
  }
}

Widget _building(Data) {
  return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Text(
                "FLEET events",
                style: title6(),
              ),
            ],
          ),
          Text(Data.toString(), style: title5())
        ],
      ));
}