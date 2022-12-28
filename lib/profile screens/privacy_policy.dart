import 'package:flutter/material.dart';
import 'package:new_mobile_application/colors.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: thirdColor,
          elevation: 1,
          title: Text(
            "Privacy Policy ",
            style: TextStyle(
                color: firstColor, fontFamily: 'Inter-Regular', fontSize: 18),
          ),
          automaticallyImplyLeading: true,
          foregroundColor: firstColor,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "This Privacy Policy (“Policy”) describes the policies and procedures on the collection, use, disclosure and protection of your information when you use our website www.sealed.co.in, or the Sealed mobile application (collectively, “Platform”) made available by Suguna Stamp and Seal Private Limited ( Sealed or “Us” or “We” or “Our”), a private company established under the laws of India having its registered office at No: 273, Purasawalkam High Road, Opp. Saravana Stores, Chennai- 600 007.\nThe terms “you” and “your” refer to the user of the Platform. Please read this Policy before using the Platform or submitting any personal information to Sealed. This Policy is a part of and incorporated within, and is to be read along with, the Terms of Use..",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Inter-Regular',
                          height: 1.5),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("YOUR CONSENT",
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Inter-Bold',
                        )),
                    Text(
                      "By using the Platform, you agree and consent to the collection, transfer, use, storage, disclosure and sharing of your information as described and collected by us in accordance with this Policy. If you do not agree with the Policy, please do not use or access the Platform.",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Inter-Regular',
                          height: 1.5),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("POLICY CHANGES",
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Inter-Bold',
                        )),
                    Text(
                      "We may occasionally update this Policy and such changes will be posted on this page. If we make any significant changes to this Policy, we will endeavor to provide you with reasonable notice of such changes, such as via prominent notice on the Platform or to your email address/mobile phone number on record and where required by applicable law, we will obtain your consent. To the extent permitted under applicable law, your continued use of the Platform after we publish or send a notice about our changes to this Policy shall constitute your consent to the updated Policy.",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Inter-Regular',
                          height: 1.5),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("LINK TO OTHER WEBSITES",
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Inter-Bold',
                        )),
                    Text(
                      "The Platform may contain links to other websites. Any personal information about you collected whilst visiting such websites is not governed by this Policy. Sealed will not be responsible for and has no control over the practices and content of any website accessed using the links contained on the Platform. This Policy shall not apply to any information you may disclose to any of the Delivery Partners, Professionals, service providers or service personnel which we do not require you to disclose to us or any of our service providers under this Policy.",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Inter-Regular',
                          height: 1.5),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
