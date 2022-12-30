// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, sort_child_properties_last, prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:new_mobile_application/catogery/addressbottomsheet.dart';
import 'package:new_mobile_application/catogery/pickaddressbottomsheet.dart';
import 'package:new_mobile_application/catogery/delivery_bottom_screen.dart';
import 'package:new_mobile_application/catogery/document_details_bottom_sheet.dart';
import 'package:new_mobile_application/colors.dart';
import 'package:new_mobile_application/controller/select_address_controller.dart';

import 'package:new_mobile_application/home/home_screen.dart';
import 'package:new_mobile_application/pages/paymentt1.dart';
import 'package:new_mobile_application/profile%20screens/profile_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/profile%20screens/terms_conditions.dart';
import 'package:new_mobile_application/utlities/const.dart';
import 'package:page_transition/page_transition.dart';

class Instruction {
  String label;
  Color color;
  bool isSelected;
  Instruction(this.label, this.color, this.isSelected);
}

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({Key? key}) : super(key: key);

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  List<Instruction> chipsList = [
    Instruction("Don't ring the bell", Colors.white, false),
    Instruction("Drop at neighbours house", Colors.white, false),
    Instruction("Call once reached", Colors.white, false),
    Instruction("Collect items", Colors.white, false),
  ];
  bool status = false;

  bool isOnWay = true;
  List instruction = [];
  // TextEditingController instructioncontroller = TextEditingController();

  // @override
  // void initState() {
  //   showMyDialog();
  //   super.initState();
  // }
  SelectAddressController selectController = Get.put(SelectAddressController());

  @override
  void initState() {
    super.initState();

    delilat == picklat
        ? Future.delayed(Duration.zero, () {
            showMyDialog();
          })
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Get.off(() => const HomeScreen());

          return Future.value(false);
        },
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: thirdColor,
            elevation: 1,
            title: InkWell(
              onTap: () {
                print(picklat);
                print(picklng);
                print(delilat);
                print(delilng);
              },
              child: Text(
                "Place Order ",
                style: TextStyle(
                    fontFamily: 'Inter-Regular',
                    fontSize: 18,
                    color: firstColor),
              ),
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
          body: SingleChildScrollView(
            child: SafeArea(
                child: GetBuilder<SelectAddressController>(
                    init: SelectAddressController(),
                    builder: (selectAddressController) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                child: selectController.placeorderpickup
                                            .toString() ==
                                        ""
                                    ? Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text(
                                          "Home(Default Address)",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 14),
                                        ))
                                    : Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text(
                                          selectAddressController
                                              .placeorderpickup
                                              .toString(),
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
                                //showMyDialog();
                                deliveryAddressBottomSheet(context);
                                //  defaultAddressBottomSheet(context);
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(color: firstColor),
                                    borderRadius: BorderRadius.circular(10)),
                                child: selectAddressController
                                            .placeorderdelivery
                                            .toString() ==
                                        ""
                                    ? Text(
                                        '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 14),
                                      )
                                    : validation(selectAddressController),

                                // child: placeorderdelivery.toString() == ""
                                //     ? Text("")
                                //     : placeorderdelivery.toString(),
                              ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        isOnWay = true;
                                      });
                                      //_formKey.currentState?.validate();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        // padding: const EdgeInsets.symmetric(
                                        //     horizontal: 40, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: firstColor, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        primary: isOnWay == false
                                            ? Colors.white
                                            : firstColor),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        "One Way",
                                        style: TextStyle(
                                            fontFamily: 'Inter-Medium',
                                            fontSize: 14,
                                            color: isOnWay == true
                                                ? Colors.white
                                                : firstColor),
                                      ),
                                    )),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        isOnWay = false;
                                      });
                                      //_formKey.currentState?.validate();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        // padding: const EdgeInsets.symmetric(
                                        //     horizontal: 40, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: firstColor, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        primary: isOnWay == true
                                            ? Colors.white
                                            : firstColor),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        "Round Trip",
                                        style: TextStyle(
                                            fontFamily: 'Inter-Medium',
                                            fontSize: 14,
                                            color: isOnWay == true
                                                ? firstColor
                                                : Colors.white),
                                      ),
                                    )),
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
                            const Text(
                              "Types of Documents",
                              style: TextStyle(
                                  fontFamily: 'Inter-SemiBold', fontSize: 14),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () {
                                documentDetailsBottomSheet(context);
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
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        //height: 100,
                                        width: 240,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            //physics: NeverScrollableScrollPhysics(),
                                            itemCount:
                                                selectedProductTiming.length,
                                            itemBuilder: (context, index) {
                                              return Text(
                                                selectedProductTiming[index]+",",
                                              );
                                            }),
                                      ),
                                      Icon(MdiIcons.chevronDown)
                                    ],
                                  ),
                                ),
                              ),
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
                            const Text(
                              "Add instructions",
                              style: TextStyle(
                                  fontFamily: 'Inter-SemiBold', fontSize: 14),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Wrap(
                              spacing: 15,
                              direction: Axis.horizontal,
                              children: techChips(),
                            ),
                            TextField(
                              //controller: instructioncontroller,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Inter-Regular',
                              ),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: firstColor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: firstColor)),
                                  hintText: 'Other instructions',
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade400)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TermsConditions()));
                              },
                              child: RichText(
                                text: TextSpan(
                                  text:
                                      "By confirming your agreeing upon there is no illegal\nsubstance in our package . For further details refer our\n",
                                  style: TextStyle(
                                      fontFamily: "Inter-Regular",
                                      fontSize: 11,
                                      color: Colors.grey.shade500),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'terms and conditions',
                                        style: TextStyle(
                                            fontFamily: 'Inter-Regular',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: firstColor)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            )
                          ],
                        ),
                      );
                    })),
          ),
          bottomSheet: GetBuilder<SelectAddressController>(
              init: SelectAddressController(),
              builder: (selectAddressController) {
                return Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 10,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            print(picklat);
                            print(picklng);
                            print(delilat);
                            print(delilng);
                            if (selectAddressController.placeorderpick
                                    .toString()
                                    .isEmpty ||
                                selectAddressController.placeorderdelivery
                                    .toString()
                                    .isEmpty ||
                                instruction.isEmpty ||
                                selectedProductTiming.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please select all field')),
                              );
                            } else {
                              Navigator.push(
                                context,
                                PageTransition(
                                  duration: Duration(milliseconds: 300),
                                  type: PageTransitionType.rightToLeft,
                                  child: PaymenttScreen(
                                      pickupAddress: selectController
                                          .placeorderpickup
                                          .toString(),
                                      picklat: picklat,
                                      picklng: picklng,
                                      delilat: delilat,
                                      delilng: delilng,
                                      deliveryAddress: selectAddressController
                                          .placeorderdelivery
                                          .toString(),
                                      onOrround: isOnWay == true
                                          ? "One way"
                                          : "Round Trip",
                                      selectedValue: chipsList,
                                      instruction: instruction
                                      //payment: "200",
                                      ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              primary: firstColor),
                          child: Row(
                            children: const [
                              Text(
                                "Next",
                                style: TextStyle(
                                    fontFamily: 'Inter-SemiBold', fontSize: 14),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          ))
                    ],
                  ),
                );
              }),
        ));
  }

  Text validation(SelectAddressController selectAddressController) {
    if (picklat == delilat) {
      return Text("");
    } else {
      return Text(
        selectAddressController.placeorderdelivery.toString(),
        style: TextStyle(fontWeight: FontWeight.w100, fontSize: 14),
      );
    }
  }

  // Future<Widget> validate() async {
  //   return GetBuilder<SelectAddressController>(
  //       init: SelectAddressController(),
  //       builder: (mainController) {
  //         if (picklat == delilat) {
  //           return Text("");
  //         } else {
  //           return Padding(
  //             padding: const EdgeInsets.all(12.0),
  //             child: Text(
  //               '',
  //               //   placeorderdelivery,
  //               overflow: TextOverflow.ellipsis,
  //               style: TextStyle(
  //                   fontWeight: FontWeight.w100,
  //                   fontSize: 14,
  //                   color: Colors.black),
  //             ),
  //           );
  //         }
  //         // return registerController.pressedBool
  //       });
  // }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Invalid Delivery address selected',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'Same address choosen as Pickup and delivery. Please choose a different address for delivery.'),
                //Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(color: firstColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Widget validate() {
  //   if (picklat == delilat) {
  //     return Text("Same Address change");
  //   } else {
  //     return Padding(
  //       padding: const EdgeInsets.all(12.0),
  //       child: Text(
  //         placeorderdelivery,
  //         overflow: TextOverflow.ellipsis,
  //         style: TextStyle(
  //             fontWeight: FontWeight.w100, fontSize: 14, color: Colors.black),
  //       ),
  //     );
  //   }
  // }

  // Widget deliveraddressvalidation() {
  //   if () {
  //     return Text("jvjhvb");
  //   } else {
  //     return Padding(
  //       padding: const EdgeInsets.all(12.0),
  //       child: Text(
  //         placeorderdelivery,
  //         overflow: TextOverflow.ellipsis,
  //         style: TextStyle(fontWeight: FontWeight.w100, fontSize: 14),
  //       ),
  //     );
  //   }
  //   // return  Padding(
  //   //                     padding: const EdgeInsets.all(12.0),
  //   //                     child: Text(
  //   //                       placeorderdelivery,
  //   //                       overflow: TextOverflow.ellipsis,
  //   //                       style: TextStyle(
  //   //                           fontWeight: FontWeight.w100, fontSize: 14),
  //   //                     ),
  //   //                   );
  // }

  Future<dynamic> selectAddressBottomSheet(BuildContext context) {
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
        return AddressEditBottomSheet();
      },
    );
  }

  Future<dynamic> defaultAddressBottomSheet(BuildContext context) {
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
        return PickAddressBottomSheet();
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
        return DeliveryBottomSheet();
      },
    );
  }

  List<Widget> techChips() {
    List<Widget> chips = [];
    for (int i = 0; i < chipsList.length; i++) {
      Widget item = FilterChip(
        shape: StadiumBorder(
            side: chipsList[i].isSelected == true
                ? const BorderSide(color: Colors.grey, style: BorderStyle.solid)
                : BorderSide.none),
        disabledColor: Colors.white,
        // avatar: ,
        //avatarBorder: const CircleBorder(side: BorderSide.none),
        showCheckmark: false,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        //  elevation: 0,
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            chipsList[i].label,
            style: TextStyle(fontFamily: 'Inter-Regular', fontSize: 11),
          ),
        ),

        backgroundColor: Colors.white,
        selectedColor: firstColor.withOpacity(0.1),
        selected: chipsList[i].isSelected,

        onSelected: (bool value) {
          setState(() {
            chipsList[i].isSelected = value;
            print(chipsList[i].label);
            if (chipsList[i].isSelected == true) {
              instruction.add(chipsList[i].label.toString());
              print(instruction);
            } else {
              instruction
                  .removeWhere((element) => element == chipsList[i].label);
              print(instruction);
              print(chipsList[i].label);
            }
          });
        },
      );
      chips.add(item);
    }
    return chips;
  }

  Future<dynamic> documentDetailsBottomSheet(BuildContext context) {
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
        return DocumentDetailsBottomSheet();
      },
    );
  }
}
