// ignore_for_file: implementation_imports

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:whatsapp_share2/whatsapp_share2.dart' show WhatsappShare;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import "package:share_plus/share_plus.dart";

class ReferalPage extends StatefulWidget {
  const ReferalPage({super.key});

  @override
  State<ReferalPage> createState() => _ReferalPageState();
}

class _ReferalPageState extends State<ReferalPage> {
  final String _phone = '917974704221';

  // Future<void> share() async {
  //   await WhatsappShare.share(
  //     text: 'Example share text',
  //     linkUrl: 'https://flutter.dev/',
  //     phone: _phone,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: thirdColor,
        elevation: 1,
        title: Text(
          "Invite Friends ",
          style: TextStyle(
              color: firstColor, fontFamily: 'Inter-Regular', fontSize: 18),
        ),
        automaticallyImplyLeading: true,
        foregroundColor: firstColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "GET FLAT 100 OFF",
                      style: TextStyle(fontFamily: 'Inter-Bold', fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("For every 10 user you refer"),
                    const SizedBox(
                      height: 5,
                    ),
                    Image.asset("assets/images/referal.png"),
                    const Text(
                      "Share your referal code and get FLAT 100\nOFF on your delivery.Each user you refer \nwill also receive FLAT 100 OFF",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontFamily: 'Inter-Regular', fontSize: 14),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade300),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            SelectableText(
                              'AURU1638',
                              style: TextStyle(
                                  fontSize: 14, fontFamily: 'Inter-Medium'),
                              cursorColor: Colors.white,
                              showCursor: true,
                              toolbarOptions: ToolbarOptions(
                                  copy: true,
                                  selectAll: true,
                                  cut: false,
                                  paste: false),
                            ),
                            Icon(
                              Icons.copy,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                height: MediaQuery.of(context).size.height / 3.5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "How to earn?",
                            style: TextStyle(
                                color: firstColor,
                                fontFamily: 'Inter-SemiBold',
                                fontSize: 16),
                          ),
                          const Icon(MdiIcons.alertCircleOutline)
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("1. "),
                          Text(
                            "Share your unique referal code to 10 \nof your friends",
                            style: TextStyle(
                                letterSpacing: 1.5,
                                fontFamily: 'Inter-Regular',
                                fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("2. "),
                          Text(
                            " First 10 new users you refered will \nget FLAT 100 OFF on their first order \nusing your referal code.",
                            style: TextStyle(
                                letterSpacing: 1.5,
                                fontFamily: 'Inter-Regular',
                                fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("3. "),
                          Text(
                            "You will receive a referal bonus code \nonce all the 10 users have placed \ntheir oder using your referal code.",
                            style: TextStyle(
                                letterSpacing: 1.5,
                                fontFamily: 'Inter-Regular',
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height / 10,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await Share.share(
                      'https://play.google.com/store/apps/details?id=com.devsol.customer');
                },
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 45, vertical: 7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    primary: firstColor),
                child: Text(
                  "Share",
                  style: TextStyle(fontFamily: 'Inter-SemiBold', fontSize: 14),
                ))
          ],
        ),
      ),
    );
  }
}
