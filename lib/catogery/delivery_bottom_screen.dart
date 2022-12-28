// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/catogery/add_address_screen.dart';
import 'package:new_mobile_application/catogery/banking_service_screen.dart';
import 'package:new_mobile_application/catogery/essential_items_screen.dart';
import 'package:new_mobile_application/catogery/medical_report_screen.dart';
import 'package:new_mobile_application/catogery/notary_screen.dart';
import 'package:new_mobile_application/catogery/place_order_screen.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/controller/address_controler.dart';
import 'package:new_mobile_application/controller/select_address_controller.dart';
import 'package:new_mobile_application/payment/cart_screen.dart';
import 'package:new_mobile_application/utlities/const.dart';

import '../profile screens/updat_address_screen.dart';

class DeliveryBottomSheet extends StatefulWidget {
  final bool? isBanking;
  final bool? isNotary;
  final bool? isCart;
  final bool? isMedical;
  final bool? isEssential;
  const DeliveryBottomSheet(
      {Key? key,
      this.isCart = false,
      this.isNotary = false,
      this.isMedical = false,
      this.isBanking = false,
      this.isEssential})
      : super(key: key);

  @override
  State<DeliveryBottomSheet> createState() => _DeliveryBottomSheetState();
}

class _DeliveryBottomSheetState extends State<DeliveryBottomSheet> {
  final AddressListController addressListController =
      Get.put(AddressListController());
  @override
  // void initState() {
  //   addressListController.
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.3,
      child: Obx(() {
        if (addressListController.isLoading.isTrue) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        {
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        print(delilat);
                        print(delilng);
                        print(picklat);
                        print(picklng);
                      },
                      child: Text(
                        " Selected Address",
                        style: TextStyle(
                            fontSize: 16, fontFamily: 'Inter-SemiBold'),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.cancel_outlined))
                  ],
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: Colors.grey.shade400,
                  thickness: 1,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddAddressScreen()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: firstColor,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Add Address",
                          style: TextStyle(
                              fontFamily: 'Inter-Medium',
                              fontSize: 12,
                              color: firstColor),
                        ),
                      ],
                    )),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: Colors.grey.shade400,
                  thickness: 1,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddAddressScreen()));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.location_on,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Saved Address",
                          style: TextStyle(
                            fontFamily: 'Inter-Medium',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )),
                GetBuilder<SelectAddressController>(
                    init: SelectAddressController(),
                    builder: (selectAddressController) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 1.75,
                        child: ListView.builder(
                            itemCount:
                                addressListController.DonationList.isEmpty
                                    ? 0
                                    : addressListController.DonationList.length,
                            itemBuilder: (context, index) {
                              final data =
                                  addressListController.DonationList[index];
                              return InkWell(
                                onTap: () {
                                  if (widget.isCart == true) {
                                    //  Get.to(PlaceOrderScreen());
                                    print(
                                        "${data.addresLine.toString()},${data.city.toString()}, ${data.district.toString()},${data.country.toString()}");
                                    deliverAddress =
                                        "${data.addresLine.toString()},${data.landmark.toString()},,${data.city.toString()}.";
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => CartScreen()));
                                  } else if (widget.isEssential == true) {
                                    selectAddressController.essentialdelivery(
                                        '${data.addresLine.toString()},${data.landmark.toString()},${data.city.toString()}');
                                    //   essentialdelilat = double.parse(data.state.toString());
                                    // essentialdelilng = double.parse(data.country.toString());
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                EssentialItemsScreen()));
                                    delilat =
                                        double.parse(data.state.toString());
                                    delilng =
                                        double.parse(data.country.toString());
                                  } else if (widget.isBanking == true) {
                                    selectAddressController.bankdeliveryy(
                                        '${data.addresLine.toString()},${data.landmark.toString()},${data.city.toString()}');
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                BankingServicesScreen()));
                                    delilat =
                                        double.parse(data.state.toString());
                                    delilng =
                                        double.parse(data.country.toString());
                                  } else if (widget.isNotary == true) {
                                    print(
                                        "${data.addresLine.toString()},${data.city.toString()}, ${data.district.toString()},${data.country.toString()}");
                                    selectAddressController.notarydelivery(
                                        '${data.addresLine.toString()},${data.landmark.toString()},${data.city.toString()}');
                                    // notarydelivery =
                                    //     "${data.addresLine.toString()},${data.landmark.toString()},,${data.city.toString()}.";
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => NotaryScreen()));
                                  } else if (widget.isMedical == true) {
                                    print(
                                        "${data.addresLine.toString()},${data.city.toString()}, ${data.district.toString()},${data.country.toString()}");
                                    selectAddressController.medicaldelivery(
                                        '${data.addresLine.toString()},${data.landmark.toString()},${data.city.toString()}');
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                MedicalReportScreen()));
                                    delilat =
                                        double.parse(data.state.toString());
                                    delilng =
                                        double.parse(data.country.toString());
                                  } else {
                                    selectAddressController.placedelivery(
                                        '${data.addresLine.toString()},${data.landmark.toString()},${data.city.toString()}');
                                    //   Get.back();
                                    print(
                                        "${data.addresLine.toString()},${data.city.toString()}, ${data.district.toString()},${data.country.toString()}");
                                    //   placeorderdelivery =  "${data.addresLine.toString()},${data.landmark.toString()},${data.city.toString()}.";
                                    // selectAddressController.placeorderdelivery =
                                    //     "${data.addresLine.toString()},${data.landmark.toString()},${data.city.toString()}.";

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                PlaceOrderScreen()));

                                    setState(() {
                                      delilat =
                                          double.parse(data.state.toString());
                                      delilng =
                                          double.parse(data.country.toString());
                                      // picklat = double.parse(data.state.toString());
                                      // picklng = double.parse(data.country.toString());
                                    });
                                    // selectAddressController
                                    //     .pickLtatong(delilat);
                                  }
                                },
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              5.5,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.5,
                                                        child: Text(
                                                          data.addresLine
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                                            landmark: data
                                                                .landmark
                                                                .toString(),
                                                            city: data.city
                                                                .toString(),
                                                            state: data.city
                                                                .toString(),
                                                            pincode: data
                                                                .pincode
                                                                .toString(),
                                                            country: data
                                                                .country
                                                                .toString(),
                                                          ));
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              7.5,
                                          width: 10,
                                        ))
                                  ],
                                ),
                              );
                            }),
                      );
                    }),
              ],
            ),
          ));
        }
      }),
    );
  }
}
