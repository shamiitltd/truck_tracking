import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(height: 20),
        Image.asset(
          "assets/images/logo.png",
        ),
        const SizedBox(height: 20),
        DrawerListTile(
          press: () {},
          title: 'Home',
          icn: const Icon(Icons.home_outlined),
        ),
        DrawerListTile(
          press: () {},
          title: 'Tracking',
          icn: const Icon(Icons.query_stats),
        ),
        DrawerListTile(
          press: () {},
          title: 'Scorecard',
          icn: const Icon(Icons.document_scanner_outlined),
        ),
        DrawerListTile(
          press: () {},
          title: 'Insights',
          icn: const Icon(Icons.bar_chart),
        ),
        DrawerListTile(
          press: () {},
          title: 'Messaging',
          icn: const Icon(Icons.chat_outlined),
        ),
        DrawerListTile(
          press: () {},
          title: 'Docs',
          icn: const Icon(Icons.insert_drive_file_outlined),
        ),
        DrawerListTile(
          press: () {},
          title: 'Journey Maker',
          icn: const Icon(Icons.route_outlined),
        ),
        DrawerListTile(
          press: () {},
          title: 'Vehicle Maintenence',
          icn: const Icon(Icons.handyman_outlined),
        ),
        DrawerListTile(
          press: () {},
          title: 'Fatigue',
          icn: const Icon(Icons.speed_sharp),
        ),
        DrawerListTile(
          press: () {},
          title: 'Report',
          icn: const Icon(Icons.content_paste_search),
        ),
        DrawerListTile(
          press: () {},
          title: 'Smart Jobs',
          icn: const Icon(Icons.smart_toy_outlined),
        ),
        DrawerListTile(
          press: () {},
          title: 'Settings',
          icn: const Icon(Icons.settings),
        )
      ]),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.press,
    required this.icn,
  }) : super(key: key);
  final String title;
  final Icon icn;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: icn,
      iconColor: Colors.white,
      title: Text(title),
    );
  }
}
