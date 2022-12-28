// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/catogery/add_address_screen.dart';
import 'package:new_mobile_application/catogery/place_order_screen.dart';
import 'package:new_mobile_application/colors.dart';


class AddressEditBottomSheet extends StatefulWidget {
  const AddressEditBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddressEditBottomSheet> createState() => _AddressEditBottomSheetState();
}

class _AddressEditBottomSheetState extends State<AddressEditBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 350,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Row(
                children: [
                  const Text(
                    "Select Address",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 160,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(MdiIcons.closeCircleOutline))
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      color: firstColor,
                      indent: 7,
                      endIndent: 7,
                      thickness: 1,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "+  Add Address",
                        style: TextStyle(
                            color: firstColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      color: firstColor,
                      indent: 7,
                      endIndent: 7,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: const [
                          Icon(MdiIcons.mapMarker),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Saved Address"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 15),
                      child: Container(
                          height: 110,
                          width: 330,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(0.2, 3),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PlaceOrderScreen()));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(
                                        "Home",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    //  Text("(Default Address)"),
                                      SizedBox(
                                        width: 120,
                                      ),
                                      Icon(Icons.edit)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      "38/1, 4th Avenue, Ashok nagar, Chennai \n- 600083 Near Sarvamanagala wes....")
                                ],
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 15),
                      child: Container(
                          height: 110,
                          width: 330,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(0.2, 3),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      "Office",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("(Default Address)"),
                                    SizedBox(
                                      width: 120,
                                    ),
                                    Icon(Icons.edit)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "38/1, 4th Avenue, Ashok nagar, Chennai \n- 600083 Near Sarvamanagala wes....")
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 15),
                      child: Container(
                          height: 110,
                          width: 330,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(0.2, 3),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      "Home",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("(Default Address)"),
                                    SizedBox(
                                      width: 120,
                                    ),
                                    Icon(Icons.edit)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "38/1, 4th Avenue, Ashok nagar, Chennai \n- 600083 Near Sarvamanagala wes....")
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 15),
                      child: Container(
                          height: 110,
                          width: 330,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(0.2, 3),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      "Home",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("(Default Address)"),
                                    SizedBox(
                                      width: 120,
                                    ),
                                    Icon(Icons.edit)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "38/1, 4th Avenue, Ashok nagar, Chennai \n- 600083 Near Sarvamanagala wes....")
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 15),
                      child: Container(
                          height: 110,
                          width: 330,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(0.2, 3),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      "Home",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("(Default Address)"),
                                    SizedBox(
                                      width: 120,
                                    ),
                                    Icon(Icons.edit)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "38/1, 4th Avenue, Ashok nagar, Chennai \n- 600083 Near Sarvamanagala wes....")
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
