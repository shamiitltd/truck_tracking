import 'package:flutter/material.dart';

class Appbarduration extends StatelessWidget {
  const Appbarduration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 30, top: 30),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Text("Duration of Trips"),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: const Text("Download Report"),
          ),
          const Icon(Icons.download_rounded, color: Colors.black),
          const Expanded(child: Text("")),
          Container(
            width: 165,
            margin: const EdgeInsets.only(right: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: const Color.fromARGB(255, 219, 219, 219)),
                onPressed: () {
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now());
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.black,
                      ),
                      Text(
                        "Any Date",
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(Icons.keyboard_arrow_down_rounded,
                          color: Colors.black)
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
