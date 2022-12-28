import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:new_mobile_application/model/address_model.dart';
import 'package:new_mobile_application/utlities/const.dart';

class AddressListController extends GetxController {
  DocumentSnapshot? userDoc;
  CollectionReference ref =
      FirebaseFirestore.instance.collection('usersDetails');
  addAddress(
      {String? addressLine,
      String? landMark,
      String? city,
      String? district,
      String? state,
      String? country,
      String? pincode}) async {
    try {
      if (addressLine != null) {
        String uid = firebaseAuth.currentUser!.uid;
        userDoc = await firestore.collection('usersDetails').doc(uid).get();
        // get id
        var allDocs = await ref
            .doc(auth.currentUser!.uid.toString())
            .collection('address')
            .get();
        int len = allDocs.docs.length + 1;
        // String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
        // String thumbnail = await _uploadImageToStorage("Video $len", videoPath);

        AddressModel donation = AddressModel(
            addresLine: addressLine,
            landmark: landMark,
            city: city,
            district: district,
            state: state,
            country: country,
            pincode: pincode);

        await ref
            .doc(auth.currentUser!.uid.toString())
            .collection('address')
            .doc('addressList$len')
            .set(
              donation.toJson(),
            );
        print("success address");
      }
     // return Get.snackbar('Error', 'Must Entered all data');
    } catch (e) {
      Get.snackbar(
        'Error Uploading Video',
        e.toString(),
      );
    }
  }

  updateAddress(
      {String? addressLine,
      String? landMark,
      String? city,
      String? district,
      String? state,
      String? country,
      String? pincode}) async {
    try {
      if (addressLine != null) {
        String uid = firebaseAuth.currentUser!.uid;
        userDoc = await firestore.collection('usersDetails').doc(uid).get();
        // get id
        var allDocs = await ref
            .doc(auth.currentUser!.uid.toString())
            .collection('address')
            .get();
        int len = allDocs.docs.length + 1;
        // String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
        // String thumbnail = await _uploadImageToStorage("Video $len", videoPath);

        AddressModel donation = AddressModel(
            addresLine: addressLine,
            landmark: landMark,
            city: city,
            district: district,
            state: state,
            country: country,
            pincode: pincode);

        await ref
            .doc(auth.currentUser!.uid.toString())
            .collection('address')
            .doc('addressList$len')
            .update(
              donation.toJson(),
            );
        print("success address");
      }
      //return Get.snackbar('Error', 'Must Entered all data');
    } catch (e) {
      Get.snackbar(
        'Error Uploading Video',
        e.toString(),
      );
    }
  }

  final Rx<List<AddressModel>> _donationList = Rx<List<AddressModel>>([]);

  Rx<bool> isLoading = false.obs;

  // ignore: non_constant_identifier_names
  List<AddressModel> get DonationList => _donationList.value;
  @override
  void onInit() {
    super.onInit();

    try {
      isLoading(true);
      _donationList.bindStream(ref
          .doc(auth.currentUser!.uid.toString())
          .collection('address')
          .snapshots()
          .map((QuerySnapshot query) {
        List<AddressModel> retVal = [];
        for (var element in query.docs) {
          retVal.add(
            AddressModel.fromSnap(element),
          );
        }
        return retVal;
      }));
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
  @override
  void onReady() {
   
    try {
      isLoading(true);
      _donationList.bindStream(ref
          .doc(auth.currentUser!.uid.toString())
          .collection('address')
          .snapshots()
          .map((QuerySnapshot query) {
        List<AddressModel> retVal = [];
        for (var element in query.docs) {
          retVal.add(
            AddressModel.fromSnap(element),
          );
        }
        return retVal;
      }));
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
    super.onReady();
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
