// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_mobile_application/catogery/add_address_screen.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/controller/address_controler.dart';
import 'package:new_mobile_application/profile%20screens/updat_address_screen.dart';

class ManageAddressScreen extends StatefulWidget {
  const ManageAddressScreen({Key? key}) : super(key: key);

  @override
  State<ManageAddressScreen> createState() => _ManageAddressScreenState();
}

class _ManageAddressScreenState extends State<ManageAddressScreen> {
  final AddressListController addressListController =
      Get.put(AddressListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: thirdColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        foregroundColor: firstColor,
        title: Text(
          "Manage Address ",
          style: TextStyle(color: firstColor),
        ),
      ),
      body: Obx(() {
        if (addressListController.isLoading.isTrue) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        {
          return SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(
                              0.2, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        //controller: addressLine,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: " Search Address",
                            suffixIcon: Icon(Icons.search),
                            hintStyle: TextStyle(color: Colors.grey.shade300)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1,
                  child: ListView.builder(
                      itemCount: addressListController.DonationList.isEmpty
                          ? 0
                          : addressListController.DonationList.length,
                      itemBuilder: (context, index) {
                        final data = addressListController.DonationList[index];
                        return Dismissible(
                          key: Key(addressListController.DonationList.length
                              .toString()),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (direction) {
                            setState(() {
                              addressListController.DonationList.removeAt(
                                  index);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5.5,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 4,
                                            offset: const Offset(0.2,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.5,
                                                    child: Text(
                                                      data.addresLine
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(Icons.edit),
                                                    onPressed: () {
                                                      Get.to(
                                                          UpdateAddressScreen(
                                                        addreline: data
                                                            .addresLine
                                                            .toString(),
                                                        landmark: data.landmark
                                                            .toString(),
                                                        city: data.city
                                                            .toString(),
                                                        state: data.city
                                                            .toString(),
                                                        pincode: data.pincode
                                                            .toString(),
                                                        country: data.country
                                                            .toString(),
                                                      ));
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Wrap(
                                              children: [
                                                Text(
                                                    "${data.addresLine.toString()}, ${data.landmark.toString()}, ${data.city.toString()}"),
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                Positioned(
                                    right: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5.5,
                                      width: 10,
                                    ))
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ));
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: firstColor,
        onPressed: () {
          Get.to(AddAddressScreen());
        },

        // tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
