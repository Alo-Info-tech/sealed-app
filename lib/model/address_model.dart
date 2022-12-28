import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String? addresLine;
  String? landmark;
  String? city;
  String? district;

  String? state;
  String? country;
  String? pincode;

  AddressModel(
      {this.addresLine,
      this.landmark,
      this.city,
      this.district,
      this.state,
      this.country,
      this.pincode});

  Map<String, dynamic> toJson() => {
        "addressLine": addresLine,
        "landMark": landmark,
        "city": city,
        "district": district,
        "state": state,
        "country": country,
        "pincode": pincode,
      };

  static AddressModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return AddressModel(
      addresLine: snapshot['addressLine'],
      landmark: snapshot['landMark'],
      city: snapshot['city'],
      district: snapshot['district'],
      state: snapshot['state'],
      country: snapshot['country'],
      pincode: snapshot['pincode'],
    );
  }
}
