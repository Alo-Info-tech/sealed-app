// ignore_for_file: unused_import, library_private_types_in_public_api, prefer_const_constructors

import 'dart:async';
import 'package:get/get.dart';
import 'package:new_mobile_application/auth_init_screen.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/home/home_screen.dart';
import 'package:new_mobile_application/home/trackorder_screen.dart';
import 'package:new_mobile_application/widgets/blank_screen.dart';
import 'package:new_mobile_application/widgets/onboard_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Init()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firstColor,
      body: InkWell(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex)=> Init()));
          // Navigator.push(
          //   context,
          //   PageTransition(
          //     duration: Duration(milliseconds: 300),
          //     type: PageTransitionType.rightToLeft,
          //     child: BlankScreen(),
          //   ),
          // );
          // Navigator.push(
          //                     context,
          //                     PageRouteBuilder(
          //                         transitionDuration:
          //                             Duration(milliseconds: 2000),
          //                         transitionsBuilder: (BuildContext context,
          //                             Animation<double> animation,
          //                             Animation<double> secondaryAnimation,
          //                             Widget child) {
          //                           animation = CurvedAnimation(
          //                               parent: animation,
          //                               curve: Curves.easeInOutCirc);
          //                           return ScaleTransition(
          //                            // alignment: Alignment.center,
          //                             scale: animation,
          //                             child: child,
          //                           );
          //                         },
          //                         pageBuilder: (BuildContext context,
          //                             Animation<double> animation,
          //                             Animation<double> secondaryAnimation) {
          //                           return BlankScreen();
          //                         }));
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo here
              Image.asset(
                'assets/images/logo.gif',
                height: 360,
              ),
              SizedBox(
                height: 30,
              ),
              // CircularProgressIndicator(
              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
