// ignore: duplicate_ignore
// ignore_for_file: prefer_const_constructors, sort_child_properties_last, depend_on_referenced_packages, file_names, avoid_unnecessary_containers, avoid_returning_null_for_void, unnecessary_const, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:new_mobile_application/colors.dart';


import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/controller/add_to_cart_controller.dart';
import 'package:new_mobile_application/model/add_to_cart_model.dart';
import 'package:new_mobile_application/profile%20screens/profile_screen.dart';

import '../payment/cart_screen.dart';
import '../widgets/otp_text_form.dart';

class DocumentBottomSheet extends StatefulWidget {
  final bool? isUpdate;
  final String? text;
  final List<AddToCartModel>? data;
  final int? index;
  const DocumentBottomSheet(
      {Key? key, this.text, this.isUpdate = false, this.data, this.index})
      : super(key: key);

  @override
  State<DocumentBottomSheet> createState() => _DocumentBottomSheetState();
}

class _DocumentBottomSheetState extends State<DocumentBottomSheet> {
  @override
  late String? title;
  late String? text;
  TextEditingController name = TextEditingController();
  TextEditingController documentname = TextEditingController();
  TextEditingController reentername = TextEditingController();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  void initState() {
    widget.isUpdate == true
        ? print(widget.data![widget.index!].count)
        : print("data");
    widget.isUpdate == true
        ? name = TextEditingController(
            text: widget.data![widget.index!].name.toString())
        : null;
    widget.isUpdate == true
        ? documentname = TextEditingController(
            text: widget.data![widget.index!].document.toString())
        : null;
    widget.isUpdate == true
        ? reentername = TextEditingController(
            text: widget.data![widget.index!].rename.toString())
        : null;
    widget.isUpdate == true
        ? _counter = int.parse(widget.data![widget.index!].count.toString())
        : null;
    widget.isUpdate == true
        ? value = int.parse(widget.data![widget.index!].payment.toString())
        : null;
    super.initState();
  }

  Color primaryColor = Colors.grey;
  int _counter = 1;
  int value = 0;
  CollectionReference ref = FirebaseFirestore.instance.collection('sealed');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        child: Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "  Document Details",
                      style: const TextStyle(
                          fontFamily: 'Inter-SemiBold,',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                         // Get.to(CartScreen());
                           Navigator.pop(context);
                        },
                        icon: const Icon(MdiIcons.closeCircleOutline)),
                  ],
                ),

                // ignore: sized_box_for_whitespace
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/stamb.png",
                        height: 110,
                        width: 100,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.text.toString(),
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter-SemiBold'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Stamp paper 100",
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'Inter-Medium'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Text(
                  "Name on the document",
                  style: TextStyle(
                      fontSize: 12,
                      color: firstColor,
                      fontFamily: 'Inter-SemiBold'),
                ),
                TextFormField(
                  controller: documentname,
                  validator: (validator) {
                    if (validator!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(validator)) {
                      return "Enter correct name";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter the name to be add in the document',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade300,
                          fontFamily: 'Inter-Regular',
                          fontSize: 12)),
                ),
                const SizedBox(
                  height: 15,
                ),

                Text(
                  "Re enter the name",
                  style: TextStyle(
                      fontSize: 12,
                      color: firstColor,
                      fontFamily: 'Inter-SemiBold'),
                ),
                TextFormField(
                  controller: reentername,
                  validator: (validator) {
                    if (validator!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(validator)) {
                      return "Enter correct name";
                    } else {
                      if (validator != documentname.text) {
                        return ' Entered name is mismatched';
                      }
                    }
                  },
                  onChanged: (val) {
                    setState(() {
                      primaryColor = val.isNotEmpty ? firstColor : Colors.grey;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'verify the name to be add in the document',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade300,
                          fontFamily: 'Inter-Regular',
                          fontSize: 12)),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "No.of Papers",
                      style: TextStyle(
                          color: firstColor,
                          fontFamily: 'Inter-SemiBold',
                          fontSize: 12),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: FittedBox(
                          child: Row(
                            children: [
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (_counter != 0) {
                                        return setState(() {
                                          _counter--;
                                          value = 100 * _counter;
                                        });
                                      } else {
                                        return null;
                                      }
                                    });
                                  },
                                  child: FittedBox(
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: firstColor),
                                    ),
                                  ),
                                ),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: firstColor),
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                '$_counter',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Inter-Medium',
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _counter++;
                                      value = 100 * _counter;
                                    });
                                  },
                                  child: FittedBox(
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: firstColor),
                                    ),
                                  ),
                                ),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: firstColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 10,
                ),
                widget.isUpdate == true
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12, bottom: 8),
                          child: ElevatedButton(
                              onPressed: () async {
                                // ref.add({
                                //   'documentname': documentname.text,
                                //    'reentername': reentername.text,
                                // }).whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen())));
                                // _form.currentState!.validate();

                                AddToCartController().updateCart(
                                    id: widget.data![widget.index!].id
                                        .toString(),
                                    name: name.text,
                                    rename: reentername.text,
                                    count: _counter.toString(),
                                    payment: value.toString(),
                                    documnet: documentname.text);
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 17),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  primary: primaryColor),
                              child: const Text("Update Cart")),
                        ),
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12, bottom: 8),
                          child: ElevatedButton(
                              onPressed: () async {
                                // ref.add({
                                //   'documentname': documentname.text,
                                //    'reentername': reentername.text,
                                // }).whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen())));
                                // _form.currentState!.validate();
                                print(value);
                                if (_form.currentState!.validate()) {
                                  ref.add({
                                    'documentname': documentname.text,
                                    'reentername': reentername.text,
                                  }).whenComplete(() => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CartScreen())));

                                  AddToCartController().addCart(
                                      name: name.text,
                                      rename: reentername.text,
                                      count: _counter.toString(),
                                      payment: value.toString(),
                                      documnet: documentname.text);
                                  print(value);

                                  AddToCartController().addCart(
                                      name: name.text,
                                      rename: reentername.text,
                                      count: _counter.toString(),
                                      payment: value.toString(),
                                      documnet: documentname.text);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 17),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  primary: primaryColor),
                              child: const Text(
                                "Add to Cart",
                                style: TextStyle(
                                    fontFamily: "Inter-Medium", fontSize: 14),
                              )),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
