// // ignore_for_file: prefer_const_constructors

// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, unused_field, unused_element, prefer_const_constructors, unused_import

import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:new_mobile_application/colors.dart';


import 'package:new_mobile_application/home/home_page.dart';
import 'package:new_mobile_application/home/pastorders_screen.dart';
import 'package:new_mobile_application/pages/active_orders.dart';
import 'package:new_mobile_application/profile%20screens/profile_screen.dart';
import 'package:new_mobile_application/home/trackorder_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomeScreen extends StatefulWidget {
  final String? name;
  const HomeScreen({Key? key, this.name}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 // DateTime timeBackPressed = DateTime.now();
  int _currentIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screen = [
      HomePageScreen(
        name: widget.name,
      ),
      //const TrackOrderScreen(),
      const ActiveOrders(),
      const PastOrdersScreen(),
    ];
    return Scaffold(
      body: screen[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: false,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Icon(
                MdiIcons.homeVariantOutline,
                color: _currentIndex ==0?firstColor:Colors.grey.shade500,
              ),
            ),
            title: Text('Home',style: TextStyle(fontSize: 12,fontFamily: 'Inter-Bold'),),
            activeColor: _currentIndex ==0?firstColor:Colors.grey.shade500,
            inactiveColor: Colors.grey.shade300,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(
              MdiIcons.bookOutline,
              color:_currentIndex ==1?firstColor:Colors.grey.shade500,
            ),
            title: Text('Track Order',style: TextStyle(fontFamily: 'Inter-Bold',fontSize: 12),),
            activeColor: _currentIndex ==1?firstColor:Colors.grey.shade300,
            inactiveColor: Colors.grey.shade300,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(
              MdiIcons.circleSlice2,
              color: _currentIndex ==2?firstColor:Colors.grey.shade500,
            ),
            title: Text(
              'Past Orders',
              style: TextStyle(color: firstColor,fontSize: 12,fontFamily: 'Inter-Bold'),
            ),
            activeColor:_currentIndex ==2?firstColor:Colors.grey.shade500,
            inactiveColor: Colors.grey.shade500,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
