// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, prefer_const_constructors, depend_on_referenced_packages

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

class AddAddressScreen extends StatefulWidget {
  final String? add, latpass, lngpass;
  const AddAddressScreen({Key? key, this.add, this.latpass, this.lngpass})
      : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final formkey = GlobalKey<FormState>();
  TextEditingController addressLine = TextEditingController();
  TextEditingController landMark = TextEditingController();
  TextEditingController latpass = TextEditingController();
  TextEditingController lngpass = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController contactperson = TextEditingController();
  TextEditingController contactnumber = TextEditingController();

  void initState() {
    addressLine = TextEditingController(
        text: widget.add.toString() == "null" ? "" : widget.add.toString());
    latpass = TextEditingController(text: widget.latpass.toString());
    lngpass = TextEditingController(text: widget.lngpass.toString());
    super.initState();
  }

  List<General> chipsList = [
    General("Home", Colors.white, false),
    General("Office", Colors.white, false),
    General("Work", Colors.white, false),
    General("Other", Colors.white, false),
  ];
  bool status = false;
  String selectchip = "";

  late final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: thirdColor,
          elevation: 1,
          title: Text(
            "Add Address ",
            style: TextStyle(
                color: firstColor, fontFamily: 'Inter-Regular', fontSize: 18),
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
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
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
                                    horizontal: 100, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                primary: firstColor),
                            child: const Text(
                              "Pick from Map",
                              style: TextStyle(
                                  fontFamily: 'Inter-Medium', fontSize: 14),
                            )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        indent: 7,
                        endIndent: 7,
                        thickness: 1,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Address Details",
                        style: TextStyle(
                            fontSize: 16, fontFamily: 'Inter-SemiBold'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Complete Address",
                        style:
                            TextStyle(fontFamily: 'Inter-Medium', fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 50,
                          child: TextFormField(
                            controller: addressLine,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                                labelText: " Floor, building, street, area",
                                //  hintText: " Floor, building, street, area",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade300)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Landmark (optional)",
                        style:
                            TextStyle(fontFamily: 'Inter-Medium', fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 50,
                          width: 350,
                          child: TextFormField(
                            // validator: (value) {
                            //   if (value!.isEmpty ||
                            //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            //     return null;
                            //   }
                            // },
                            controller: landMark,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                                // hintText: "Near by gas station",
                                labelText: "Near by gas station",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade300)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Contact Person",
                        style:
                            TextStyle(fontFamily: 'Inter-Medium', fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Container(
                          height: 50,
                          child: TextFormField(
                            //  validator: (value) {
                            //   if (value!.isEmpty ||
                            //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            //     return "Enter the valid name";
                            //   }
                            // },
                            controller: contactperson,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                                // hintText: "Contact Person",
                                labelText: "Contact Person",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade300)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Contact Number",
                        style:
                            TextStyle(fontFamily: 'Inter-Medium', fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          height: 70,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                              } else if (
                                  //r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/'
                                  !RegExp(r'(^(?:[+0]9)?[0-9]{10}$)')
                                      // !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                      .hasMatch(value)) {
                                return "Enter the valid number";
                              }
                            },
                            maxLength: 10,
                            controller: contactnumber,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                                counterText: "",
                                //hintText: " Enter your mobile number",
                                labelText: " Enter your mobile number",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade300)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Save As*",
                        style:
                            TextStyle(fontFamily: 'Inter-Medium', fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: chipsList.length,
                            itemBuilder: (context, index) {
                              if (chipsList[index].label == selectchip) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(
                                          255,
                                          222,
                                          248,
                                          223,
                                        ),
                                        border: Border.all(color: firstColor),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          chipsList[index].label.toString()),
                                    ),
                                  ),
                                );
                              } else {
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectchip =
                                            chipsList[index].label.toString();
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            chipsList[index].label.toString(),
                                            style: TextStyle(
                                                fontFamily: 'Inter-Regular',
                                                fontSize: 11),
                                          ),
                                        ),
                                      ),
                                    ));
                              }
                            },
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 60,
                      //   child: techChips(),
                      // ),

                      Center(
                        child: ElevatedButton(
                            onPressed: () {
                              if (!formkey.currentState!.validate() ||
                                  addressLine.text.isEmpty ||
                                  contactnumber.text.isEmpty ||
                                  contactperson.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Please enter all field')),
                                );
                              } else {
                                AddressListController().addAddress(
                                    addressLine: addressLine.text,
                                    landMark: landMark.text,
                                    state: widget.latpass.toString(),
                                    country: widget.lngpass.toString(),
                                    city: city.text);

                                Navigator.push(
                                  context,
                                  PageTransition(
                                    duration: Duration(milliseconds: 300),
                                    type: PageTransitionType.topToBottom,
                                    child: PlaceOrderScreen(),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 105, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                primary: firstColor),
                            child: const Text("Save")),
                      ),
                    ],
                  ),
                ),
              ),
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
          //elevation: 0,
          label: Container(
            // height: 30,
            // width: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                chipsList[i].label,
                style: TextStyle(fontFamily: 'Inter-Regular', fontSize: 11),
              ),
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
              print(chipsList[i].label);
              print(chipsList[i].isSelected);
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
