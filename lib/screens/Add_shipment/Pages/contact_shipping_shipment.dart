import 'package:flutter/material.dart';

class ContactShippingShipment extends StatelessWidget {
  const ContactShippingShipment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 600,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                "Contact Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  height: 45,
                  width: 220,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(179, 233, 233, 233)),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "First Name",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black.withOpacity(0.5),
                            size: 30,
                          ))),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  height: 45,
                  width: 220,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(179, 233, 233, 233)),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Last Name",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black.withOpacity(0.5),
                          ))),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(179, 233, 233, 233)),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.black.withOpacity(0.5),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(179, 233, 233, 233)),
                  child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Contact Number",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          prefixIcon: const Icon(Icons.phone))),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                "Shipment Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(179, 233, 233, 233)),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Ship From",
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.5)),
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(179, 233, 233, 233)),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Ship To",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(179, 233, 233, 233)),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Pickup",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                          prefixIcon: const Icon(Icons.location_on))),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(179, 233, 233, 233)),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Delivery Point",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: Colors.black.withOpacity(0.5),
                          ))),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                "Shipment Type",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(179, 233, 233, 233)),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                          prefixIcon: const Icon(Icons.abc),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                size: 30,
                              )))),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(179, 233, 233, 233)),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                          prefixIcon: const Icon(Icons.mail_sharp),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 30,
                              )))),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: 490,
                  height: 45,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 39, 106, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Add",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}