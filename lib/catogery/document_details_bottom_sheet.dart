// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, prefer_const_constructors, unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:new_mobile_application/catogery/place_order_screen.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/utlities/const.dart';

class ProductTimingModel {
  String title;
  bool value;

  ProductTimingModel({required this.title, this.value = false});
}

class DocumentDetailsBottomSheet extends StatefulWidget {
  const DocumentDetailsBottomSheet({Key? key}) : super(key: key);

  @override
  State<DocumentDetailsBottomSheet> createState() =>
      _DocumentDetailsBottomSheetState();
}

class _DocumentDetailsBottomSheetState
    extends State<DocumentDetailsBottomSheet> {
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;

  final itemsTimings = [
    ProductTimingModel(title: 'Secured Document'),
    ProductTimingModel(title: 'Digital Signature Token'),
    ProductTimingModel(title: 'Signature on Documents'),
    ProductTimingModel(title: 'Digital Drives'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 350,
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0, top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Row(
                children: [
                  const Text(
                    "Document Details",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 160,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(MdiIcons.closeCircleOutline)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(

              //  color: Colors.grey,
              height: 300,
              child:
                  ListView(physics: NeverScrollableScrollPhysics(), children: [
                ...itemsTimings.map(
                  (items) => ListTile(
                    onTap: () => productTimingClicked(items),
                    leading: SizedBox(
                      child: Checkbox(
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                        splashRadius: 0,
                        activeColor: firstColor,
                        value: selectedProductTiming.contains(items.title),
                        onChanged: (value) {
                          setState(() {
                            print(items);
                            productTimingClicked(items);
                          });
                        },
                      ),
                    ),
                    title: Text(
                      items.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ]),

            ),
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 20),
            //       child: Checkbox(
            //           activeColor: firstColor,
            //           value: check1,
            //           onChanged: (value) {
            //             setState(() {
            //               check1 = value!;
            //             });
            //           }),
            //     ),
            //     Text(
            //       'Secured Documents',
            //       style: TextStyle(fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 20),
            //       child: Checkbox(
            //           activeColor: firstColor,
            //           value: check2,

            //           onChanged: (value) {
            //             setState(() {
            //               check2 = value!;
            //             });
            //           },

            //            side: BorderSide(color: Colors.black)),),

            //     Text(
            //       'Digital Signature Token',
            //       style: TextStyle(fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 20),
            //       child: Checkbox(
            //           activeColor: firstColor,
            //           value: check3,
            //           onChanged: (value) {
            //             setState(() {
            //               check3 = value!;
            //             });
            //           }),
            //     ),
            //     Text(
            //       'Signature on Documents',
            //       style: TextStyle(fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 20),
            //       child: Checkbox(
            //           activeColor: firstColor,
            //           value: check4,
            //           onChanged: (value) {
            //             setState(() {
            //               check4 = value!;
            //             });
            //           }),
            //     ),
            //     Text(
            //       'Digital Drives',
            //       style: TextStyle(fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    print(selectedProductTiming);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PlaceOrderScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 105, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: firstColor),
                  child: const Text("Proceed")),
            ),
          ],
        ),
      ),
    );
  }

  productTimingClicked(ProductTimingModel pTimgMdl) {
    setState(() {
      pTimgMdl.value = !pTimgMdl.value;
      print(pTimgMdl.title);
      if (selectedProductTiming.contains(pTimgMdl.title.toString())) {
        selectedProductTiming
            .removeWhere((element) => element == pTimgMdl.title);
        print(selectedProductTiming);
      } else {
        // healthTags.clear();
        selectedProductTiming.add(pTimgMdl.title.toString());

        print(selectedProductTiming);
      }
    });
  }
}
