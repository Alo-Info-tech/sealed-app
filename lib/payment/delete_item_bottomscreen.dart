// ignore: duplicate_ignore
// ignore_for_file: prefer_const_constructors, sort_child_properties_last, depend_on_referenced_packages, file_names, avoid_unnecessary_containers, avoid_returning_null_for_void, unnecessary_const, unused_import

import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/colors.dart';
import 'package:new_mobile_application/profile%20screens/profile_screen.dart';

class DeleteItemBottomSheet extends StatefulWidget {
  const DeleteItemBottomSheet({Key? key}) : super(key: key);

  @override
  State<DeleteItemBottomSheet> createState() => _DeleteItemBottomSheetState();
}

class _DeleteItemBottomSheetState extends State<DeleteItemBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "delete item",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                children: [
                  InkWell(onTap:(){} ,
                    child: Container(
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                           borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
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
                        child: Center(
                            child: Text(
                          "Cancel",
                          style: TextStyle(color: firstColor, fontSize: 18),
                        ))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(onTap: () {
                    
                  },
                    child: Container(
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(
                                  0.2, 3), // changes position of shadow
                            ),
                          ],
                          color: firstColor,
                        ),
                        child: Center(
                            child: Text(
                          "Confirm",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
