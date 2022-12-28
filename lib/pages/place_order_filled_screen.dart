// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:new_mobile_application/colors.dart';


import 'package:new_mobile_application/home/home_screen.dart';
import 'package:page_transition/page_transition.dart';

class General {
  String label;
  Color color;
  bool isSelected;
  General(this.label, this.color, this.isSelected);
}

class PlaceOrderFilledScreen extends StatefulWidget {
  const PlaceOrderFilledScreen({Key? key}) : super(key: key);

  @override
  State<PlaceOrderFilledScreen> createState() => _PlaceOrderFilledScreenState();
}

class _PlaceOrderFilledScreenState extends State<PlaceOrderFilledScreen> {
  List<General> chipsList = [
    General("Polite", Colors.white, false),
    General("Quick Delivery", Colors.white, false),
    General("Good at Location", Colors.white, false),
    General("Minimal Calling", Colors.white, false),
    General("Package Handling", Colors.white, false),
    General("Followed Instruction", Colors.white, false),
  ];
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Order ID:  437291",
                  style: TextStyle(
                      fontSize: 24,
                      color: firstColor,
                      fontFamily: 'Inter-Bold'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 270,
                  child: Image.asset(
                    "assets/images/order.png",
                    height: 110,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Hurray!",
                  style: TextStyle(fontSize: 14, fontFamily: 'Inter-Bold'),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: "Your package is delivered in ",
                      style: const TextStyle(
                          fontFamily: 'Inter-Bold',
                          fontSize: 14,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: "25 Mins",
                            style: TextStyle(
                                fontFamily: 'Inter-Bold',
                                fontSize: 14,
                                color: firstColor))
                      ]),
                ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Rate this Order",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Inter-Medium'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    RatingBar.builder(
                      itemSize: 27,
                      initialRating: 0,
                      unratedColor: Colors.grey.shade300,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: firstColor,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      "Rate our delivery partner",
                      style:
                          TextStyle(fontSize: 14, fontFamily: 'Inter-Medium'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  spacing: 0,
                  direction: Axis.horizontal,
                  children: techChips(),
                ),
                // SizedBox(
                //   height: 60,
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: techChips(),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "Faced any Problem ? ",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            children: <TextSpan>[
                          TextSpan(
                              text: "Report issue",
                              style: TextStyle(color: firstColor, fontSize: 14))
                        ])),
                  ],
                ),

                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: firstColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 10),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 300),
                          type: PageTransitionType.rightToLeft,
                          child: const HomeScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Close",
                      style: TextStyle(
                        fontSize: 14,fontFamily: 'Inter-Medium'
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> techChips() {
    List<Widget> chips = [];
    for (int i = 0; i < chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          shape: StadiumBorder(
              side: chipsList[i].isSelected == true
                  ? const BorderSide(
                      color: Colors.grey, style: BorderStyle.solid)
                  : BorderSide.none),
          disabledColor: Colors.white,
          // avatar: ,
          avatarBorder: const CircleBorder(side: BorderSide.none),
          showCheckmark: false,
          clipBehavior: Clip.antiAliasWithSaveLayer,
         // elevation: 0,
          label: Container(
            // height: 30,
            // width: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(1)),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Text(chipsList[i].label,
                  style: const TextStyle(
                    fontFamily: 'Inter-Regular',
                    fontSize: 11,
                  )),
            ),
          ),
          labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          selectedColor: firstColor.withOpacity(0.1),
          selected: chipsList[i].isSelected,

          onSelected: (bool value) {
            setState(() {
              chipsList[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  // Widget techChips() {
  //   List<Widget> chips = [];
  //   for (int i = 0; i < chipsList.length; i++) {
  //     Widget item = Padding(
  //       padding: const EdgeInsets.only(left: 3, right: 3),
  //       child: FilterChip(
  //         shape: StadiumBorder(
  //             side: chipsList[i].isSelected == true
  //                 ? const BorderSide(
  //                     color: Colors.grey, style: BorderStyle.solid)
  //                 : BorderSide.none),
  //         disabledColor: Colors.white,
  //         // avatar: ,
  //         avatarBorder: const CircleBorder(side: BorderSide.none),
  //         showCheckmark: false,
  //         clipBehavior: Clip.antiAliasWithSaveLayer,
  //         elevation: 0,
  //         label: Container(
  //           // height: 30,
  //           // width: 50,
  //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),

  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 10),
  //             child: Text(chipsList[i].label),
  //           ),
  //         ),
  //         labelStyle: const TextStyle(color: Colors.black, fontSize: 17),
  //         shadowColor: Colors.black,
  //         backgroundColor: Colors.white,
  //         selectedColor: firstColor.withOpacity(0.1),
  //         selected: chipsList[i].isSelected,
  //         //   shape: const StadiumBorder(side: BorderSide(),),

  //         onSelected: (bool value) {
  //           setState(() {
  //             chipsList[i].isSelected = value;
  //             //     print(_chipsList[i].label);
  //             //    print(_chipsList[i].isSelected);
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
