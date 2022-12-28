// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, unused_field, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/controller/user_controller.dart';
import 'package:new_mobile_application/home/home_screen.dart';
import 'package:new_mobile_application/utlities/const.dart';
import 'package:new_mobile_application/widgets/default_address_screen.dart';
import 'package:new_mobile_application/widgets/welcom.dart';
import 'package:page_transition/page_transition.dart';

class AlreadyLogin extends StatefulWidget {
  const AlreadyLogin({super.key});

  @override
  State<AlreadyLogin> createState() => _AlreadyLoginState();
}

class _AlreadyLoginState extends State<AlreadyLogin> {
  bool isLoading = true;
  late DocumentSnapshot userDoc;
  late String uid = firebaseAuth.currentUser!.uid;
  late String name = '';
  @override
  void initState() {
    try {
      userData();
    } catch (e) {
      print('ghh');
    }

    super.initState();
  }

  void userData() async {
    try {
      setState(() {
        isLoading = true;
      });

      userDoc = await firestore.collection('usersDetails').doc(uid).get();
      if (userDoc == null) {
        name = '';
      } else {
        name = (userDoc.data() as Map<String, dynamic>)['name'].toString();
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
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : name == ''
            ? LoginScreen()
            : WelCome();
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //  final AuthUserController userController =
  //     Get.put(AuthUserController());
  Color primaryColor = secondColor;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  final TextEditingController _controller = TextEditingController();
  String? buttonText;
  //String? uid = firebaseAuth.currentUser!.uid;
  QuerySnapshot? querySnapshot;

  // @override
  // void initState() {
  //   super.initState();
  //   getDriversList()!.then((results) {
  //     setState(() {
  //       querySnapshot = results;
  //     });
  //   });
  //   //  print(querySnapshot!.docChanges[0].doc['name'].toString());
  // }

  // Future<dynamic>? getDriversList() async {
  //   await firestore.collection('usersDetails').doc(uid).get();
  //   print(querySnapshot!.docChanges[0].doc['name'].toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //   body: GetBuilder<AuthUserController>(
        // //  init: AuthUserController(),
        //     builder: (controller) {
        body: SingleChildScrollView(
            child: SafeArea(
                child: Form(
                    //  autovalidateMode: AutovalidateMode.always,
                    key: formkey,
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            //mainAxisAlignment: MainAxisAlignment.,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 7,
                              ),
                              InkWell(
                                onTap: () {
                                  // print(getDriversList());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ));
                                },
                                child: Text(
                                  "Personal Details",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: firstColor,
                                    fontFamily: 'Inter-Bold',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Enter your name and E-mail\nAddress for mail communication",
                                style: TextStyle(
                                    fontFamily: 'Regular', fontSize: 14),
                              ),
                              // Text(controller.currentUser[0].name.toString()),
                              // StreamBuilder<QuerySnapshot>(
                              //   stream: firestore
                              //       .collection('usersDetails').doc().collection(uid.toString())
                              //       .snapshots(),
                              //   builder: (BuildContext context,
                              //       AsyncSnapshot<QuerySnapshot> snapshot) {
                              //     if (!snapshot.hasData)
                              //       return Text('Loading...');
                              //     return SizedBox(
                              //       height: 30,
                              //       child: Text(snapshot.data!.docChanges.last.toString()),
                              //       // child: ListView(
                              //       //   children: snapshot.data!.docs
                              //       //       .map((DocumentSnapshot document) {
                              //       //     return  ListTile(
                              //       //       title:  Text(document['name']),

                              //       //     );
                              //       //   }).toList(),
                              //       // ),
                              //     );
                              //   },
                              // ),
                              // Text(querySnapshot!.docChanges[0].doc['name'].toString()),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 8,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: "Enter your name",
                                    labelStyle:
                                        TextStyle(color: Colors.grey.shade400)),
                                controller: nameController,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z]+$')
                                          .hasMatch(value)) {
                                    return "Enter correct name";
                                  } else {
                                    return value.length < 3
                                        ? 'Name must be greater than two characters'
                                        : null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _controller,
                                onChanged: (value) {
                                  setState(() {
                                    primaryColor = value.isNotEmpty
                                        ? firstColor
                                        : Colors.grey;
                                  });
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Enter your E-mail Address",
                                    labelStyle:
                                        TextStyle(color: Colors.grey.shade400)),
                                // controller: _controller,
                                //validator: EmailValidator(errorText: "not a valid email"),

                                validator: (val) =>
                                    val!.isEmpty || !val.contains("@gmail.com")
                                        ? "Enter a valid email"
                                        : null,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Center(
                                child: ElevatedButton(
                                    child: Text(
                                      buttonText ?? 'Get Started',
                                      style: TextStyle(
                                          fontFamily: 'Inter-SemiBold',
                                          fontSize: 14),
                                    ),
                                    onPressed: () {
                                      //_formKey.currentState?.validate();
                                      if (formkey.currentState!.validate()) {
                                        AuthUserController()
                                            .registerUserProfile(
                                                name: nameController.text,
                                                description: '',
                                                email: emailController.text,
                                                address: '',
                                                phone: auth
                                                    .currentUser!.phoneNumber
                                                    .toString(),
                                                dob: '',
                                                uid: auth.currentUser!.uid);
                                        print("success");
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: const DefaultAddressScreen(),
                                          ),
                                        );
                                      } else {
                                        print('error');
                                        null;
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 114, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        primary: firstColor)
                                    // =
                                    //                   Center(
                                    //                     child: ElevatedButton(
                                    //                         onPressed: () {
                                    //                           //_formKey.currentState?.validate();
                                    //                           if (formkey.currentState!.validate()) {
                                    //                             Navigator.push(
                                    //                               context,
                                    //                               PageTransition(
                                    //                                 duration: const Duration(milliseconds: 300),
                                    //                                 type: PageTransitionType.rightToLeft,
                                    //                                 child: const DefaultAddressScreen(),
                                    // >>>>>>> checkmergedev2
                                    //                               ),
                                    //                             );
                                    //                           } else {
                                    //                             null;
                                    //                           }
                                    //                         },
                                    //                         style: ElevatedButton.styleFrom(
                                    //                             padding: const EdgeInsets.symmetric(
                                    //                                 horizontal: 114, vertical: 15),
                                    //                             shape: RoundedRectangleBorder(
                                    //                               borderRadius: BorderRadius.circular(8.0),
                                    //                             ),
                                    //                             primary: primaryColor),

                                    //   )
                                    // ]),
                                    ),
                              ),
                            ])))))
        //   }
        // )
        );
  }

  void _checkTextIsEmpty() {
    final value = _controller.text.isEmpty ? "Get Started" : "Next";
    setState(() {
      buttonText = value;
    });
  }
}
