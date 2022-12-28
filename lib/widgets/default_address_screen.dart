// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/home/home_screen.dart';
import 'package:new_mobile_application/map_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../catogery/add_address_screen.dart';
//import 'package:intl_phone_field/intl_phone_field.dart';
//import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class DefaultAddressScreen extends StatefulWidget {
  const DefaultAddressScreen({Key? key}) : super(key: key);

  @override
  State<DefaultAddressScreen> createState() => _DefaultAddressScreenState();
}

class _DefaultAddressScreenState extends State<DefaultAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 9,
                ),
                Text(
                  "Set Default Address",
                  style: TextStyle(
                    fontFamily: 'Inter-Bold',
                    fontSize: 24,
                    color: firstColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Set up your default address to\nseamlesslessly place orders",
                  style: TextStyle(fontFamily: 'Inter-Medium', fontSize: 14),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/map_image.png"))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50.0),
                          child: ElevatedButton(
                              onPressed: () {
                                //_formKey.currentState?.validate();
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    duration: const Duration(milliseconds: 300),
                                    type: PageTransitionType.bottomToTop,
                                    child: const MapScreen(
                                      category: "",
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 45, vertical: 15),
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
                      ]),
                ),
                const SizedBox(height: 10),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AddAddressScreen()));
                      },
                      child: Text(
                        "or enter address manually",
                        style: TextStyle(
                            fontFamily: 'Inter-Medium',
                            fontSize: 14,
                            color: firstColor),
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        //_formKey.currentState?.validate();
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 300),
                            type: PageTransitionType.rightToLeft,
                            child: const HomeScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 105, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          primary: firstColor),
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                            fontFamily: 'Inter-SemiBold', fontSize: 14),
                      )),
                ),
              ]),
        ),
      ),
    ));
  }
}
