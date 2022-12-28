// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/profile%20screens/about_service_screen.dart';
import 'package:page_transition/page_transition.dart';
//import 'package:intl_phone_field/intl_phone_field.dart';
//import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: thirdColor,
        elevation: 4,
        title: Text(
          "FAQ ",
          style: TextStyle(
              color: firstColor, fontFamily: 'Inter-Regular', fontSize: 18),
        ),
        automaticallyImplyLeading: true,
        foregroundColor: firstColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: AboutOurSeviceScreen(),
                      ),
                    );
                  },
                  child: Container(
                      height: 80,
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
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/images/round.png',
                                  ),
                                  radius: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "About Our Service",
                                  style: TextStyle(
                                      // color: Colors.black,
                                      fontFamily: 'Inter-Medium',
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: firstColor,
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 80,
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
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/images/round.png',
                                ),
                                radius: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Payment & Cancellation",
                                style: TextStyle(
                                    fontFamily: 'Inter-Medium', fontSize: 14),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: firstColor,
                            ),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 80,
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
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/images/round.png',
                                ),
                                radius: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "About Our Service",
                                style: TextStyle(
                                    fontFamily: 'Inter-Medium', fontSize: 14),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: firstColor,
                            ),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 80,
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
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/images/round.png',
                                ),
                                radius: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "About Our Service",
                                style: TextStyle(
                                    fontFamily: 'Inter-Medium', fontSize: 14),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: firstColor,
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
