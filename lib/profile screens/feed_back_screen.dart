// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/profile%20screens/profile_screen.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  TextEditingController feedbackcontroller = TextEditingController();
  Color primaryColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: thirdColor,
        elevation: 1,
        title: Text(
          "FeedBack",
          style: TextStyle(color: firstColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Let us know what you like about the app  \nor help us how to improve",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter FeedBack",
                  style: TextStyle(
                      color: firstColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: feedbackcontroller,
                  onChanged: (val) {
                    setState(() {
                      primaryColor = val.isNotEmpty ? firstColor : Colors.grey;
                    });
                  },
                ),
                const SizedBox(
                  height: 400,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (feedbackcontroller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Write Your FeedBack')),
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(" Submit feedback"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("NO")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ProfileScreen()));
                                      },
                                      child: const Text("YES"))
                                ],
                              );
                            });
                      }
                    },
                    child: const Text("Send FeedBack"),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
