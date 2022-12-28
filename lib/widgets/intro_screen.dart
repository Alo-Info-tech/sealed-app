// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/home/home_page.dart';
import 'package:new_mobile_application/widgets/login_screen.dart';
import 'package:new_mobile_application/widgets/otp_text_form.dart';
import 'package:new_mobile_application/widgets/welcom.dart';
import 'package:page_transition/page_transition.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/start1.png",
              height: 200,
              // width: 110,
            ),

            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: firstColor),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 300),
                      type: PageTransitionType.fade,
                      child: const Otp(),
                      // child: const LoginScreen()
                      //  child: HomePageScreen()
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter-SemiBold'),
                  ),
                )),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         PageTransition(
            //           duration: const Duration(milliseconds: 500),
            //           type: PageTransitionType.rightToLeft,
            //           child: const NumberScreen(),
            //         ),
            //       );
            //     },
            //     style: ElevatedButton.styleFrom(
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 45, vertical: 18),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //         primary: firstColor),
            //     child: const Text("Get Started"))
          ],
        ),
      ),
    ));
  }
}
