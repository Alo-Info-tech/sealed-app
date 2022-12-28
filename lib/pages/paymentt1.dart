// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_mobile_application/catogery/add_address_screen.dart';
import 'package:new_mobile_application/catogery/document_details_bottom_sheet.dart';
import 'package:new_mobile_application/catogery/place_order_screen.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/map_screen.dart';
import 'package:new_mobile_application/pages/offer_code.dart';
import 'package:new_mobile_application/pages/payment_method_screen.dart';
import 'package:new_mobile_application/profile%20screens/profile_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/utlities/const.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DInstruction {
  String label;

  Color color;
  bool isSelected;
  DInstruction(this.label, this.color, this.isSelected);
}

class PaymenttScreen extends StatefulWidget {
  final String? pickupAddress,
      deliveryAddress,
      typeDocuments,
      onOrround,
      chip,
      payment;
  final List instruction;

  final double? picklat, picklng, delilat, delilng;
  const PaymenttScreen({
    Key? key,
    this.pickupAddress,
    this.deliveryAddress,
    this.typeDocuments,
    this.onOrround,
    this.payment,
    this.picklat,
    this.picklng,
    this.delilat,
    this.delilng,
    this.chip,
    required selectedValue,
    required this.instruction,
  }) : super(key: key);

  @override
  State<PaymenttScreen> createState() => _PaymenttScreenState();
}

class _PaymenttScreenState extends State<PaymenttScreen> {
  final itemsTimings = [
    ProductTimingModel(title: 'Secured Document'),
    ProductTimingModel(title: 'Digital Signature Token'),
    ProductTimingModel(title: 'Signature on Documents'),
    ProductTimingModel(title: 'Digital Drives'),
  ];
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPiKey = " AIzaSyDfaG1piL6bYVYsGNX1Lev3f-gptl1M_k8 ";

  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  LatLng startLocation = LatLng(picklat, picklng);
  LatLng endLocation = LatLng(delilat, delilng);

  double distance = 0.0;
  String? selectedValue;

  getDirections() async {
    List<LatLng> polylineCoordinates = [];
    print("check1");
    print(distance.toString());
    print(startLocation.latitude);
    print(startLocation.longitude);
    print(endLocation.latitude);
    print(endLocation.longitude);

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      // print("check2");
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      // print("Success");
    } else {
      print(result.errorMessage);
    }

    //polulineCoordinates is the List of longitute and latidtude.
    double totalDistance = 0;
    print("check three");
    print(polylineCoordinates.length.toString());
    for (var i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude);
    }
    print(totalDistance);

    setState(() {
      distance = totalDistance;
      print(distance);
    });

    //add to the list of poly line coordinates
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  void initState() {
    getDirections();
    Timer(const Duration(seconds: 3), () {
      fun();
    });

    super.initState();
  }

  var pay = 0;
  Future<void>? fun() async {
    setState(() {
      if (widget.onOrround == "Round Trip") {
        var data = double.parse(distance.toString());
        pay = (data.round() * 50) * 2;
      } else {
        var data = double.parse(distance.toString());
        pay = data.round() * 50;
      }
      print(pay.toString());
    });
    return null;
  }

  // List<DInstruction> chipsList = [
  //   DInstruction("Don't ring the bell", Colors.white, false),
  //   DInstruction("Call once reached", Colors.white, false),
  //   DInstruction("Drop at neighbours house", Colors.white, false),
  //   DInstruction("Collect items", Colors.white, false),
  // ];

  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: thirdColor,
        elevation: 1,
        title: InkWell(
          onTap: () {
            // fun();
            print(distance);
            fun();
            getDirections();
            print(startLocation.latitude);
            // print(picklng);
            // print(delilat);
            // print(delilng);
          },
          child: Text(
            "Payment",
            style: TextStyle(
                fontFamily: 'Inter-Regular', fontSize: 18, color: firstColor),
          ),
        ),
        automaticallyImplyLeading: true,
        foregroundColor: firstColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
              icon: Icon(
                MdiIcons.emoticonOutline,
                color: firstColor,
              )),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset:
                          const Offset(0.2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Package Details",
                              style: TextStyle(
                                  fontSize: 14,
                                  //fontWeight: FontWeight.bold,
                                  color: firstColor,
                                  fontFamily: 'Inter-SemiBold'),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PlaceOrderScreen()));
                              },
                              child: Text(
                                "CHANGE",
                                style: TextStyle(
                                  fontSize: 12, fontFamily: 'Inter-SemiBold',
                                  // fontWeight: FontWeight.bold,
                                  color: firstColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              //  height: 100,
                              width: 250,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: selectedProductTiming.length,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      selectedProductTiming[index],
                                      style: const TextStyle(
                                        fontFamily: 'Inter-SemiBold',
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }),
                            ),
                            Text(
                              widget.onOrround.toString() == ""
                                  ? " "
                                  : widget.onOrround.toString(),
                              style: TextStyle(
                                fontSize: 14, fontFamily: 'Inter-Bold',
                                //  fontWeight: FontWeight.bold,
                                color: firstColor,
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset:
                          const Offset(0.2, 3), // changes position of shadow
                    ),
                  ],
                  //Border.all

                  //Border.all
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pickup Address",
                            style: TextStyle(
                              color: firstColor, fontFamily: 'Inter-SemiBold',
                              fontSize: 14,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddAddressScreen()));
                            },
                            child: Text(
                              "CHANGE",
                              style: TextStyle(
                                fontSize: 12, fontFamily: 'Inter-SemiBold',
                                //fontWeight: FontWeight.bold,
                                color: firstColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Inter-SemiBold',
                            //fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.pickupAddress.toString(),
                        //picupAddresss.toString() == "" ? "" : picupAddresss,
                        style: TextStyle(
                            fontFamily: 'Inter-Regular', fontSize: 12),
                      ),
                      // const Text(
                      //   "273 pursawalkam,high school roadsaravana store\noop,chennai-600007",
                      //   style: TextStyle(
                      //       fontFamily: 'Inter-Regular', fontSize: 12),
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Delivery address",
                        style: TextStyle(
                            fontFamily: 'Inter-SemiBold',
                            //fontWeight: FontWeight.bold,
                            color: firstColor,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Sealed office",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Inter-SemiBold',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.deliveryAddress.toString(),
                        //"273 pursawalkam,high school roadsaravana store\noop,chennai-600007",
                        //deliverAddress.toString() == "" ? "" : deliverAddress,
                        style: TextStyle(
                            fontFamily: 'Inter-Regular', fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 300),
                      type: PageTransitionType.bottomToTop,
                      child: OfferCodeScreen(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                            const Offset(0.2, 3), // changes position of shadow
                      ),
                    ],
                    //Border.all

                    //Border.all
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Offer code",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Inter-SemiBold',
                            fontWeight: FontWeight.bold,
                            color: firstColor,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 17.0,
                          color: firstColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset:
                          const Offset(0.2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: FutureBuilder(
                    future: fun(),
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cost Breakdown",
                              style: TextStyle(
                                  fontFamily: 'Inter-SemiBold',
                                  fontWeight: FontWeight.bold,
                                  color: firstColor,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Base price",
                                  style: const TextStyle(
                                      fontFamily: 'Inter-Re0gular',
                                      fontSize: 12,
                                      color: Colors.black),
                                ),
                                // widget.payment.toString() == ""
                                //     ? Text("")
                                //     :
                                Text(
                                  //distance.toString(),
                                  pay.toString(),
                                  style: const TextStyle(
                                      fontFamily: '  Inter-Regular',
                                      fontSize: 12,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Taxes",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontFamily: 'Inter-Regular'),
                                ),
                                const Text(
                                  "RS.20.00",
                                  style: const TextStyle(
                                      fontFamily: 'Inter-Regular',
                                      fontSize: 12,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Grand total",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Inter-SemiBold',
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                widget.payment.toString() == ""
                                    ? Text("")
                                    : Text(
                                        "Rs.${int.parse(pay.toString()) + 20}.00",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Inter-SemiBold',
                                            //fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset:
                          const Offset(0.2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery instruction",
                            style: TextStyle(
                              fontSize: 14, fontFamily: 'Inter-SemiBold',
                              //fontWeight: FontWeight.bold,
                              color: firstColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PlaceOrderScreen()));
                            },
                            child: Text(
                              "CHANGE",
                              style: TextStyle(
                                fontSize: 10, fontFamily: 'Inter-SemiBold',
                                // fontWeight: FontWeight.bold,
                                color: firstColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.instruction.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 40,
                                //width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 234, 243, 247),
                                    border: Border.all(color: firstColor)),
                                child: Center(
                                  child: Text(
                                    widget.instruction[index],
                                    style: const TextStyle(
                                      fontFamily: 'Inter-Regular',
                                      fontSize: 12,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Hand over to Arun",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Inter-Regular'),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              Text(""),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height / 10,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.payment.toString() == ''
                ? Text("")
                : RichText(
                    text: TextSpan(
                      text: "Rs.${int.parse(pay.toString()) + 20}.00/-",
                      style: TextStyle(
                          fontFamily: "Inter-Bold",
                          fontSize: 16,
                          color: Colors.black),
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Plus Taxes',
                            style: TextStyle(
                              fontFamily: 'Inter-Medium',
                              //fontWeight: FontWeight.bold,
                              fontSize: 9,
                            )),
                      ],
                    ),
                  ),
            ElevatedButton(
                onPressed: () {
                  print(selectedValue);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              PaymentMethodScreen()));
                  // Navigator.push(
                  //   context,
                  //   PageTransition(
                  //     duration: Duration(milliseconds: 300),
                  //     type: PageTransitionType.rightToLeft,
                  //     child: PaymentMethodScreen(),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 45, vertical: 7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    primary: firstColor),
                child: Row(
                  children: const [
                    Text(
                      "Pay",
                      style:
                          TextStyle(fontFamily: 'Inter-SemiBold', fontSize: 14),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.arrow_forward)
                  ],
                ))
          ],
        ),
      ),
    );
  }

  // Widget techChips() {
  //   List<Widget> chips = [];
  //   for (int i = 0; i < chipsList.length; i++) {
  //     Widget item = Padding(
  //       padding: const EdgeInsets.only(left: 3, right: 3),
  //       child: FilterChip(
  //         shape: StadiumBorder(
  //             side: chipsList[i].isSelected == true
  //                 ? BorderSide(color: Colors.grey, style: BorderStyle.solid)
  //                 : BorderSide.none),
  //         disabledColor: Colors.white,
  //         // avatar: ,
  //         avatarBorder: CircleBorder(side: BorderSide.none),
  //         showCheckmark: false,
  //         clipBehavior: Clip.antiAliasWithSaveLayer,
  //         //elevation: 0,
  //         label: Container(
  //           // height: 30,
  //           // width: 50,
  //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),

  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 7),
  //             child: Text(chipsList[i].label),
  //           ),
  //         ),
  //         labelStyle: const TextStyle(color: Colors.black, fontSize: 15),
  //         shadowColor: Colors.black,
  //         backgroundColor: Colors.white.withOpacity(0.1),
  //         selectedColor: firstColor.withOpacity(0.1),
  //         //  selected: chipsList[i].isSelected,
  //         selected: true,
  //         //   shape: const StadiumBorder(side: BorderSide(),),

  //         onSelected: (bool value) {
  //           setState(() {
  //             chipsList[i].isSelected = value;
  //             print(chipsList[i].label);
  //             if (chipsList[i].isSelected == true) {
  //               isInstruction.add(chipsList[i].label.toString());
  //               print(isInstruction);
  //             } else {
  //               isInstruction
  //                   .removeWhere((element) => element == chipsList[i].label);
  //               print(isInstruction);
  //             }
  //           });
  //         },
  //       ),
  //     );
  //     chips.add(item);
  //   }
  //   return ListView(
  //     // This next line does the trick.
  //     scrollDirection: Axis.horizontal,
  //     children: chips,
  //   );
  // }
}
