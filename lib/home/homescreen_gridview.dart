// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenGrid {
  String text;
  String image;
  String number;
  Color color;

  HomeScreenGrid(
      {required this.text,
      required this.image,
      required this.number,
      required this.color});
}

List<HomeScreenGrid> grid = [
  HomeScreenGrid(
      text: 'Document \nDelivery',
      image: "assets/images/card1.png",
      number: '1',
      color: Colors.green),
  HomeScreenGrid(
      text: 'Essential\nItems',
      image: "assets/images/card2.png",
      number: '2',
      color: Colors.blue.shade600),
  HomeScreenGrid(
      text: 'Buy\nDocuments',
      image: "assets/images/card3.png",
      number: '3',
      color: Colors.pink),
  HomeScreenGrid(
      text: 'Notary\nServices',
      image: "assets/images/card4.png",
      number: '4',
      color: Colors.yellow),
  HomeScreenGrid(
      text: 'Banking\nServices',
      image: "assets/images/card5.png",
      number: '5',
      color: Colors.purple),
  HomeScreenGrid(
      text: 'Medical\nReport',
      image: "assets/images/card6.png",
      number: '6',
      color: Colors.blue.shade200),
];
