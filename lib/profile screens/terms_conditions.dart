import 'package:flutter/material.dart';
import 'package:new_mobile_application/colors.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: thirdColor,
        title: Text(
          "Terms & conditions ",
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
              children: [
                const Text(
                  'These Terms and Conditions of Use ("Terms of Use") govern the use and access by you, an individual ("You" or "Users") of the website www.sealed.co.in and the mobile app owned and operated by Suguna Stamp and Seal Private Limited ("Sealed" or “Us” or “We”), collectively the "Platform" and Sealed Services (defined below) offered on the Platform. The Terms of Use set out the conditions in accordance with which Sealed enables Users to connect with Professionals registered (or not registered) on the Platform ("Professionals") and delivery partners ("Delivery Partners") to avail the Sealed Services.',
                  style: TextStyle(
                      fontSize: 10, fontFamily: 'Inter-Regular', height: 1.5),
                ),
                const SizedBox(height: 20),
                const Text(
                  'These Terms and Conditions of Use ("Terms of Use") govern the use and access by you, an individual ("You" or "Users") of the website www.sealed.co.in and the mobile app owned and operated by Suguna Stamp and Seal Private Limited ("Sealed" or “Us” or “We”), collectively the "Platform" and Sealed Services (defined below) offered on the Platform. The Terms of Use set out the conditions in accordance with which Sealed enables Users to connect with Professionals registered (or not registered) on the Platform ("Professionals") and delivery partners ("Delivery Partners") to avail the Sealed Services.',
                  style: TextStyle(
                      fontSize: 10, fontFamily: 'Inter-Regular', height: 1.5),
                ),
                const SizedBox(height: 20),
                const Text(
                  "1. Registration",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  'Your information is collected and processed in accordance with the terms and conditions of this Privacy Policy.',
                  style: TextStyle(
                      fontSize: 10, fontFamily: 'Inter-Regular', height: 1.5),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.circle,
                        size: 5,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "To come forward as India’s prime delivery\n service and be known for our \nprofessionalism, cost-effectiveness \nand efficiency.",
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Inter-Regular',
                            height: 1.5),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.circle,
                        size: 5,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "To continue to deliver on our promise of ‘pick\n up, seal and deliver’ with a smile experience \nby utilizing technology, constant network\n expansion and customized solutions.",
                        style: TextStyle(
                            fontSize: 10, fontFamily: 'Inter-Regular'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.circle,
                        size: 5,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "To generate employment opportunities for\n thousands of youth in India.",
                        style: TextStyle(
                            fontSize: 10, fontFamily: 'Inter-Regular'),
                      ),
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
}
