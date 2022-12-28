// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Visible extends StatefulWidget {
  const Visible({
    Key? key,
  }) : super(key: key);

  @override
  State<Visible> createState() => _VisibleState();
}

class _VisibleState extends State<Visible> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          child: Container(
            margin: const EdgeInsets.all(0),
            width: double.infinity,
            // height: 130,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(1, 5), // changes position of shadow
                ),
              ],
              //Border.all
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ), //Border.all
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              "Order ID: 54321",
                              style: TextStyle(
                                  fontSize: 14, fontFamily: 'Inter-SemiBold'),
                            ),
                            const Text(
                              "\u{20B9}100",
                              style: TextStyle(
                                  fontSize: 14, fontFamily: 'Inter-SemiBold'),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "15th Dec 2022 at 04.30 PM",
                          style: TextStyle(
                              fontSize: 12, fontFamily: 'Inter-Medium'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                isVisible == false
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "From",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("Home"),
                            const Text(
                                "36/2,4TH avanue,Ashok nagar,Chennai-676767",
                                style: TextStyle(fontSize: 13)),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("To",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Home\n36/2,4TH avanue,Ashok nagar,Chennai-676767",
                              style: TextStyle(fontSize: 13),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Package details",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text("Digital Document")
                              ],
                            ),
                          ],
                        ),
                      ),
                const SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.grey.shade300,
                  indent: 7,
                  endIndent: 7,
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.delivery_dining,
                    ),
                    const Text(
                      "28 min",
                      style:
                          TextStyle(fontSize: 10, fontFamily: 'Inter-Medium'),
                    ),
                    const Icon(MdiIcons.mapMarker),
                    const Text(
                      "4.7 Km",
                      style:
                          TextStyle(fontSize: 10, fontFamily: 'Inter-Medium'),
                    ),
                    RatingBar.builder(
                      itemSize: 15,
                      initialRating: 0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
