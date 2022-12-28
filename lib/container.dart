import 'package:flutter/material.dart';

class NewContainer extends StatefulWidget {
  final Widget? child;
  final double? height;
  final double? width;
  const NewContainer({Key? key, this.child, this.height, this.width}) : super(key: key);

  @override
  State<NewContainer> createState() => _NewContainerState();
}

class _NewContainerState extends State<NewContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0.2, 3), // changes position of shadow
          ),
        ],
        //Border.all
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
          
        ),
         //Border.all
      ),
      child: widget.child,
    );
  }
}
