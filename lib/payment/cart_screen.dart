// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/catogery/delivery_bottom_screen.dart';
import 'package:new_mobile_application/catogery/document_bottom.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/controller/add_to_cart_controller.dart';
import 'package:new_mobile_application/model/add_to_cart_model.dart';
import 'package:new_mobile_application/pages/payment_method_screen.dart';
import 'package:new_mobile_application/payment/cart_list_builder.dart';
import 'package:new_mobile_application/profile%20screens/profile_screen.dart';
import 'package:new_mobile_application/utlities/const.dart';
//import 'package:intl_phone_field/intl_phone_field.dart';
//import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final AddToCartController cartListController = Get.put(AddToCartController());

  bool isAddress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: thirdColor,
        elevation: 1,
        title: Text(
          "Cart",
          style: TextStyle(color: firstColor),
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
      body: Obx(() {
        if (cartListController.isLOading.isTrue) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / .15,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: cartListController
                                        .DonationList.isEmpty
                                    ? 0
                                    : cartListController.DonationList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final data =
                                      cartListController.DonationList[index];
                                  return data.id.toString() != "AddToCart0"
                                      ? Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                spreadRadius: 2,
                                                blurRadius: 4,
                                                offset: const Offset(0.2,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      "assets/images/stamb.png"),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            data.document
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            width: 70,
                                                          ),
                                                          Text(
                                                            "\u{20B9} ${data.payment.toString()}",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(data.rename
                                                          .toString()),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Quantity : ${data.count.toString()}",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 90.0),
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          documentEditBottomSheet(
                                                              context,
                                                              cartListController
                                                                  .DonationList,
                                                              index);
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        25,
                                                                    vertical:
                                                                        10),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                primary:
                                                                    firstColor),
                                                        child:
                                                            const Text("Edit")),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        cartListController
                                                            .deleteCart(
                                                                id: data.id
                                                                    .toString(),
                                                                title: data
                                                                    .title
                                                                    .toString(),
                                                                subTitle: data
                                                                    .subTitle
                                                                    .toString(),
                                                                description: data
                                                                    .description
                                                                    .toString(),
                                                                count: data.count
                                                                    .toString(),
                                                                payment: data
                                                                    .payment
                                                                    .toString(),
                                                                name: data
                                                                    .name
                                                                    .toString(),
                                                                documnet: data
                                                                    .document
                                                                    .toString());

                                                        //   deleteItemBottomSheet(context);
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 8),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              primary:
                                                                  Colors.white),
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: firstColor,
                                                      )),
                                                ],
                                              ),
                                              Divider(
                                                indent: 10,
                                                endIndent: 10,
                                                color: Colors.grey.shade400,
                                                thickness: 1,
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container();
                                  // return const CartListView();
                                })),
                        Container(
                          height: 400,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "Billing Details",
                                  style: TextStyle(
                                      color: firstColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 10, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Cost"),
                                    SizedBox(
                                      width: 30,
                                      child: Text(
                                        "200",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 10, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Delivery Charge"),
                                    SizedBox(
                                      width: 30,
                                      child: Text(
                                        "50",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                endIndent: 10,
                                indent: 10,
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, bottom: 20, right: 20),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          width: 30,
                                          child: Text(
                                            "250",
                                            style: TextStyle(
                                                color: firstColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ])),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Delivery Address",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: firstColor),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        deliveryAddressBottomSheet(context);
                                        // setState(() {
                                        //   isAddress = true;
                                        // });
                                      },
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          primary: firstColor),
                                      child: Text("Add Address"),
                                    )
                                  ],
                                ),
                              ),
                              deliverAddress == ""
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Text(deliverAddress),
                                    )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 1,
                    child: Container(
                      color: Colors.white,
                      child: SizedBox(
                        //   color: Colors.white,
                        height: 145,
                        width: MediaQuery.of(context).size.width / 1,
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
                                      Text(
                                        'Estimated time to deliver',
                                        style: TextStyle(
                                            color: firstColor, fontSize: 13),
                                      ),
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
                                        'Sealed Office',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        '45 min',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '170/- plus Taxes',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PaymentMethodScreen()));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 45,
                                                      vertical: 7),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
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
                    ))
              ],
            ),
          );
          // return FutureBuilder(
          //     future: cartListController.get(),
          //     builder: (context, snapshot) {
          //       return Column(
          //         children: [
          //           SizedBox(
          //             height: 10,
          //           ),
          //           Container(
          //             decoration: BoxDecoration(
          //               borderRadius: const BorderRadius.all(
          //                 Radius.circular(10),
          //               ),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.grey.withOpacity(0.1),
          //                   spreadRadius: 2,
          //                   blurRadius: 4,
          //                   offset: const Offset(
          //                       0.2, 3), // changes position of shadow
          //                 ),
          //               ],
          //               color: Colors.white,
          //             ),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 SizedBox(
          //                   height:
          //                       MediaQuery.of(context).size.height / .15,
          //                   child: Padding(
          //                       padding: const EdgeInsets.all(10.0),
          //                       child: ListView.builder(

          //                           //   shrinkWrap: true,
          //                           itemCount: cartListController
          //                                   .DonationList.isEmpty
          //                               ? 0
          //                               : cartListController
          //                                   .DonationList.length,
          //                           itemBuilder:
          //                               (BuildContext context, int index) {
          //                             final data = cartListController
          //                                 .DonationList[index];
          //                             return Container(
          //                               decoration: BoxDecoration(
          //                                 borderRadius:
          //                                     const BorderRadius.all(
          //                                   Radius.circular(10),
          //                                 ),
          //                                 boxShadow: [
          //                                   BoxShadow(
          //                                     color: Colors.grey
          //                                         .withOpacity(0.1),
          //                                     spreadRadius: 2,
          //                                     blurRadius: 4,
          //                                     offset: const Offset(0.2,
          //                                         3), // changes position of shadow
          //                                   ),
          //                                 ],
          //                                 color: Colors.white,
          //                               ),
          //                               child: Column(
          //                                 children: [
          //                                   Row(
          //                                     children: [
          //                                       Image.asset(
          //                                           "assets/images/stamb.png"),
          //                                       Column(
          //                                         crossAxisAlignment:
          //                                             CrossAxisAlignment
          //                                                 .start,
          //                                         mainAxisAlignment:
          //                                             MainAxisAlignment
          //                                                 .start,
          //                                         children: [
          //                                           Row(
          //                                             children: [
          //                                               Text(
          //                                                 data.document
          //                                                     .toString(),
          //                                                 style: TextStyle(
          //                                                     fontWeight:
          //                                                         FontWeight
          //                                                             .bold),
          //                                               ),
          //                                               SizedBox(
          //                                                 width: 70,
          //                                               ),
          //                                               Text(
          //                                                 "\u{20B9} ${data.payment.toString()}",
          //                                                 style: TextStyle(
          //                                                   fontWeight:
          //                                                       FontWeight
          //                                                           .bold,
          //                                                 ),
          //                                               ),
          //                                             ],
          //                                           ),
          //                                           const SizedBox(
          //                                             height: 5,
          //                                           ),
          //                                           Text(data.name
          //                                               .toString()),
          //                                           const SizedBox(
          //                                             height: 5,
          //                                           ),
          //                                           Text(
          //                                             "Quantity : ${data.count.toString()}",
          //                                             style: TextStyle(
          //                                                 color:
          //                                                     Colors.black,
          //                                                 fontWeight:
          //                                                     FontWeight
          //                                                         .bold),
          //                                           ),
          //                                         ],
          //                                       ),
          //                                     ],
          //                                   ),
          //                                   Row(
          //                                     children: [
          //                                       Padding(
          //                                         padding:
          //                                             const EdgeInsets.only(
          //                                                 left: 90.0),
          //                                         child: ElevatedButton(
          //                                             onPressed: () {
          //                                               //  documentEditBottomSheet(context);
          //                                             },
          //                                             style: ElevatedButton
          //                                                 .styleFrom(
          //                                                     padding: const EdgeInsets
          //                                                             .symmetric(
          //                                                         horizontal:
          //                                                             25,
          //                                                         vertical:
          //                                                             10),
          //                                                     shape:
          //                                                         RoundedRectangleBorder(
          //                                                       borderRadius:
          //                                                           BorderRadius.circular(
          //                                                               10.0),
          //                                                     ),
          //                                                     primary:
          //                                                         firstColor),
          //                                             child: const Text(
          //                                                 "Edit")),
          //                                       ),
          //                                       const SizedBox(
          //                                         width: 10,
          //                                       ),
          //                                       ElevatedButton(
          //                                           onPressed: () {
          //                                             //   deleteItemBottomSheet(context);
          //                                           },
          //                                           style: ElevatedButton
          //                                               .styleFrom(
          //                                                   padding: const EdgeInsets
          //                                                           .symmetric(
          //                                                       horizontal:
          //                                                           10,
          //                                                       vertical:
          //                                                           8),
          //                                                   shape:
          //                                                       RoundedRectangleBorder(
          //                                                     borderRadius:
          //                                                         BorderRadius
          //                                                             .circular(
          //                                                                 10.0),
          //                                                   ),
          //                                                   primary: Colors
          //                                                       .white),
          //                                           child: Icon(
          //                                             Icons.delete,
          //                                             color: firstColor,
          //                                           )),
          //                                     ],
          //                                   ),
          //                                   Divider(
          //                                     indent: 10,
          //                                     endIndent: 10,
          //                                     color: Colors.grey.shade400,
          //                                     thickness: 1,
          //                                   ),
          //                                 ],
          //                               ),
          //                             );
          //                             //  return const CartListView();
          //                           })),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.only(left: 20.0),
          //                   child: Text(
          //                     "Billing Details",
          //                     style: TextStyle(
          //                         color: firstColor,
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 15),
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.only(left: 20.0, top: 10),
          //                   child: Row(
          //                     children: const [
          //                       Text("Cost"),
          //                       SizedBox(
          //                         width: 250,
          //                       ),
          //                       Text(
          //                         "200",
          //                         style: TextStyle(
          //                             fontWeight: FontWeight.bold),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.only(left: 20.0, top: 10),
          //                   child: Row(
          //                     children: const [
          //                       Text("Delivery Charge"),
          //                       SizedBox(
          //                         width: 196,
          //                       ),
          //                       Text(
          //                         "50",
          //                         style: TextStyle(
          //                             fontWeight: FontWeight.bold),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 10,
          //                 ),
          //                 Divider(
          //                   endIndent: 10,
          //                   indent: 10,
          //                   color: Colors.grey,
          //                   thickness: 1,
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.only(
          //                       left: 20.0, bottom: 20),
          //                   child: Row(
          //                     children: [
          //                       Text(
          //                         "Total",
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: 15),
          //                       ),
          //                       SizedBox(
          //                         width: 245,
          //                       ),
          //                       Text(
          //                         "250",
          //                         style: TextStyle(
          //                             color: firstColor,
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: 15),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           Container(
          //             decoration: BoxDecoration(
          //               borderRadius: const BorderRadius.all(
          //                 Radius.circular(10),
          //               ),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.grey.withOpacity(0.1),
          //                   spreadRadius: 2,
          //                   blurRadius: 4,
          //                   offset: const Offset(
          //                       0.2, 3), // changes position of shadow
          //                 ),
          //               ],
          //               color: Colors.white,
          //             ),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.only(left: 20.0, top: 20),
          //                   child: Row(
          //                     children: [
          //                       Text(
          //                         "Delivery Address",
          //                         style: TextStyle(
          //                             fontWeight: FontWeight.bold,
          //                             color: firstColor),
          //                       ),
          //                       SizedBox(width: 150),
          //                       Text(
          //                         "CHANGE",
          //                         style: TextStyle(
          //                             color: firstColor,
          //                             fontWeight: FontWeight.bold),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.only(left: 20.0, top: 10),
          //                   child: Text(
          //                     "Sealed Office",
          //                     style: TextStyle(fontWeight: FontWeight.bold),
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.only(
          //                       left: 20.0, top: 10, bottom: 20),
          //                   child: Text(
          //                       "254 pahgftyfhvgyfgd High road,oop Saravana \nStores, chennai-600004"),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Text(""),
          //           SizedBox(
          //             height: 200,
          //           )
          //         ],
          //       );
          //     });
        }
      }),
    );
  }

  Future<dynamic> documentEditBottomSheet(
      BuildContext context, List<AddToCartModel>? data, int index) {
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
        return DocumentBottomSheet(
          isUpdate: true,
          data: data,
          index: index,
        );
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
          isCart: true,
        );
      },
    );
  }
}
