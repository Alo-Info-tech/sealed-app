// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:new_mobile_application/colors.dart';
import 'package:new_mobile_application/home/home_page.dart';
import 'package:new_mobile_application/home/home_screen.dart';
import 'package:new_mobile_application/pastorders/cancelleddata_screen.dart';

import 'package:new_mobile_application/pastorders/delivereddata_screen.dart';
import 'package:new_mobile_application/profile%20screens/profile_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:intl_phone_field/intl_phone_field.dart';
//import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PastOrdersScreen extends StatefulWidget {
  const PastOrdersScreen({Key? key}) : super(key: key);

  @override
  State<PastOrdersScreen> createState() => _PastOrdersScreenState();
}

class _PastOrdersScreenState extends State<PastOrdersScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: thirdColor,
          elevation: 1,
          title: Text(
            "Past Orders",
            style: TextStyle(color: firstColor,fontFamily: 'Inter-Regular',fontSize: 18),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: firstColor,
              )),
          // automaticallyImplyLeading: true,foregroundColor: firstColor,
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: tabController,
                    labelColor: firstColor,
                    indicatorColor: Colors.white,
                    isScrollable: true,
                    labelStyle: const TextStyle(
                      fontFamily: 'Inter-Bold',fontSize: 14
                    ),
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(
                        text: "Delivered",
                      ),
                      Tab(
                        text: "Cancelled",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height / 1,
                  child: TabBarView(controller: tabController, children: [
                    const DeliveredData(),
                    const CancelledData(),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
