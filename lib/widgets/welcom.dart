import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/home/home_screen.dart';
import 'package:new_mobile_application/utlities/const.dart';

class WelCome extends StatefulWidget {
  final String? name, email, uid;
  const WelCome({super.key, this.name, this.email, this.uid});

  @override
  State<WelCome> createState() => _WelComeState();
}

class _WelComeState extends State<WelCome> {
  bool isLoading = true;
 DocumentSnapshot? userDoc;
  String? uid = firebaseAuth.currentUser!.uid;
   String?name = '';
  Future<void> userData() async {
    try {
     
      userDoc = await firestore.collection('usersDetails').doc(uid).get();
      if (userDoc == null) {
        name = (userDoc!.data() as Map<String, dynamic>)['name'].toString();
      } else {
        name = '';
      }
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }

    // print(
    //     "current user name is ${(userDoc!.data() as Map<String, dynamic>)['uid']}");
    return;
  }

  @override
  void initState() {
    //  userData();

    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    name: name??'',
                  )));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: userData(),
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome back",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  (userDoc!.data() as Map<String, dynamic>)['name'].toString() ==
                          "null"
                      ? const Text("null")
                      : Text(
                          "${(userDoc!.data() as Map<String, dynamic>)['name']}",
                          style: TextStyle(color: firstColor, fontSize: 25),
                        )
                ],
              ),
            );
          }),
    );
  }
}
