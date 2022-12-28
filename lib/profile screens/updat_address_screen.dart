// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, prefer_const_constructors, depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_mobile_application/catogery/place_order_screen.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/controller/address_controler.dart';
import 'package:new_mobile_application/map_screen.dart';
import 'package:new_mobile_application/profile%20screens/profile_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:page_transition/page_transition.dart';

class General {
  String label;
  Color color;
  bool isSelected;
  General(this.label, this.color, this.isSelected);
}

class UpdateAddressScreen extends StatefulWidget {
  final String? addreline, landmark, city, country, state, pincode;
  const UpdateAddressScreen(
      {Key? key,
      this.addreline,
      this.landmark,
      this.city,
      this.country,
      this.state,
      this.pincode})
      : super(key: key);

  @override
  State<UpdateAddressScreen> createState() => _UpdateAddressScreenState();
}

class _UpdateAddressScreenState extends State<UpdateAddressScreen> {
  TextEditingController addressLine = TextEditingController();
  TextEditingController landMark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController pincode = TextEditingController();

  List<General> chipsList = [
    General("Home", Colors.white, false),
    General("Office", Colors.white, false),
    General("Work", Colors.white, false),
    General("Other", Colors.white, false),
  ];
  bool status = false;

  @override
  void initState() {
    addressLine = TextEditingController(text: widget.addreline.toString());
    landMark = TextEditingController(text: widget.landmark.toString());
    city = TextEditingController(text: widget.city.toString());
    state = TextEditingController(text: widget.state.toString());
    country = TextEditingController(text: widget.country.toString());
    pincode = TextEditingController(text: widget.pincode.toString());
    super.initState();
  }

  late final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: thirdColor,
          elevation: 1,
          title: Text(
            "Update Address ",
            style: TextStyle(color: firstColor),
          ),
          automaticallyImplyLeading: true,
          foregroundColor: firstColor,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 300),
                      type: PageTransitionType.rightToLeft,
                      child: ProfileScreen(),
                    ),
                  );
                },
                icon: Icon(
                  MdiIcons.emoticonOutline,
                  color: firstColor,
                )),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset("assets/images/mapss.png"),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: Duration(milliseconds: 300),
                            type: PageTransitionType.rightToLeft,
                            child: MapScreen(
                              category: "",
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 105, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: firstColor),
                      child: const Text("Pick from Map")),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  indent: 7,
                  endIndent: 7,
                  thickness: 1,
                  color: firstColor,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Add Details",
                    style:
                        TextStyle(fontSize: 16, fontFamily: 'Inter-SemiBold'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10),
                  child: Text(
                    "Complete Address",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Container(
                    height: 50,
                    width: 340,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(
                              0.2, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: addressLine,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Floor,building name,street,area",
                          hintStyle: TextStyle(color: Colors.grey.shade300)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10),
                  child: Text(
                    "Landmark (optional)",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Container(
                    height: 50,
                    width: 340,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(
                              0.2, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: landMark,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Near by gas station",
                          hintStyle: TextStyle(color: Colors.grey.shade300)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10),
                  child: Text(
                    "Contact Number",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Container(
                    height: 50,
                    width: 340,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(
                              0.2, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: city,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "enter your mobile number",
                          hintStyle: TextStyle(color: Colors.grey.shade300)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10),
                  child: Text(
                    "Save As*",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: techChips(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10),
                  child: Row(
                    children: [
                      Text(
                        "Set as default Address",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      FlutterSwitch(
                        activeColor: firstColor,
                        inactiveColor: Colors.grey.shade500,
                        toggleColor: Colors.white,
                        width: 55,
                        height: 30,
                        value: status,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        AddressListController().addAddress(
                            addressLine: addressLine.text,
                            landMark: landMark.text,
                            city: city.text);
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: Duration(milliseconds: 300),
                            type: PageTransitionType.topToBottom,
                            child: PlaceOrderScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 105, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: firstColor),
                      child: const Text("Update")),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ));
  }

  Widget techChips() {
    List<Widget> chips = [];
    for (int i = 0; i < chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 3, right: 3),
        child: FilterChip(
          shape: StadiumBorder(
              side: chipsList[i].isSelected == true
                  ? BorderSide(color: Colors.grey, style: BorderStyle.solid)
                  : BorderSide.none),
          disabledColor: Colors.white,
          // avatar: ,
          avatarBorder: CircleBorder(side: BorderSide.none),
          showCheckmark: false,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          // elevation: 0,
          label: Container(
            // height: 30,
            // width: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(chipsList[i].label),
            ),
          ),
          labelStyle: const TextStyle(color: Colors.black, fontSize: 12),
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          selectedColor: firstColor.withOpacity(0.1),
          selected: chipsList[i].isSelected,
          //   shape: const StadiumBorder(side: BorderSide(),),

          onSelected: (bool value) {
            setState(() {
              chipsList[i].isSelected = value;
              //     print(_chipsList[i].label);
              //    print(_chipsList[i].isSelected);
            });
          },
        ),
      );
      chips.add(item);
    }
    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }
}
