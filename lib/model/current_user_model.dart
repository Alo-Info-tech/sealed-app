import 'package:cloud_firestore/cloud_firestore.dart';

class CurrentUSer {
  final String? address;
  final String? description;
  final String? dob;
  final String? email;
  final String? name;
  final String? phone;
  final String? uId;

  CurrentUSer({
    this.address,
    this.description,
    this.dob,
    this.email,
    this.name,
    this.phone,
    this.uId,
  });

  Map<String, dynamic> toJson() => {
        'address': address,
        'description': description,
        'dob': dob,
        'email': email,
        'name': name,
        'phone': phone,
        'uid': uId,
      };
  static CurrentUSer fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return CurrentUSer(
        address: snapshot['address'],
      description: snapshot['description'],
        dob: snapshot['dob'],
        email: snapshot['email'],
        name: snapshot['name'],
        phone: snapshot['phone'],
        uId: snapshot['uid'],
       );
  }
}
