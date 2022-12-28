import 'package:flutter/material.dart';
import 'package:new_mobile_application/catogery/document_bottom.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/payment/delete_item_bottomscreen.dart';

class CartListView extends StatefulWidget {
  final String? title,
      subTitle,
      description,
      count,
      payment,
      naem,
      rename,
      document;
  const CartListView({
    Key? key, this.title, this.subTitle, this.description, this.count, this.payment, this.naem, this.rename, this.document,
  }) : super(key: key);

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0.2, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset("assets/images/stamb.png"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children:  [
                      Text(
                        widget.document.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Text(
                        "\u{20B9} ${widget.payment.toString()}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(widget.naem.toString()),
                  const SizedBox(
                    height: 5,
                  ),
                   Text(
                    "Quantity : ${widget.count.toString()}",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 90.0),
                child: ElevatedButton(
                    onPressed: () {
                      documentEditBottomSheet(context);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: firstColor),
                    child: const Text("Edit")),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    deleteItemBottomSheet(context);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: Colors.white),
                  child: Icon(
                    Icons.delete,
                    color: firstColor,
                  )),
            ],
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            color: Colors.grey.shade400,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Future<dynamic> documentEditBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const DocumentBottomSheet();
      },
    );
  }

  Future<dynamic> deleteItemBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const DeleteItemBottomSheet();
      },
    );
  }
}
