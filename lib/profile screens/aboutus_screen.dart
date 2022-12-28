import 'package:flutter/material.dart';
import 'package:new_mobile_application/colors.dart';


class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: thirdColor,
        elevation: 1,
        title: Text(
          "About us ",
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
                Center(
                  child: Image.asset(
                    "assets/images/444.png",
                    width: 130,
                    height: 130,
                  ),
                ),
                const Text(
                  "Pick up, seal and deliver with a smile is the attitude that forms the foundation of Sealed. From a sheet of paper to a large binder. The convenience of having a Sealed delivery executive take care of your delivery, beats using post or courier companies. Our extensive focus is on safe , timely deliveries along with customer satisfaction. We constantly strive to provide the best levels of customer service to all our clients.",
                  style: TextStyle(
                      fontSize: 14, fontFamily: 'Inter-Regular', height: 1.5),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Vision",
                  style: TextStyle(fontFamily: 'Inter-Bold', fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
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
                        "To come forward as India’s prime delivery\n service and be known for our professionalism,\n cost-effectiveness and efficiency.",
                        style: TextStyle(
                            fontSize: 14,
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
                            fontSize: 14,
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
                        "To generate employment opportunities for\n thousands of youth in India.",
                        style: TextStyle(
                            fontSize: 14,
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
                        "Support ‘Make in India’ initiative by providing\n more entrepreneurial opportunities through\n our franchise network.",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Inter-Regular',
                            height: 1.5),
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
