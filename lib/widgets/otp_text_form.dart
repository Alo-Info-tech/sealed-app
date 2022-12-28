// ignore_for_file: avoid_print, duplicate_ignore

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/widgets/login_screen.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';

enum MobileVerificationState {
  // ignore: constant_identifier_names
  SHOW_MOBILE_FORM_STATE,
  // ignore: constant_identifier_names
  SHOW_OTP_FORM_STATE,
}

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final CountdownController _controller =
      new CountdownController(autoStart: true);

  Timer? countdownTimer;
  // Duration myDuration = Duration(days: 5);
  bool _isResendAgain = false;
  String? add;

  // Timer? _timer;
  // int? start;
  // int _start = 60;

  void resend() {
    setState(() {
      _isResendAgain = true;
    });

    // _timer = Timer.periodic(oneSec, (timer) {
    //   setState(() {
    //     if (_start == 0) {
    //       _start = 60;
    //       _isResendAgain = false;
    //       timer.cancel();
    //     } else {
    //       _start--;
    //     }
    //   });
    // });
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  // /// Timer related methods ///
  // // Step 3
  // void startTimer() {
  //   countdownTimer =
  //       Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  // }

  // // Step 4
  // void stopTimer() {
  //   setState(() => countdownTimer!.cancel());
  // }

  // // Step 5
  // void resetTimer() {
  //   stopTimer();
  //   setState(() => myDuration = const Duration(days: 5));
  // }

  // // Step 6
  // void setCountDown() {
  //   final reduceSecondsBy = 1;
  //   setState(() {
  //     final seconds = myDuration.inSeconds - reduceSecondsBy;
  //     if (seconds < 0) {
  //       countdownTimer!.cancel();
  //     } else {
  //       myDuration = Duration(seconds: seconds);
  //     }
  //   });
  // }

  final formkey = GlobalKey<FormState>();
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final nameController = TextEditingController();
  late String otp;
  Color primaryColor = secondColor;
  String? val;

  bool hasError = false;
  String currentText = "";

  String initialCountry = 'IN';

  String num = '';
  var countryCode;
  final countryPicker = const FlCountryCodePicker();
  var eid;

  // ignore: prefer_final_fields
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? verificationId;

  bool showLoading = false;

  Future signInWithPhoneAuthCredential(
      PhoneAuthCredential name, PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    print("status");

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      // ignore: duplicate_ignore, duplicate_ignore
      if (authCredential.user != null) {
        // ignore: avoid_print
        print("success uid is ${_auth.currentUser!.uid}");
        await _firestore.collection('sealed').doc(_auth.currentUser!.uid).set({
          "phoneNumber": phoneController.text,
          "uid": _auth.currentUser!.uid
        });

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (_) => LoginScreen()));
        Get.to(const AlreadyLogin());
      } else {
        print("Error");
      }
    } on FirebaseAuthException catch (e) {
      print('gdgdgdgdgdg');
      setState(() {
        showLoading = false;
      });
    }
    @override
    void initState() {
      super.initState();
      _listenOtp();
    }
  }

  getMobileFormWidget(context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Mobile Number",
                            style: TextStyle(
                              fontSize: 24,
                              color: firstColor,
                              fontFamily: 'Inter-Bold',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "This number will be used for all\ncommunication",
                          style: TextStyle(
                              fontFamily: 'Inter-Medium', fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 5,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final code = await countryPicker.showPicker(
                                    context: context);
                                if (code != null) print(code);
                                setState(() {
                                  countryCode = code;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Container(
                                  //width: 70,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        FittedBox(
                                            child: countryCode == null
                                                ? Image.asset(
                                                    "assets/images/india.png",
                                                  )
                                                : countryCode!.flagImage),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          countryCode == null
                                              ? '+91'
                                              : countryCode!.dialCode,
                                          style: const TextStyle(
                                              fontFamily: 'Inter-Medium',
                                              fontSize: 14),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: firstColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: 67,
                                width: MediaQuery.of(context).size.width / 1.7,
                                child: TextFormField(
                                  onChanged: (val) {
                                    setState(() {
                                      primaryColor = val.isNotEmpty
                                          ? firstColor
                                          : Colors.grey;
                                    });
                                  },
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  autovalidateMode: AutovalidateMode.always,
                                  maxLength: 10,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                    } else if (
                                        //r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/'
                                        !RegExp(r'(^(?:[+0]9)?[0-9]{10}$)')
                                            // !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                            .hasMatch(value)) {
                                      return "Enter Correct Number";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    counterText: ".",
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () async {
                                final form = formkey.currentState;
                                if (form!.validate()) {
                                  setState(() {
                                    showLoading = true;
                                  });
                                  final signcode =
                                      await SmsAutoFill().getAppSignature;
                                  setState(() {
                                    showLoading = true;
                                  });
                                  await _auth.verifyPhoneNumber(
                                      phoneNumber: "+91" + phoneController.text,
                                      verificationCompleted:
                                          (phoneAuthCredential) async {
                                        setState(() {
                                          showLoading = false;
                                        });
                                        signInWithPhoneAuthCredential(
                                            phoneAuthCredential,
                                            phoneAuthCredential);
                                      },
                                      verificationFailed:
                                          (verificationFailed) async {
                                        setState(() {
                                          showLoading = false;
                                        });

                                        print("error is ");
                                        // ignore: avoid_print
                                        print(verificationFailed.message
                                            .toString());
                                      },
                                      codeSent: (verificationId,
                                          resendingToken) async {
                                        setState(() {
                                          showLoading = false;

                                          currentState = MobileVerificationState
                                              .SHOW_OTP_FORM_STATE;
                                          this.verificationId = verificationId;
                                        });
                                      },
                                      codeAutoRetrievalTimeout:
                                          (verificationId) async {});
                                  timeout:
                                  const Duration(seconds: 20);
                                } else {}
                              },
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      num == '' ? primaryColor : firstColor),
                              child: const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  "Get OTP",
                                  style: TextStyle(
                                      fontFamily: 'Inter-SemiBold',
                                      fontSize: 14),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getOtpFormWidget(context) {
    return Scaffold(
        body: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Countdown(
        controller: _controller,
        seconds: 60,
        build: (_, double time) => Text(
          time.toString(),
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        interval: Duration(milliseconds: 1000),
        onFinished: () {
          Navigator.pop(context);
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text('Timer is done!'),
          //   ),
          // );
        },
      ),

      // TweenAnimationBuilder(
      //   tween: Tween(begin: 60.0, end: 0),
      //   duration: Duration(seconds: 60),
      //   builder: (context, value, child) {
      //     double val = value as double;
      //     int time = val.toInt();
      //     return Text(
      //       "Code Expires In $time",
      //       style: const TextStyle(
      //         fontWeight: FontWeight.w400,
      //       ),
      //     );
      //   },
      //   onEnd: () {
      //     Navigator.pop(context);
      //   },
      // ),
      // TweenAnimationBuilder<Duration>(
      //     duration: const Duration(minutes: 1),
      //     tween: Tween(begin: const Duration(minutes: 1), end: Duration.zero),
      //     onEnd: () {
      //       print('Timer ended');
      //     },
      //     builder: (BuildContext context, Duration value, Widget? child) {
      //       final minutes = value.inMinutes;
      //       final seconds = value.inSeconds % 20;
      //       return Padding(
      //           padding: const EdgeInsets.symmetric(vertical: 5),
      //           child: Text('$minutes:$seconds',
      //               textAlign: TextAlign.center,
      //               style: const TextStyle(color: Colors.black, fontSize: 15)));
      //     }),
      const SizedBox(
        height: 20,
      ),
      PinCodeTextField(
        keyboardType: TextInputType.number,
        autoFocus: true,

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        length: 6,
        onChanged: (val) {
          print(val);
        },

        pinTheme: PinTheme(
            inactiveColor: firstColor,
            errorBorderColor: Colors.black,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(12),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
            selectedColor: firstColor),
        // width: MediaQuery.of(context).size.width,
        // fieldWidth: 42,
        // style: const TextStyle(
        //   fontSize: 20,
        // ),
        // textFieldAlignment: MainAxisAlignment.spaceEvenly,
        // fieldStyle: FieldStyle.box,
        onCompleted: (pin) {
          print("completed:" + pin);

          print("otp is ${otpController.text}");

          setState(() {
            otp = otpController.text.isEmpty ? pin : otpController.text;
            primaryColor = val!.isNotEmpty ? firstColor : Colors.grey;
          });
        },

        appContext: context,
      ),
      Text(
        hasError ? "Please enter the correct pin" : "",
        style: const TextStyle(
            color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
      ),
      const SizedBox(
        height: 30,
      ),
      Center(
        child: ElevatedButton(
            onPressed: () async {
              // _controller.restart();
              // formKey.currentState!.validate();
              // conditions for validating
              // ignore: unrelated_type_equality_checks
              if (currentText.length != 6 || currentText != otpController) {
                otpController.text;

                // (ErrorAnimationType
                //  .shake); // Triggering error shake animation
                setState(() => hasError = true);
              } else {
                setState(() {
                  hasError = false;
                });
              }
              print(otp);
              print(verificationId);
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationId!, smsCode: otp);

              signInWithPhoneAuthCredential(
                  phoneAuthCredential, phoneAuthCredential);
            },
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 105, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                primary: primaryColor),
            child: const Text(
              "Verify",
              style: TextStyle(fontFamily: 'Semi-Bold', fontSize: 14),
            )),
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Didn't Recieve The OTP?"),
          TextButton(
              onPressed: () {
                _controller.restart();
                sendOTP(phone: "+91 7010230486");
              },
              child: Text(
                "Resend",
                style:
                    TextStyle(color: firstColor, fontWeight: FontWeight.bold),
              ))
        ],
      )
    ])));
  }

  int? _resendToken;

  Future<bool> sendOTP({required String phone}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        setState(() {
          showLoading = false;
        });
        signInWithPhoneAuthCredential(phoneAuthCredential, phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException verificationFailed) {
        setState(() {
          showLoading = false;
        });

        print("error is ");
        // ignore: avoid_print
        print(verificationFailed.message.toString());
      },
      codeSent: (String verification, int? resendToken) async {
        verificationId = verification;

        _resendToken = resendToken;

        print("refresh token $_resendToken");
      },
      timeout: const Duration(seconds: 25),
      forceResendingToken: _resendToken,
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationId = verificationId;
      },
    );
    debugPrint("_verificationId: $verificationId");
    return true;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: Container(
          padding: const EdgeInsets.all(0),
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.cyan.shade700,
                  ),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
        ));
  }

  void _listenOtp() async {
    await SmsAutoFill().listenForCode;
  }
}
