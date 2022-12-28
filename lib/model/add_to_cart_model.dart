import 'package:cloud_firestore/cloud_firestore.dart';

class AddToCartModel {
  String? id;
  String? title;
  String? subTitle;
  String? description;
  String? count;
  String? payment;
  String? name;
  String? rename;
  String? document;

  AddToCartModel(
      {
        this.id,
        this.title,
      this.subTitle,
      this.description,
      this.count,
      this.payment,
      this.name,
      this.rename,
      this.document});

  Map<String, dynamic> toJson() => {
    "id":id,
        "title": title,
        "subtitle": subTitle,
        "description": description,
        "count": count,
        "paymnet": payment,
        "name": name,
        "rename": rename,
        "document": document
      };

  static AddToCartModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return AddToCartModel(
      id: snapshot['id'],
        title: snapshot['title'],
        subTitle: snapshot['subtitle'],
        description: snapshot['description'],
        count: snapshot['count'],
        payment: snapshot['paymnet'],
        name: snapshot['name'],
        rename: snapshot['rename'],
        document: snapshot['document']);
  }
}
