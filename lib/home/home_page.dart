// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:new_mobile_application/catogery/add_address_screen.dart';
import 'package:new_mobile_application/catogery/banking_service_screen.dart';
import 'package:new_mobile_application/catogery/documents_screen.dart';
import 'package:new_mobile_application/catogery/essential_items_screen.dart';
import 'package:new_mobile_application/catogery/medical_report_screen.dart';
import 'package:new_mobile_application/catogery/notary_screen.dart';
import 'package:new_mobile_application/catogery/place_order_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/colors.dart';
import 'package:new_mobile_application/controller/select_address_controller.dart';

import 'package:new_mobile_application/home/homescreen_gridview.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_mobile_application/profile%20screens/profile_screen.dart';
import 'package:new_mobile_application/utlities/const.dart';
import 'package:page_transition/page_transition.dart';

final List<String> imgList = [
  'https://static5.depositphotos.com/1007593/453/i/450/depositphotos_4530089-stock-photo-african-landscape.jpg',
  'https://images.all-free-download.com/images/graphiclarge/beach_cloud_dawn_horizon_horizontal_landscape_ocean_601821.jpg',
  'https://thumbs.dreamstime.com/b/wispy-clouds-horizontal-sky-panorama-high-altitude-wind-swept-blue-147437736.jpg',
];

class HomePageScreen extends StatefulWidget {
  final String? name;
  const HomePageScreen({Key? key, this.name}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  SelectAddressController selectController = Get.put(SelectAddressController());
  @override
  void initState() {
    selectController.placeorderdelivery = ''.obs;
    selectController.placeorderpickup = ''.obs;
    selectController.esspick = ''.obs;
    selectController.essdelivery = ''.obs;
    selectController.bankpick = ''.obs;
    selectController.bankdelivery = ''.obs;
    selectController.medipickup = ''.obs;
    selectController.medidelivery = ''.obs;
    selectController.notarypick = ''.obs;
    selectController.notarydeliv = ''.obs;
    // picklat = 0.10;
    // picklng = 0.0;
    // delilat = 0.0;
    // delilng = 0.0;

    super.initState();
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> imageSliders = imgList
      .map((item) => ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, height: 400, width: 400),
            ],
          )))
      .toList();

  @override
  Widget build(BuildContext context) {
    DateTime timeBackPressed = DateTime.now();
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        timeBackPressed = DateTime.now();
        if (difference >= Duration(seconds: 2)) {
          final String msg = 'Press the back button to exit';
          Fluttertoast.showToast(
            msg: msg,
          );
          return false;
        } else {
          Fluttertoast.cancel();
          SystemNavigator.pop();
          return true;
        }
      },
      child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: thirdColor,
            elevation: 0,
            // title: Center(
            //     child: Image.asset(
            //   "assets/images/444.png",
            //   height: 40,
            // )),
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("assets/images/444.png"),
            ),

            // title: Text(
            //   "Welcome ${widget.name == null ?"" :widget.name.toString()}",
            //   style: TextStyle(
            //       color: firstColor, fontFamily: 'Inter-Medium', fontSize: 14),
            // ),
            automaticallyImplyLeading: false,
            foregroundColor: firstColor,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ));
                  },
                  icon: Icon(
                    MdiIcons.emoticonOutline,
                    color: firstColor,
                  )),
            ],
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CarouselSlider(
                        items: imageSliders,
                        carouselController: _controller,
                        options: CarouselOptions(
                            height: 130,
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
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: const Text(
                          "Select Category",
                          style: TextStyle(
                              fontSize: 16, fontFamily: 'Inter-SemiBold'),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  PlaceOrderScreen()));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6.5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: const Offset(0.2,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  'Document \nDelivery',
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'Inter-SemiBold'),
                                                ),
                                              ),
                                              Container(
                                                height: 25,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              const Radius
                                                                  .circular(15),
                                                          bottomRight:
                                                              const Radius
                                                                      .circular(
                                                                  15)),
                                                  color: Color.fromARGB(
                                                      255, 78, 183, 83),
                                                ),
                                              )
                                            ],
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Image.asset(
                                              "assets/images/card1.png",
                                              height: 60,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EssentialItemsScreen()));
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    height: MediaQuery.of(context).size.height /
                                        6.5,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: const Offset(0.2,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                'Essential\nItems',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontFamily:
                                                        'Inter-SemiBold'),
                                              ),
                                            ),
                                            Container(
                                              height: 25,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius
                                                        .only(
                                                    bottomLeft:
                                                        const Radius.circular(
                                                            15),
                                                    bottomRight:
                                                        const Radius.circular(
                                                            15)),
                                                color: Color.fromARGB(
                                                    255, 93, 136, 171),
                                              ),
                                            )
                                          ],
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: Image.asset(
                                            "assets/images/card2.png",
                                            height: 60,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          duration: Duration(milliseconds: 300),
                                          type: PageTransitionType.rightToLeft,
                                          child: DocumentsScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6.5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: const Offset(0.2,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  'Buy\nDocuments',
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'Inter-SemiBold'),
                                                ),
                                              ),
                                              Container(
                                                height: 25,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              const Radius
                                                                  .circular(15),
                                                          bottomRight:
                                                              const Radius
                                                                      .circular(
                                                                  15)),
                                                  color: Color.fromARGB(
                                                      255, 249, 74, 74),
                                                ),
                                              )
                                            ],
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Image.asset(
                                              "assets/images/card3.png",
                                              height: 60,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          duration: Duration(milliseconds: 300),
                                          type: PageTransitionType.rightToLeft,
                                          child: NotaryScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6.5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: const Offset(0.2,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  'Notary\nServices',
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'Inter-SemiBold'),
                                                ),
                                              ),
                                              Container(
                                                height: 25,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              const Radius
                                                                  .circular(15),
                                                          bottomRight:
                                                              const Radius
                                                                      .circular(
                                                                  15)),
                                                  color: Colors.yellow.shade800,
                                                ),
                                              )
                                            ],
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Image.asset(
                                              "assets/images/card4.png",
                                              height: 60,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          duration: Duration(milliseconds: 300),
                                          type: PageTransitionType.rightToLeft,
                                          child: BankingServicesScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6.5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: const Offset(0.2,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Text(
                                                  'Banking\nServices',
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'Inter-SemiBold'),
                                                ),
                                              ),
                                              Container(
                                                height: 25,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              const Radius
                                                                  .circular(15),
                                                          bottomRight:
                                                              const Radius
                                                                      .circular(
                                                                  15)),
                                                  color: Color.fromARGB(
                                                      255, 190, 126, 229),
                                                ),
                                              )
                                            ],
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Image.asset(
                                              "assets/images/card5.png",
                                              height: 60,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          duration: Duration(milliseconds: 300),
                                          type: PageTransitionType.rightToLeft,
                                          child: MedicalReportScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6.5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: const Offset(0.2,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  'Medical\nReport',
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'Inter-SemiBold'),
                                                ),
                                              ),
                                              Container(
                                                height: 25,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              const Radius
                                                                  .circular(15),
                                                          bottomRight:
                                                              const Radius
                                                                      .circular(
                                                                  15)),
                                                  color: Color.fromARGB(
                                                      255, 11, 221, 203),
                                                ),
                                              )
                                            ],
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Image.asset(
                                              "assets/images/card6.png",
                                              height: 60,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          )),
    );
  }
}
