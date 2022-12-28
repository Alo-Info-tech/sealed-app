// ignore_for_file: unnecessary_null_comparison, deprecated_member_use, avoid_print, prefer_const_literals_to_create_immutables, unnecessary_const, unused_import, depend_on_referenced_packages, prefer_final_fields, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/catogery/court_fees.dart';
import 'package:new_mobile_application/catogery/document_bottom.dart';
import 'package:new_mobile_application/catogery/non_judicial.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/pastorders/visible.dart';
import 'package:new_mobile_application/widgets/onboarding_content.dart';
import 'package:star_rating/star_rating.dart';

class DocumentsTab2 extends StatefulWidget {
  const DocumentsTab2({Key? key}) : super(key: key);

  @override
  State<DocumentsTab2> createState() => _DocumentsTab2State();
}

class _DocumentsTab2State extends State<DocumentsTab2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  documentEditBottomSheet(
                      context: context, text: tab1[index].title);
                },
                child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 0,
                          offset: const Offset(
                              0.2, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white12,
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 7,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            tab1[index].image,
                            height: 110,
                            width: 100,
                          ),
                          Wrap(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tab1[index].title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Inter-SemiBold',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    tab1[index].text,
                                    style: TextStyle(
                                      //color: Colors.black,
                                      fontSize: 12, fontFamily: 'Inter-Regular',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    tab1[index].discription,
                                    style: TextStyle(
                                        fontFamily: 'Inter-Bold',
                                        color: Colors.blue,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: firstColor, width: 2),
                                      borderRadius: BorderRadius.circular(
                                        6,
                                      )),
                                  width: 49,
                                  height: 40,
                                  child: TextButton(
                                    child: Text(
                                      "ADD",
                                      style: TextStyle(
                                          fontFamily: 'Inter-Medium',
                                          fontSize: 14,
                                          color: firstColor),
                                    ),
                                    onPressed: () {
                                      documentEditBottomSheet(
                                          context: context,
                                          text: tab1[index].title);
                                    },
                                  ))
                            ],
                          ),
                        ],
                      ),
                    )),
              );
            }));
  }

  Future<dynamic> documentEditBottomSheet({
    context,
    String? text,
  }) {
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
          text: text.toString(),
        );
      },
    );
  }
}
