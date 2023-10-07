import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/TextStyles/TextStyle.dart';
import '../../config/colors/colors.dart';

import '../VehicleMaintanceTitleDataWidget.dart';
import 'AdnocModel.dart';

class AdnocEventFleet extends StatefulWidget {
  const AdnocEventFleet({super.key});

  @override
  State<AdnocEventFleet> createState() => _AdnocEventFleet();
}

class _AdnocEventFleet extends State<AdnocEventFleet> {
  late Adnoc data;
  bool isloading = false;
  @override
  void initState() {
    readLocalJson();
    super.initState();
  }

  readLocalJson() async {
    isloading = true;
    var d = await rootBundle.loadString("assets/json/ADNOCEvent.json");
    data = adnocFromJson(d.toString());
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            height: MediaQuery.sizeOf(context).height * 1.0 / 1.77,
            width: MediaQuery.sizeOf(context).width * 0.2 / 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey)),
            child: ListView.custom(
                childrenDelegate: SliverChildListDelegate(
              [
                _building(data.adnocevents.toString()),
                TitleDataWidget(
                  Title: 'Over speed above 140km',
                  Data: data.overspeedabove140km.toString(),
                  Boxcolor: AppColors.blueGrey,
                  BorderRadius: null,
                  TheIcon: Icons.speed_outlined,
                ),
                TitleDataWidget(
                  Title: 'Over speed above 120km',
                  Data: data.overspeedabove120km.toString(),
                  Boxcolor: null,
                  BorderRadius: null,
                  TheIcon: Icons.speed,
                ),
                TitleDataWidget(
                  Title: 'Night driving',
                  Data: data.nightdriving.toString(),
                  Boxcolor: AppColors.blueGrey,
                  BorderRadius: null,
                  TheIcon: Icons.nightlight,
                ),
                TitleDataWidget(
                  Title: 'Desert Over Speed',
                  Data: data.desertoverspeed.toString(),
                  Boxcolor: null,
                  BorderRadius: null,
                  TheIcon: Icons.sunny,
                ),
                TitleDataWidget(
                  Title: 'Seat belt violation',
                  Data: data.seatbeltviolation.toString(),
                  Boxcolor: AppColors.blueGrey,
                  BorderRadius: null,
                  TheIcon: Icons.car_repair_sharp,
                ),
                TitleDataWidget(
                  Title: 'Internal road over speed',
                  Data: data.internalroadoverspeed.toString(),
                  Boxcolor: null,
                  BorderRadius: null,
                  TheIcon: Icons.car_repair_sharp,
                ),
                TitleDataWidget(
                  Title: 'Black top over speed',
                  Data: data.blacktopoverspeed.toString(),
                  Boxcolor: AppColors.blueGrey,
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
                "ADNOC events",
                style: title6(),
              ),
            ],
          ),
          Text(
            Data.toString(),
            style: title5(),
          )
        ],
      ));
}
