import 'package:flutter/material.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/profile%20screens/aboutus_screen.dart';
import 'package:new_mobile_application/profile%20screens/contact_us.dart';
import 'package:new_mobile_application/profile%20screens/privacy_policy.dart';
import 'package:new_mobile_application/profile%20screens/terms_conditions.dart';
import 'package:page_transition/page_transition.dart';
import '../container.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: thirdColor,
          elevation: 1,
          title: Text(
            "About Us ",
            style: TextStyle(
                color: firstColor, fontFamily: 'Inter-Regular', fontSize: 18),
          ),
          automaticallyImplyLeading: true,
          foregroundColor: firstColor,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 300),
                          type: PageTransitionType.rightToLeft,
                          child: const TermsConditions(),
                        ),
                      );
                    },
                    child: NewContainer(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Terms & conditions',
                              style: TextStyle(
                                  fontSize: 14, fontFamily: 'Inter-Medium'),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: firstColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 300),
                          type: PageTransitionType.rightToLeft,
                          child: const PrivacyPolicy(),
                        ),
                      );
                    },
                    child: NewContainer(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Privacy policy',
                              style: TextStyle(
                                  fontSize: 14, fontFamily: 'Inter-Medium'),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: firstColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 300),
                          type: PageTransitionType.rightToLeft,
                          child: const AboutUsScreen(),
                        ),
                      );
                    },
                    child: NewContainer(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'About us',
                              style: TextStyle(
                                  fontSize: 14, fontFamily: 'Inter-Medium'),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: firstColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 300),
                          type: PageTransitionType.rightToLeft,
                          child: const ContactUs(),
                        ),
                      );
                    },
                    child: NewContainer(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Contact us',
                              style: TextStyle(
                                  fontSize: 14, fontFamily: 'Inter-Medium'),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: firstColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}