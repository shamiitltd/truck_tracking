import 'package:flutter/material.dart';

class Appbarduration extends StatelessWidget {
  const Appbarduration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Long trips",
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.01),
            ),
          ),
          const Expanded(child: Text("")),
          Container(
            width: MediaQuery.of(context).size.width * 0.07,
            height: MediaQuery.of(context).size.height * 0.055,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.black,
                        size: MediaQuery.of(context).size.width * 0.013,
                      ),
                      Icon(Icons.keyboard_arrow_down_rounded,
                          size: MediaQuery.of(context).size.width * 0.013,
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
