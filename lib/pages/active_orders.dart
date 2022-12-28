import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/colors.dart';


import '../home/trackorder_screen.dart';

class ActiveOrders extends StatefulWidget {
  const ActiveOrders({super.key});

  @override
  State<ActiveOrders> createState() => _ActiveOrdersState();
}

class _ActiveOrdersState extends State<ActiveOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "You don’t have any active orders",
              style: TextStyle(
                  fontFamily: 'Inter-Medium',
                  fontSize: 14,
                  color: Color.fromARGB(255, 92, 92, 92)),
            ),
           SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: firstColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TrackOrderScreen()));
              },
              child: const Text(
                "Place order",
                style: const TextStyle(fontSize: 14,fontFamily: 'Inter-Medium'),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
