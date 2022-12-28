// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, prefer_const_constructors, null_check_always_fails

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/widgets/intro_screen.dart';
import 'package:new_mobile_application/widgets/login_screen.dart';
import 'package:new_mobile_application/widgets/onboarding_content.dart';
import 'package:new_mobile_application/widgets/otp_text_form.dart';
import 'package:new_mobile_application/widgets/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: InkWell(
        // onTap: () {
        //   if (currentIndex == 2) {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (_) => IntroScreen()));
        //   }
        // },
        onTap: () {
          if (currentIndex == 2) {
            Navigator.push(
              context,
              PageTransition(
                duration: Duration(milliseconds: 300),
                type: PageTransitionType.fade,
                child: Otp(),
              ),
            );
          }
        },
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 70),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              contents[i].text,
                              style: const TextStyle(
                                fontFamily: 'Inter-Bold',
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              contents[i].title,
                              style: const TextStyle(
                                  fontSize: 36,
                                  fontFamily: 'Inter-ExtraBold',
                                  color: Colors.black),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              contents[i].discription,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                fontFamily: 'Inter-Medium',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          //height: 380,
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade400),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildDot(index, context),
                          ),
                        ),
                      ),
                      Center(
                        child: Builder(builder: (context) {
                          if (currentIndex == 0) {
                            return TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IntroScreen()));
                              },
                              child: Text(
                                "skip",
                                style: TextStyle(
                                    color: firstColor,
                                    fontFamily: 'Inter-Medium',
                                    fontSize: 14),
                              ),
                            );
                          } else if (currentIndex == 1) {
                            return TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IntroScreen()));
                              },
                              child: Text(
                                "skip",
                                style: TextStyle(
                                    color: firstColor,
                                    fontFamily: 'Inter-Medium',
                                    fontSize: 14),
                              ),
                            );
                          } else {
                            return Container(
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: firstColor),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Center(
                                  child: Text(
                                    'Get Started',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Inter-Medium',
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            );
                          }
                          // return Text(
                          //   '2/3',
                          //   style: TextStyle(
                          //       color: Colors.grey,
                          //       fontWeight: FontWeight.w700,
                          //       fontSize: 25),
                          // );
                        }),
                      ),
                      SizedBox(
                        height: 5,
                      )
                      // Center(
                      //   child: TextButton(
                      //       onPressed: () {
                      //         Navigator.push(
                      //           context,
                      //           PageTransition(
                      //             duration: Duration(milliseconds: 300),
                      //             type: PageTransitionType.fade,
                      //             child: IntroScreen(),
                      //             //  child: LoginScreen()
                      //           ),
                      //         );
                      //       },
                      //       child: Text(
                      //         "skip",
                      //         style: TextStyle(
                      //             color: firstColor,
                      //             fontFamily: 'Inter-Medium',
                      //             fontSize: 14),
                      //       )),
                      // )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      width: currentIndex == index ? 30 : 6,
      height: 6,
      //margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Colors.grey.shade700 : secondColor,
      ),
    );
  }

  Future navigator(int index, BuildContext context) {
    currentIndex = 2;
    return null!;
  }
}
