// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/pages/payment_success_screen.dart';
import 'package:new_mobile_application/profile%20screens/profile_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentMethodScreen extends StatefulWidget {
  final String? payment;
  const PaymentMethodScreen({Key? key, this.payment}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final _razorpay = Razorpay();
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);

    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);

    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.initState();
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("payment done");
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("payment fail");
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: thirdColor,
        elevation: 1,
        title: Text(
          "Payment",
          style: TextStyle(
              color: firstColor, fontFamily: 'Inter-Regular', fontSize: 18),
        ),
        automaticallyImplyLeading: true,
        foregroundColor: firstColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProfileScreen()));
              },
              icon: Icon(
                MdiIcons.emoticonOutline,
                color: firstColor,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: const BorderRadius.all(
              //       Radius.circular(10),
              //     ),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.withOpacity(0.1),
              //         spreadRadius: 2,
              //         blurRadius: 4,
              //         offset:
              //             const Offset(0.2, 3), // changes position of shadow
              //       ),
              //     ],
              //     color: Colors.white,
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(20.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           "UPI",
              //           style:
              //               TextStyle(fontFamily: 'Inter-Medium', fontSize: 13),
              //         ),
              //         SizedBox(
              //           height: 5,
              //         ),
              //         Divider(
              //           indent: 2,
              //           endIndent: 2,
              //           thickness: 1,
              //           color: Colors.grey.shade400,
              //         ),
              //         SizedBox(
              //           height: 10,
              //         ),
              //         Column(
              //           children: [
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Row(
              //                   children: [
              //                     Image.asset(
              //                       "assets/images/gpay.png",
              //                       height: 30,
              //                     ),
              //                     SizedBox(
              //                       width: 10,
              //                     ),
              //                     Text(
              //                       "Gpay",
              //                       style: TextStyle(fontSize: 14,fontFamily: 'Inter-Regular'),
              //                     ),
              //                   ],
              //                 ),
              //                 Checkbox(
              //                     //activeColor: firstColor,
              //                     value: check1,
              //                     onChanged: (value) {
              //                       setState(() {
              //                         check1 = value!;
              //                       });
              //                     }),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 10,
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Row(
              //                   children: [
              //                     Image.asset("assets/images/phonepe.png",
              //                         height: 30),
              //                     SizedBox(
              //                       width: 10,
              //                     ),
              //                     Text(
              //                       "Phone pe",
              //                       style: TextStyle(fontSize: 14,fontFamily: 'Inter-Regular'),
              //                     ),
              //                   ],
              //                 ),
              //                 Checkbox(
              //                     //activeColor: firstColor,
              //                     value: check2,
              //                     onChanged: (value) {
              //                       setState(() {
              //                         check2 = value!;
              //                       });
              //                     }),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 10,
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Row(
              //                   children: [
              //                     Image.asset("assets/images/bhim.png",
              //                         height: 30),
              //                     SizedBox(
              //                       width: 10,
              //                     ),
              //                     Text(
              //                       "BHIM UPI",
              //                       style: TextStyle(fontSize: 14,fontFamily: 'Inter-Regular'),
              //                     ),
              //                   ],
              //                 ),
              //                 Checkbox(
              //                     //activeColor: firstColor,
              //                     value: check3,
              //                     onChanged: (value) {
              //                       setState(() {
              //                         check3 = value!;
              //                       });
              //                     }),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 10,
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Row(
              //                   children: [
              //                     Image.asset("assets/images/paytm.png",
              //                         height: 30),
              //                     SizedBox(
              //                       width: 10,
              //                     ),
              //                     Text(
              //                       "Paytm",
              //                       style: TextStyle(fontSize: 14,fontFamily: 'Inter-Regular'),
              //                     ),
              //                   ],
              //                 ),
              //                 Checkbox(
              //                     //activeColor: firstColor,
              //                     value: check4,
              //                     onChanged: (value) {
              //                       setState(() {
              //                         check4 = value!;
              //                       });
              //                     }),
              //               ],
              //             ),
              //           ],
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              InkWell(
                onTap: () {
                  var options = {
                    'key': 'rzp_test_mmrgJpgGy311r3',
                    'amount': 100,
                    'name': 'sealed',
                    'description': 'payments',
                    'prefill': {
                      'contact': '7339668890',
                      'email': 'test@razorpay.com'
                    }
                  };
                  _razorpay.open(options);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset:
                            const Offset(0.2, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/cardupi.png",
                          height: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Payments",
                              style: TextStyle(
                                  fontSize: 14, fontFamily: 'Inter-SemiBold'),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "(UPI, Cards, Wallets, NetBanking) ",
                              style: TextStyle(
                                  fontFamily: "Inter-Regular", fontSize: 13),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  // var options = {
                  //   'key': 'rzp_test_mmrgJpgGy311r3',
                  //   'amount': 100,
                  //   'name': 'sealed',
                  //   'description': 'payments',
                  //   'prefill': {
                  //     'contact': '7339668890',
                  //     'email': 'test@razorpay.com'
                  //   }
                  // };
                  // _razorpay.open(options);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              "Do you want to continue this payment"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("NO")),
                            TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0)),
                                            ),
                                            content: Builder(
                                              builder: (context) {
                                                return SizedBox(
                                                  height: 200,
                                                  width: double.infinity,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/success.png",
                                                        height: 70,
                                                        width: 70,
                                                      ),
                                                      Text(
                                                          "Order Placed Successfully")
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ));
                                },
                                child: const Text("YES"))
                          ],
                        );
                      });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset:
                            const Offset(0.2, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/circle.png",
                          height: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Cash on PickUp",
                          style: TextStyle(
                              fontSize: 13, fontFamily: 'Inter-Regular'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              "Do you want to continue this payment"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("NO")),
                            TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0)),
                                            ),
                                            content: Builder(
                                              builder: (context) {
                                                return SizedBox(
                                                  height: 200,
                                                  width: double.infinity,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/success.png",
                                                        height: 70,
                                                        width: 70,
                                                      ),
                                                      Text(
                                                          "Order Placed Successfully")
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ));
                                },
                                child: const Text("YES"))
                          ],
                        );
                      });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset:
                            const Offset(0.2, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/circle.png",
                          height: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Cash on Delivery",
                          style: TextStyle(
                              fontSize: 13, fontFamily: 'Inter-Regular'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height / 10,
        width: double.infinity,
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Text(
        //       "\u{20B9} ${widget.payment.toString()}",
        //       style: TextStyle(fontWeight: FontWeight.bold),
        //     ),
        //     // RichText(
        //     //   text: TextSpan(
        //     //     text: 'Rs.170/-',
        //     //     style: TextStyle(
        //     //         fontFamily: "Inter-Bold",
        //     //         fontSize: 16,
        //     //         color: Colors.black),
        //     //     // ignore: prefer_const_literals_to_create_immutables
        //     //     children: <TextSpan>[
        //     //       TextSpan(
        //     //           text: 'Plus Taxes',
        //     //           style: TextStyle(
        //     //             fontFamily: 'Inter-Medium',
        //     //            // fontWeight: FontWeight.bold,
        //     //             fontSize: 9,
        //     //           )),
        //     //     ],
        //     //   ),
        //     // ),
        //     SizedBox(
        //       width: 10,
        //     ),
        //     ElevatedButton(
        //         onPressed: () {
        //           // Navigator.push(
        //           //   context,
        //           //   PageTransition(
        //           //     duration: Duration(milliseconds: 300),
        //           //     type: PageTransitionType.rightToLeft,
        //           //     child: PaymentSuccessfulScreen(),
        //           //   ),
        //           // );
        //           var options = {
        //             'key': 'rzp_test_mmrgJpgGy311r3',
        //             'amount': 100,
        //             'name': 'sealed',
        //             'description': 'payments',
        //             'prefill': {
        //               'contact': '7339668890',
        //               'email': 'test@razorpay.com'
        //             }
        //           };
        //           _razorpay.open(options);
        //         },
        //         style: ElevatedButton.styleFrom(
        //             padding:
        //                 const EdgeInsets.symmetric(horizontal: 45, vertical: 7),
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(5),
        //             ),
        //             primary: firstColor),
        //         child: Row(
        //           children: const [
        //             Text(
        //               "Pay",
        //               style:
        //                   TextStyle(fontFamily: 'Inter-SemiBold', fontSize: 14),
        //             ),
        //             SizedBox(
        //               width: 10,
        //             ),
        //             Icon(Icons.arrow_forward)
        //           ],
        //         ))
        //   ],
        // ),
      ),
    );
  }
}
