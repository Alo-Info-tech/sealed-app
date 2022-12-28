import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:new_mobile_application/model/add_to_cart_model.dart';
import 'package:new_mobile_application/payment/cart_screen.dart';
import 'package:new_mobile_application/utlities/const.dart';

class AddToCartController extends GetxController {
  DocumentSnapshot? userDoc;
  CollectionReference ref =
      FirebaseFirestore.instance.collection('usersDetails');
  addCart({
    String? title,
    String? subTitle,
    String? description,
    String? count,
    String? payment,
    String? name,
    String? rename,
    String? documnet,
  }) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      userDoc = await firestore.collection('usersDetails').doc(uid).get();
      // get id
      var allDocs = await ref
          .doc(auth.currentUser!.uid.toString())
          .collection('AddToCart')
          .get();
      int len = allDocs.docs.length + 1;
      // String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      // String thumbnail = await _uploadImageToStorage("Video $len", videoPath);

      AddToCartModel donation = AddToCartModel(
          id: "AddToCart$len",
          title: title,
          subTitle: subTitle,
          description: description,
          count: count,
          payment: payment,
          name: name,
          rename: rename,
          document: documnet);

      await ref
          .doc(auth.currentUser!.uid.toString())
          .collection('AddToCart')
          .doc('AddToCart$len')
          .set(
            donation.toJson(),
          );
      print("success add to cart");
      Get.to(CartScreen());
    } catch (e) {
      Get.snackbar(
        'Error Uploading Video',
        e.toString(),
      );
    }
  }

  deleteCart({
    String? id,
    String? title,
    String? subTitle,
    String? description,
    String? count,
    String? payment,
    String? name,
    String? rename,
    String? documnet,
  }) async {
    try {
      String uid = firebaseAuth.currentUser!.uid.toString();
      userDoc = await firestore.collection('usersDetails').doc(uid).get();
      // get id

      var allDocs = await ref
          .doc(auth.currentUser!.uid.toString())
          .collection('AddToCart')
          .get();
      //var allDocs = await firestore.collection('${id.toString()}').get();
      int len = allDocs.docs.length + 1;
      // String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      // String thumbnail = await _uploadImageToStorage("Video $len", videoPath);

      AddToCartModel donation = AddToCartModel(
          id: "AddToCart0",
          title: title,
          subTitle: subTitle,
          description: description,
          count: count,
          payment: payment,
          name: name,
          rename: rename,
          document: documnet);
      await ref
          .doc(auth.currentUser!.uid.toString())
          .collection('AddToCart')
          .doc(id)
          .update(
            donation.toJson(),
            //     );

            // await firestore.collection('AddToCart').doc(id).update(
            //       donation.toJson(),
          );
    } catch (e) {
      Get.snackbar(
        'Error deleted data',
        e.toString(),
      );
    }
  }

  updateCart({
    String? id,
    String? title,
    String? subTitle,
    String? description,
    String? count,
    String? payment,
    String? name,
    String? rename,
    String? documnet,
  }) async {
    try {
      String uid = firebaseAuth.currentUser!.uid.toString();
      userDoc = await firestore.collection('usersDetails').doc(uid).get();
      // get id

      var allDocs = await ref
          .doc(auth.currentUser!.uid.toString())
          .collection('AddToCart')
          .get();
      //var allDocs = await firestore.collection('${id.toString()}').get();
      int len = allDocs.docs.length + 1;
      // String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      // String thumbnail = await _uploadImageToStorage("Video $len", videoPath);

      AddToCartModel donation = AddToCartModel(
          id: id,
          title: title,
          subTitle: subTitle,
          description: description,
          count: count,
          payment: payment,
          name: name,
          rename: rename,
          document: documnet);
      await ref
          .doc(auth.currentUser!.uid.toString())
          .collection('AddToCart')
          .doc(id)
          .update(
            donation.toJson(),
            //     );

            // await firestore.collection('AddToCart').doc(id).update(
            //       donation.toJson(),
          );
      print("success update to cart");
      Get.back();
    } catch (e) {
      Get.snackbar(
        'Error deleted data',
        e.toString(),
      );
    }
  }

  updateAddress({
    String? title,
    String? subTitle,
    String? description,
    String? count,
    String? payment,
    String? name,
    String? rename,
    String? documnet,
  }) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      userDoc = await firestore.collection('usersDetails').doc(uid).get();
      // get id
      var allDocs = await ref
          .doc(auth.currentUser!.uid.toString())
          .collection('AddToCart')
          .get();
      int len = allDocs.docs.length + 1;
      // String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      // String thumbnail = await _uploadImageToStorage("Video $len", videoPath);

      AddToCartModel donation = AddToCartModel(
          title: title,
          subTitle: subTitle,
          description: description,
          count: count,
          payment: payment,
          name: name,
          rename: rename,
          document: documnet);

      await ref
          .doc(auth.currentUser!.uid.toString())
          .collection('AddToCart')
          .doc('AddToCartList$len')
          .update(
            donation.toJson(),
          );
      print("success address");
    } catch (e) {
      Get.snackbar(
        'Error Uploading Video',
        e.toString(),
      );
    }
  }

  final Rx<List<AddToCartModel>> _donationList = Rx<List<AddToCartModel>>([]);
  RxBool isLOading = false.obs;

  // ignore: non_constant_identifier_names
  List<AddToCartModel> get DonationList => _donationList.value;
  @override
  void onInit() {
    super.onInit();
    get();
  }

  Future get() async {
    try {
      isLOading(true);
      _donationList.bindStream(ref
          .doc(auth.currentUser!.uid.toString())
          .collection('AddToCart')
          .snapshots()
          .map((QuerySnapshot query) {
        List<AddToCartModel> retVal = [];
        for (var element in query.docs) {
          retVal.add(
            AddToCartModel.fromSnap(element),
          );
        }
        return retVal;
      }));
    } catch (e) {
      print(e);
    } finally {
      isLOading(false);
    }
  }

  // donateBlood(String id) async {
  //   DocumentSnapshot doc =
  //       await firestore.collection('donationRequest').doc(id).get();
  //   var uid = authController.user.uid;
  //   if ((doc.data() as dynamic)['likes'].contains(uid)) {
  //     await firestore.collection('donationRequest').doc(id).update({
  //       'likes': FieldValue.arrayRemove([uid]),
  //     });
  //   } else {
  //     await firestore.collection('donationRequest').doc(id).update({
  //       'likes': FieldValue.arrayUnion([uid]),
  //     });
  //   }
  // }

  // donateRequest({String id, String uid}) async {}

  // shareBlood(String id) async {
  //   DocumentSnapshot doc =
  //       await firestore.collection('donationRequest').doc(id).get();
  //   var uid = authController.user.uid;
  //   if ((doc.data() as dynamic)['share'].contains(uid)) {
  //     await firestore.collection('donationRequest').doc(id).update({
  //       'share': FieldValue.arrayRemove([uid]),
  //     });
  //   } else {
  //     await firestore.collection('donationRequest').doc(id).update({
  //       'share': FieldValue.arrayUnion([uid]),
  //     });
  //   }
  // }
}
