// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/catogery/document3.dart';
import 'package:new_mobile_application/catogery/document4.dart';
import 'package:new_mobile_application/catogery/documentstab1.dart';
import 'package:new_mobile_application/catogery/documenttab2.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/profile%20screens/profile_screen.dart';
import 'package:page_transition/page_transition.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: thirdColor,
          elevation: 1,
          title: Text(
            "Documents",
            style: TextStyle(
                fontFamily: 'Inter-Regular', fontSize: 18, color: firstColor),
          ),
          automaticallyImplyLeading: true,
          foregroundColor: firstColor,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: ( BuildContext context) => ProfileScreen()));
                  // Navigator.push(
                  //   context,
                  //   PageTransition(
                  //     duration: Duration(milliseconds: 300),
                  //     type: PageTransitionType.rightToLeft,
                  //     child: ProfileScreen(),
                  //   ),
                  // );
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
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Stamp Paper/Vendor",
                  style: TextStyle(fontFamily: 'Inter-Regular', fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Suguna Consultants Private Limited",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter-Bold',
                      fontSize: 12),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      controller: tabController,
                      labelColor: firstColor,
                      indicatorColor: Colors.blue,
                      isScrollable: true,
                      labelStyle: const TextStyle(
                          fontFamily: 'Inter-Medium', fontSize: 14),
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Tab(
                          text: "NON-JUDICIAL STAMB PAPER",
                        ),
                        Tab(
                          text: "COURT FEE STAMPS",
                        ),
                        Tab(
                          text: "REVENUE",
                        ),
                        Tab(
                          text: "POSTAL",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height / 1,
                    child:
                        TabBarView(controller: tabController, children: const [
                      DocumentsTab1(),
                      DocumentsTab2(),
                      DocumentsTab3(),
                      DocumentsTab4(),

                    ]),
                  )
                ]),
              ]),
        ))));
  }
}
