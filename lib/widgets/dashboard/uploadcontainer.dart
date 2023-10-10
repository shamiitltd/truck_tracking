import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:truck_tracking/widgets/dashboard/upload_firebase.dart';


class Uploadcontainer extends StatefulWidget {
  final String doc;
  const Uploadcontainer({super.key, required this.doc});

  @override
  State<Uploadcontainer> createState() => _UploadcontainerState();
}

class _UploadcontainerState extends State<Uploadcontainer> {
  String fileName = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          margin: const EdgeInsets.only(left: 20),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: fileName == ""
                      ? MaterialStateProperty.all(Colors.blue)
                      : MaterialStateProperty.all(
                          const Color.fromARGB(255, 33, 243, 194))),
              child: Text(widget.doc),
              onPressed: () async {
                String name = await Uploadfirebase(widget.doc);
                print("name : $name)");
                setState(() {
                  fileName = name;
                });
              }),
        ),
        Container(
          margin: const EdgeInsets.only(top: 3),
          child: Text(
            "$fileName ",
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }
}
