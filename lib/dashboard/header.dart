import 'package:final_dashboard/constants/contants.dart';
import 'package:final_dashboard/controller/MenuAppController.dart';
import 'package:final_dashboard/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: component_color,
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
                onPressed: context.read<MenuAppController>().controlMenu,
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
          const SizedBox(width: 25),
          const Text(
            "Home",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
            color: Colors.black,
            iconSize: 30,
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_outline_rounded),
            color: Colors.black,
            iconSize: 30,
          ),
          const SizedBox(width: 25)
        ],
      ),
    );
  }
}
