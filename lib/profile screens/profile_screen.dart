import 'package:flutter/material.dart';

// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, sort_child_properties_last, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:new_mobile_application/colors.dart';


import 'package:new_mobile_application/container.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/map_screen.dart';
import 'package:new_mobile_application/profile%20screens/aboutus.dart';
import 'package:new_mobile_application/profile%20screens/edit_details_BottomSheet.dart';
import 'package:new_mobile_application/profile%20screens/faq_screen.dart';
import 'package:new_mobile_application/profile%20screens/feed_back_screen.dart';
import 'package:new_mobile_application/profile%20screens/manage_address_screen.dart';
import 'package:new_mobile_application/profile%20screens/referal_page.dart';
import 'package:new_mobile_application/widgets/intro_screen.dart';
import 'package:new_mobile_application/widgets/login_screen.dart';
import 'package:new_mobile_application/widgets/otp_text_form.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void>? _launched;
  String _phone = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  //signout function
  signOut() async {
    await auth.signOut();
    Get.offAll(Otp());
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(scheme: 'tel', path: "9150965551");
    // ignore: deprecated_member_use
    await launch(launchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: thirdColor,
          automaticallyImplyLeading: true,
          foregroundColor: firstColor,
          elevation: 1,
          title: InkWell(
            onTap: () {
              //Get.to(LoginScreen());
              Get.to(AlreadyLogin());
            },
            child: Text(
              "Profile ",
              style: TextStyle(
                  color: firstColor, fontFamily: 'Inter-Regular', fontSize: 18),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      personalEditBottomSheet(context);
                    },
                    child: NewContainer(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(
                                  MdiIcons.accountOutline,
                                  color: firstColor,size: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Personal Details',
                                style: TextStyle(
                                    fontFamily: 'Inter-Regular', fontSize: 14),
                              )
                            ]),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
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
                  Container(
                    // height: height / 0.8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0.2, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: [
                        // Your Orders
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  duration: Duration(milliseconds: 300),
                                  type: PageTransitionType.rightToLeft,
                                  child: ManageAddressScreen(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Image.asset( 
                                    "assets/images/manage_account.png",
 
                                    height: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Manage Address',
                                    style: TextStyle(
                                        fontFamily: 'Inter-Regular',
                                        fontSize: 14),
                                  )
                                ]),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 20,
                                  color: firstColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          //indent: 1,
                          //endIndent: 1,
                          thickness: 2,
                          color: backgroundColor,
                        ),

                        // Fav
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  duration: Duration(milliseconds: 300),
                                  type: PageTransitionType.rightToLeft,
                                  child: FAQScreen(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Row(children: [
                                    Icon(
                                      MdiIcons.helpCircleOutline,
                                      color: firstColor,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 18,
                                    ),
                                    const Text(
                                      'FAQ',
                                      style: TextStyle(
                                          fontFamily: 'Inter-Regular',
                                          fontSize: 14),
                                    )
                                  ]),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 20,
                                  color: firstColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: backgroundColor,
                        ),

                        // Address
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  duration: Duration(milliseconds: 300),
                                  type: PageTransitionType.rightToLeft,
                                  child: AboutUs(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Image.asset(
 
                                    "assets/images/aboutus.png",
 
                                    height: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'About Us',
                                    style: TextStyle(
                                        fontFamily: 'Inter-Regular',
                                        fontSize: 14),
                                  )
                                ]),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 20,
                                  color: firstColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: backgroundColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  duration: Duration(milliseconds: 300),
                                  type: PageTransitionType.rightToLeft,
                                  child: ReferalPage(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(
                                        MdiIcons.accountSupervisorOutline,
                                        color: firstColor,
                                        size: 25),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Referrals',
                                    style: TextStyle(
                                        fontFamily: 'Inter-Regular',
                                        fontSize: 14),
                                  )
                                ]),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 20,
                                  color: firstColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: backgroundColor,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  duration: Duration(milliseconds: 300),
                                  type: PageTransitionType.rightToLeft,
                                  child: FeedBackScreen(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Image.asset( 
 
                                    "assets/images/feedback.png",
 
                                    height: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Send Feedback',
                                    style: TextStyle(
                                        fontFamily: 'Inter-Regular',
                                        fontSize: 14),
                                  )
                                ]),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 20,
                                  color: firstColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: backgroundColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Contact costumer care number",
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "NO",
                                              style: TextStyle(
                                                  color: firstColor,
                                                  fontFamily: 'Inter-SemiBold'),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                _launched =
                                                    _makePhoneCall(_phone);
                                              });
                                            },
                                            child: Text("YES",
                                                style: TextStyle(
                                                    color: firstColor,
                                                    fontFamily:
                                                        'Inter-SemiBold'))),
                                      ],
                                    );
                                  });
                              // setState(() {
                              //   _launched = _makePhoneCall(_phone);
                              // });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(MdiIcons.alertCircleOutline,
 
                                        color: firstColor, size: 21),
 
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Support',
                                    style: TextStyle(
                                        fontFamily: 'Inter-Regular',
                                        fontSize: 14),
                                  )
                                ]),
                                const SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 20,
                                  color: firstColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: backgroundColor,
                        ),
 
                        InkWell(
                          onTap: () {
                            launchUrl(context,
                                "https://play.google.com/store/apps/details?id=com.devsol.customer");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(MdiIcons.starOutline,
                                        color: firstColor, size: 25),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Rate Us',
                                    style: TextStyle(
                                        fontFamily: 'Inter-Regular',
                                        fontSize: 14),
                                  )
                                ]),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 20,
                                  color: firstColor,
 
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Are you sure,you want to Logout "),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("NO")),
                                TextButton(
                                    onPressed: () {
                                      signOut();
                                    },
                                    child: Text("YES"))
                              ],
                            );
                          });
                    },
                    child: NewContainer(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  MdiIcons.power,
                                  color: firstColor,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Log Out')
                            ]),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 19,
                              color: firstColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("v.1.1.69")
                ],
              ),
            ),
          ),
        ));
  }

  Future<dynamic> personalEditBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const EditBottomSheet();
      },
    );
  }

  Future<dynamic> ratingBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SizedBox(
            height: 150,
            //width: 350,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 290.0,
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(MdiIcons.closeCircleOutline)),
                ),
                Text("Would you like to rate us on")
              ],
            ),
          );
        });
  }

  Future launchUrl(BuildContext context, String url) async {
    await canLaunch(url)
        ? await launch(url)
        : ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Something went wrong when launching URL"),
            ),
          );
  }
}
