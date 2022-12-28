
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_mobile_application/home/home_screen.dart';
import 'package:new_mobile_application/widgets/blank_screen.dart';
import 'package:new_mobile_application/widgets/welcom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Init extends StatefulWidget {
//  const Init({Key? key}) : super(key: key);

  @override
  _InitState createState() => _InitState();
}

class _InitState extends State<Init> {
  
  User? _user;

  bool isLoading = true;
  String? name;
  @override
  void initState() {
    _user = FirebaseAuth.instance.currentUser;
    isLoading = false;
    data();
    super.initState();
  }

  void data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
  }
  

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
          
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _user == null
            ?   BlankScreen()
            : WelCome();
            //: const HomeScreen();
    /*: CreateProfile();*/
  }
}

