// ignore_for_file: prefer_const_constructors, sort_child_properties_last, depend_on_referenced_packages, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/colors.dart';
import 'package:new_mobile_application/controller/user_controller.dart';
import 'package:new_mobile_application/profile%20screens/profile_screen.dart';
import 'package:new_mobile_application/utlities/const.dart';

import '../model/current_user_model.dart';

class EditBottomSheet extends StatefulWidget {
  const EditBottomSheet({Key? key}) : super(key: key);

  @override
  State<EditBottomSheet> createState() => _EditBottomSheetState();
}

class _EditBottomSheetState extends State<EditBottomSheet> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final AuthUserController controller = Get.put(AuthUserController());
  bool isLoading = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _controller = TextEditingController();
  String? buttonText;
  var _currentUser;

  List<CurrentUSer> get currentUser => _currentUser.value;

  @override
  void initState() {
    userData();
    _controller.addListener(_checkTextIsEmpty);
    super.initState();
  }

  DocumentSnapshot? userDoc;
  String? uid = firebaseAuth.currentUser!.uid;
  Future userData() async {
    try {
      userDoc = await firestore.collection('usersDetails').doc(uid).get();
      print(
          "current user name is ${(userDoc!.data() as Map<String, dynamic>)['uid']}");
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: isLoading == true
          ? SizedBox(
              height: 420,
              width: 350,
              child: Center(
                child: CircularProgressIndicator(),
              ))
          : FutureBuilder(
              future: userData(),
              builder: (context, snapshot) {
                return SizedBox(
                  height: 410,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Edit Personal Details",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 140,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(MdiIcons.closeCircleOutline))
                          ],
                        ),
                        Text(
                          "Your Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: 340,
                          decoration: BoxDecoration(
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
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                "${(userDoc!.data() as Map<String, dynamic>)['name']}"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 100.0),
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: 340,
                          decoration: BoxDecoration(
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
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                "${(userDoc!.data() as Map<String, dynamic>)['phone']}"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 100.0),
                          child: Text(
                            "Email ID",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 50,
                          width: 340,
                          decoration: BoxDecoration(
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
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                "${(userDoc!.data() as Map<String, dynamic>)['email']}"),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 200,
                                child: TextButton(
                                  child: Text(
                                    buttonText ?? 'Cancel',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileScreen()));
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: firstColor),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
    );
  }

  void _checkTextIsEmpty() {
    final value = _controller.text.isEmpty ? "Cancel" : "Update";
    setState(() {
      buttonText = value;
    });
  }
}
