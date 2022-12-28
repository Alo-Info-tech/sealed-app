import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? name;
  String? description;
  String? address;
  String? phone;

  String? dob;
  String? email;
  String? uid;

  User(
      {this.name,
      this.description,
      this.address,
      this.phone,
      this.dob,
      this.email,
      this.uid});

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "address": address,
        "phone": phone,
        "dob": dob,
        "email": email,
        "uid": uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      description: snapshot['description'],
      address: snapshot['address'],
      phone: snapshot['phone'],
      dob: snapshot['dob'],
      email: snapshot['email'],
      uid: snapshot['uid'],
      name: snapshot['name'],
    );
  }
}
