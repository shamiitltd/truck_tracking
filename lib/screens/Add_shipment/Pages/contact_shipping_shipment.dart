import 'package:flutter/material.dart';

class ContactShippingShipment extends StatelessWidget {
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
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Contact Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  height: 45,
                  width: 220,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(179, 233, 233, 233)),
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
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  height: 45,
                  width: 220,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(179, 233, 233, 233)),
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
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(179, 233, 233, 233)),
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
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(179, 233, 233, 233)),
                  child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Contact Number",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          prefixIcon: Icon(Icons.phone))),
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Shipment Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(179, 233, 233, 233)),
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
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(179, 233, 233, 233)),
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
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(179, 233, 233, 233)),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Pickup",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                          prefixIcon: Icon(Icons.location_on))),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(179, 233, 233, 233)),
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
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Shipment Type",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(179, 233, 233, 233)),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                          prefixIcon: Icon(Icons.abc),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 30,
                              )))),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(179, 233, 233, 233)),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                          prefixIcon: Icon(Icons.mail_sharp),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 30,
                              )))),
                )
              ],
            ),
            SizedBox(
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
                      color: Color.fromRGBO(0, 39, 106, 1),
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