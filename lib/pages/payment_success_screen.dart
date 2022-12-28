// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/home/home_page.dart';
import 'package:new_mobile_application/home/home_screen.dart';
import 'package:new_mobile_application/home/trackorder_screen.dart';
import 'package:page_transition/page_transition.dart';

class PaymentSuccessfulScreen extends StatefulWidget {
  const PaymentSuccessfulScreen({Key? key}) : super(key: key);

  @override
  State<PaymentSuccessfulScreen> createState() =>
      _PaymentSuccessfulScreenState();
}

class _PaymentSuccessfulScreenState extends State<PaymentSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PAYMENT SUCESSFULL',
              style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'Inter-SemiBold',
                  color: firstColor),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "TRANSACTION ID:1256778899",
              style: TextStyle(fontSize: 12, fontFamily: 'Inter-Regular'),
            ),
            Container(
              width: 270,
              height: 270,
              child: Image.asset(
                "assets/images/delivery.png",
                height: 110,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              "Order ID:456436",
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter-Bold',
                color: firstColor,
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            const Text(
              "Your order  has been placed sucessfull.\n Delivery partner will be assigned soon.",
              style: TextStyle(fontSize: 14, fontFamily: 'Inter-Regular'),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: firstColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    duration: const Duration(milliseconds: 300),
                    type: PageTransitionType.fade,
                    child: const TrackOrderScreen(),
                  ),
                );
              },
              child: const Text(
                "Track Order",
                style: TextStyle(fontFamily: 'Inter-Medium', fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    duration: const Duration(milliseconds: 300),
                    type: PageTransitionType.fade,
                    child: const HomeScreen(),
                  ),
                );
              },
              child: Text(
                "Close",
                style: TextStyle(
                    color: firstColor,
                    fontFamily: 'Inter-Medium',
                    fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
