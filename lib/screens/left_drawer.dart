import 'package:final_dashboard/main.dart';
import 'package:flutter/material.dart';

const defaultPadding = 16.0;
const secondaryColor = Color.fromARGB(2555, 28, 29, 33);

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({Key? key}) : super(key: key);

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}
class _LeftDrawerState extends State<LeftDrawer> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF2D3D64),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 80,
            child: DrawerHeader(
              padding: EdgeInsets.only(left: defaultPadding * 1.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.merge,
                        color: Colors.white,
                        size: 36,
                      ),
                      Text(
                        'Route',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Roboto Flex',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Expanded(
            child: ListView(
              children: [
                DashboardListTile(
                  title: "Home",
                  icon: const Icon(Icons.home),
                  press: () {},
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                DashboardListTile(
                  title: "Tracking",
                  icon: const Icon(Icons.query_stats),
                  press: () {
                    Navigator.pushNamed(context, MyRoutes.trackingRoute);
                  },
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                DashboardListTile(
                  title: "Scoreboard",
                  icon: const Icon(Icons.document_scanner_outlined),
                  press: () {},
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                DashboardListTile(
                  title: "Insights",
                  icon: const Icon(Icons.bar_chart),
                  press: () {},
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                DashboardListTile(
                  title: "Messaging",
                  icon: const Icon(Icons.chat_outlined),
                  press: () {},
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                DashboardListTile(
                  title: "Docs",
                  icon: const Icon(Icons.contact_page_sharp),
                  press: () {},
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                DashboardListTile(
                  title: "Journey Maker",
                  icon: const Icon(Icons.route_outlined),
                  press: () {},
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                DashboardListTile(
                  title: "Vehicle Maintainance",
                  icon: const Icon(Icons.handyman_outlined),
                  press: () {},
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                DashboardListTile(
                  title: "Fatigue",
                  icon: const Icon(Icons.speed),
                  press: () {Navigator.pushNamed(context, MyRoutes.fatigueRoute);},
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                DashboardListTile(
                  title: "Reports",
                  icon: const Icon(Icons.find_in_page),
                  press: () {},
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                DashboardListTile(
                  title: "Smart Jobs",
                  icon: const Icon(Icons.drive_folder_upload_rounded),
                  press: () {},
                ),
                const SizedBox(height: 100),
                DashboardListTile(
                  title: "Settings",
                  icon: const Icon(Icons.settings),
                  press: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardListTile extends StatelessWidget {
  const DashboardListTile(
      {super.key, required this.title, required this.icon, required this.press});
  final String title;
  final Icon icon;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: Colors.white,
      textColor: Colors.white,
      visualDensity:const VisualDensity(vertical: -4),
      dense: true,
      onTap: press,
      leading: Icon(icon.icon),
      title: Text(title),
      );
    }
}