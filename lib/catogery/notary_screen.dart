// ignore_for_file: prefer_const_constructors, sort_child_properties_last, depend_on_referenced_packages, sized_box_for_whitespace, avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/catogery/addressbottomsheet.dart';
import 'package:new_mobile_application/catogery/pickaddressbottomsheet.dart';
import 'package:new_mobile_application/catogery/delivery_bottom_screen.dart';
import 'package:new_mobile_application/colors.dart';
import 'package:new_mobile_application/controller/select_address_controller.dart';

import 'package:new_mobile_application/home/home_screen.dart';
import 'package:new_mobile_application/pages/payment_method_screen.dart';
import 'package:new_mobile_application/profile%20screens/profile_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:new_mobile_application/utlities/const.dart';
import 'package:page_transition/page_transition.dart';

final List<String> imgList = [
  'assets/images/carousel.png',
  'assets/images/carousel.png',
  'assets/images/carousel.png',
];

class NotaryScreen extends StatefulWidget {
  const NotaryScreen({Key? key}) : super(key: key);

  @override
  State<NotaryScreen> createState() => _NotaryScreenState();
}

class _NotaryScreenState extends State<NotaryScreen> {
  int _counter = 1;
  int value = 0;

  bool status = false;
  var picupAddresss = '';
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> imageSliders = imgList
      .map((item) => ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          child: Stack(
            children: <Widget>[
              Image.asset(item, fit: BoxFit.cover, height: 400, width: 400),
            ],
          )))
      .toList();

  SelectAddressController selectController = Get.put(SelectAddressController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Get.off(() => const HomeScreen());

          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: thirdColor,
            elevation: 1,
            title: Text(
              "Notary ",
              style: TextStyle(
                  fontFamily: 'Inter-Regular', fontSize: 18, color: firstColor),
            ),
            automaticallyImplyLeading: true,
            foregroundColor: firstColor,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: ProfileScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    MdiIcons.emoticonOutline,
                    color: firstColor,
                  )),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          body: SafeArea(
              child: SizedBox(
            height: MediaQuery.of(context).size.height / 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        items: imageSliders,
                        carouselController: _controller,
                        options: CarouselOptions(
                            autoPlayInterval: Duration(seconds: 5),
                            height: 150,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: .0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 5.0,
                              height: 5.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (_current == entry.key
                                          ? firstColor
                                          : Colors.black)
                                      .withOpacity(
                                          _current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Pickup Address",
                        style: TextStyle(
                            fontFamily: 'Inter-SemiBold', fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          // selectAddressBottomSheet(context);
                          defaultAddressBottomSheet(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(0),
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(
                                    0.2, 3), // changes position of shadow
                              ),
                            ],
                            //Border.all
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            //Border.all
                          ),
                          child: selectController.notarypick.toString() == ""
                              ? Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    "Home(Default Address)",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 14),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    selectController.notarypick.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 14),
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Delivery Address",
                        style: TextStyle(
                            fontFamily: 'Inter-SemiBold', fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          deliveryAddressBottomSheet(context);
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: firstColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: selectController.notarypick.toString() == ""
                              ? Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 14),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    selectController.notarypick.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 14),
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Set pickup address for delivery",
                            style: TextStyle(
                                fontFamily: 'Inter-Regular', fontSize: 12),
                          ),
                          FlutterSwitch(
                            activeColor: firstColor,
                            inactiveColor: Colors.grey.shade500,
                            toggleColor: Colors.white,
                            width: 55,
                            height: 28,
                            value: status,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "No.of Documents",
                            style: TextStyle(
                                color: firstColor, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: FittedBox(
                                child: Row(
                                  children: [
                                    Container(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (_counter != 0) {
                                              return setState(() {
                                                _counter--;
                                                value = 100 * _counter;
                                              });
                                            } else {
                                              return null;
                                            }
                                          });
                                        },
                                        child: FittedBox(
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: firstColor),
                                          ),
                                        ),
                                      ),
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: firstColor),
                                        borderRadius: BorderRadius.circular(5),
                                        shape: BoxShape.rectangle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      '$_counter',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 25),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Container(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _counter++;
                                            value = 100 * _counter;
                                          });
                                        },
                                        child: FittedBox(
                                          child: Text(
                                            '+',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: firstColor),
                                          ),
                                        ),
                                      ),
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: firstColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                status == false
                    ? Container()
                    : Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height / 5.1,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Deliver to',
                                        style: TextStyle(
                                            color: firstColor, fontSize: 13),
                                      ),
                                      // Text(
                                      //   'Estimated time to deliver',
                                      //   style: TextStyle(
                                      //       color: firstColor, fontSize: 13),
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Home',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      // Text(
                                      //   '45 min',
                                      //   style: TextStyle(
                                      //       fontWeight: FontWeight.bold,
                                      //       fontSize: 18),
                                      // ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "\u{20B9} ${_counter * 100}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              PageTransition(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: PaymentMethodScreen(),
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 45,
                                                      vertical: 7),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              primary: firstColor),
                                          child: Row(
                                            children: const [
                                              Text("Pay"),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(Icons.arrow_forward)
                                            ],
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          )),
          // bottomSheet: Container(
          //   color: Colors.white,
          //   height: MediaQuery.of(context).size.height / 5.1,
          //   width: double.infinity,
          //   child: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: Container(
          //       decoration: BoxDecoration(
          //           color: Colors.white, borderRadius: BorderRadius.circular(10)),
          //       child: Padding(
          //         padding: const EdgeInsets.all(5.0),
          //         child: Column(
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   'Deliver to',
          //                   style: TextStyle(color: firstColor, fontSize: 13),
          //                 ),
          //                 Text(
          //                   'Estimated time to deliver',
          //                   style: TextStyle(color: firstColor, fontSize: 13),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(
          //               height: 10,
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: const [
          //                 Text(
          //                   'Home',
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 18),
          //                 ),
          //                 Text(
          //                   '45 min',
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 18),
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   '85/- plus Taxes',
          //                   style: TextStyle(fontWeight: FontWeight.bold),
          //                 ),
          //                 ElevatedButton(
          //                     onPressed: () {
          //                       Navigator.push(
          //                         context,
          //                         PageTransition(
          //                           duration: Duration(milliseconds: 300),
          //                           type: PageTransitionType.rightToLeft,
          //                           child: PaymentMethodScreen(),
          //                         ),
          //                       );
          //                     },
          //                     style: ElevatedButton.styleFrom(
          //                         padding: const EdgeInsets.symmetric(
          //                             horizontal: 45, vertical: 7),
          //                         shape: RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(10.0),
          //                         ),
          //                         primary: firstColor),
          //                     child: Row(
          //                       children: const [
          //                         Text("Pay"),
          //                         SizedBox(
          //                           width: 10,
          //                         ),
          //                         Icon(Icons.arrow_forward)
          //                       ],
          //                     ))
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ));
  }

  Future<dynamic> selectAddressBottomSheet(BuildContext context) {
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
        return AddressEditBottomSheet();
      },
    );
  }

  Future<dynamic> deliveryAddressBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DeliveryBottomSheet(
          isNotary: true,
        );
      },
    );
  }

  Future<dynamic> defaultAddressBottomSheet(BuildContext context) {
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
        return PickAddressBottomSheet(
          isNotary: true,
        );
      },
    );
  }
}
