import 'package:flutter/material.dart';
import 'package:new_mobile_application/colors.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: thirdColor,
        elevation: 1,
        title: Text(
          "Contact us ",
          style: TextStyle(
              color: firstColor, fontFamily: 'Inter-Regular', fontSize: 18),
        ),
        automaticallyImplyLeading: true,
        foregroundColor: firstColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Get in touch with us ",
              style: TextStyle(fontSize: 22, fontFamily: 'Inter-Regular'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Head Office:",
              style: TextStyle(fontSize: 14, fontFamily: 'Inter-Bold'),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "273, Purasaivakkam High Road, \nOpp. Saravana Stores, Purasaiwakkam,\nChennai, Tamil Nadu 600007.",
              style: TextStyle(
                  fontSize: 14, fontFamily: 'Inter-Regular', height: 1.5),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Email:",
              style: TextStyle(fontSize: 14, fontFamily: 'Inter-Bold'),
            ),
            Text(
              "contactus@gmail.com",
              style: TextStyle(fontSize: 14, fontFamily: 'Inter-Regular'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Call:",
              style: TextStyle(fontSize: 14, fontFamily: 'Inter-Bold'),
            ),
            Text(
              "044 4001 2000",
              style: TextStyle(fontSize: 14, fontFamily: 'Inter-Regular'),
            ),
          ],
        ),
      ),
    );
  }
}
