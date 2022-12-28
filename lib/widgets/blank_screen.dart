// ignore_for_file: unused_import, library_private_types_in_public_api, prefer_const_constructors

import 'dart:async';
import 'package:get/get.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/home/trackorder_screen.dart';
import 'package:new_mobile_application/widgets/onboard_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class BlankScreen extends StatefulWidget {
  const BlankScreen({Key? key}) : super(key: key);
  @override
  _BlankScreenState createState() => _BlankScreenState();
}

class _BlankScreenState extends State<BlankScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(microseconds: 488888), () {
      Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 300),
          type: PageTransitionType.rightToLeft,
          child: OnboardScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firstColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo here
        ],
      ),
    );
  }
}
