// ignore_for_file: unnecessary_null_comparison, deprecated_member_use, avoid_print, prefer_const_constructors, unused_import, depend_on_referenced_packages

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:new_mobile_application/pastorders/visible.dart';
import 'package:star_rating/star_rating.dart';

class CancelledData extends StatefulWidget {
  const CancelledData({Key? key}) : super(key: key);

  @override
  State<CancelledData> createState() => _CancelledDataState();
}

class _CancelledDataState extends State<CancelledData> {
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
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Visible();
                })));
  }
}
