// ignore_for_file: unnecessary_null_comparison, deprecated_member_use, avoid_print, prefer_const_literals_to_create_immutables, unnecessary_const, unused_import, depend_on_referenced_packages, prefer_final_fields, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:new_mobile_application/pastorders/visible.dart';
import 'package:star_rating/star_rating.dart';

class DeliveredData extends StatefulWidget {
  const DeliveredData({Key? key}) : super(key: key);

  @override
  State<DeliveredData> createState() => _DeliveredDataState();
}

class _DeliveredDataState extends State<DeliveredData> {
  int _counter = 0;
  bool isVisible = false;

  final int starLength = 5;
  double rating = 0;
  String? rate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Visible();
                })));
  }
}
