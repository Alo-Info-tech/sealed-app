// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, prefer_const_constructors, depend_on_referenced_packages, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:intl_phone_field/intl_phone_field.dart';
//import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AboutOurSeviceScreen extends StatefulWidget {
  const AboutOurSeviceScreen({Key? key}) : super(key: key);

  @override
  State<AboutOurSeviceScreen> createState() => _AboutOurSeviceScreenState();
}

class _AboutOurSeviceScreenState extends State<AboutOurSeviceScreen> {
  bool isVisible = false;
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: thirdColor,
          elevation: 1,
          automaticallyImplyLeading: true,
          foregroundColor: firstColor,
          title: Text(
            "About Our Services",
            style: TextStyle(color: firstColor),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    //  height: 50,
                    width: double.infinity,
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
                    child: Padding( 
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "What is Sealed?",
                            style: TextStyle(
                              fontFamily: 'Inter-Regular',
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            MdiIcons.chevronDown,
                            color: firstColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                ),
                Visibility(
                  visible: isVisible,
                  child: Column(children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Lorem Ipsum is simply dummy text \nof the printing and typesetting industry. Lorem \nIpsum has been the industry's standard dummy text ever since the 1500s, when an unknown .",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Inter-Regular',
                              color: Colors.grey.shade700),
                        ),
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  child: Container(
                    //height: 50,
                    width: double.infinity,
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
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Where is Sealed currently available?",
                            style: TextStyle(
                              fontFamily: 'Inter-Regular',
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            MdiIcons.chevronDown,
                            color: firstColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isVisible1 = !isVisible1;
                    });
                  },
                ),
                Visibility(
                  visible: isVisible1,
                  child: Column(children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Lorem Ipsum is simply dummy text \nof the printing and typesetting industry. Lorem \nIpsum has been the industry's standard dummy text ever since the 1500s, when an unknown .",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Inter-Regular',
                              color: Colors.grey.shade700),
                        ),
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  child: Container(
                    //height: 50,
                    width: double.infinity,
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
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "What items are prohibited?",
                            style: TextStyle(
                              fontFamily: 'Inter-Regular',
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            MdiIcons.chevronDown,
                            color: firstColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isVisible2 = !isVisible2;
                    });
                  },
                ),
                Visibility(
                  visible: isVisible2,
                  child: Column(children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Lorem Ipsum is simply dummy text \nof the printing and typesetting industry. Lorem \nIpsum has been the industry's standard dummy text ever since the 1500s, when an unknown .",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Inter-Regular',
                              color: Colors.grey.shade700),
                        ),
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  child: Container(
                    // height: 55,
                    width: double.infinity,
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
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Can only people living in chennai use\nSealed?",
                            style: TextStyle(
                              fontFamily: 'Inter-Regular',
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            MdiIcons.chevronDown,
                            color: firstColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isVisible3 = !isVisible3;
                    });
                  },
                ),
                Visibility(
                  visible: isVisible3,
                  child: Column(children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Lorem Ipsum is simply dummy text \nof the printing and typesetting industry. Lorem \nIpsum has been the industry's standard dummy text ever since the 1500s, when an unknown .",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Inter-Regular',
                              color: Colors.grey.shade700),
                        ),
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  child: Container(
                    width: double.infinity,
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
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "I'm unable to View order details on my\nprofile?",
                            style: TextStyle(
                              fontFamily: 'Inter-Regular',
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            MdiIcons.chevronDown,
                            color: firstColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isVisible4 = !isVisible4;
                    });
                  },
                ),
                Visibility(
                  visible: isVisible4,
                  child: Column(children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Lorem Ipsum is simply dummy text \nof the printing and typesetting industry. Lorem \nIpsum has been the industry's standard dummy text ever since the 1500s, when an unknown .",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Inter-regular',
                              color: Colors.grey.shade700),
                        ),
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }
}
