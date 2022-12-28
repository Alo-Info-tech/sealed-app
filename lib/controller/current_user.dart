// import 'package:blood/utilities/constants.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:new_mobile_application/utlities/const.dart';

// class ProfileController extends GetxController {
//   final Rx<Map<String, dynamic>> _user = Rx<Map<String, dynamic>>({});
//   Map<String, dynamic> get user => _user.value;

//   Rx<String> _uid = "".obs;
//   updateUserId(String uid) {
//     _uid.value = uid;
//     getUserData();
//   }

//   bool? isFollowing;

//   getUserData() async {
//     DocumentSnapshot userDoc =
//         await firestore.collection('usersAccount').doc(_uid.value).get();
//     final userData = userDoc.data() as dynamic;
    

//     var followerDoc = await firestore
//         .collection('usersAccount')
//         .doc(_uid.value)
//         .collection('followers')
//         .get();
//     var followingDoc = await firestore
//         .collection('usersAccount')
//         .doc(_uid.value)
//         .collection('following')
//         .get();
  

//     firestore
//         .collection('usersAccount')
//         .doc(_uid.value)
//         .collection('followers')
//         .doc(authController.user!.uid)
//         .get()
//         .then((value) {
//       if (value.exists) {
//         isFollowing = true;
//       } else {
//         isFollowing = false;
//       }
//     });

//     _user.value = {
//       'followers': followers.toString(),
//       'following': following.toString(),
//       'isFollowing': isFollowing,
//       'likes': likes.toString(),
//       'profilePhoto': profilePhoto,
//       'name': name,
//       // 'thumbnails': thumbnails,
//     };
//     update();
//   }

//   followUser() async {
//     var doc = await firestore
//         .collection('usersAccount')
//         .doc(_uid.value)
//         .collection('followers')
//         .doc(authController.user!.uid)
//         .get();

//     if (!doc.exists) {
//       await firestore
//           .collection('usersAccount')
//           .doc(_uid.value)
//           .collection('followers')
//           .doc(authController.user!.uid)
//           .set({});
//       await firestore
//           .collection('usersAccount')
//           .doc(authController.user!.uid)
//           .collection('following')
//           .doc(_uid.value)
//           .set({});
//       _user.value.update(
//         'followers',
//         (value) => (int.parse(value) + 1).toString(),
//       );
//       isFollowing = true;
//     } else {
//       await firestore
//           .collection('usersAccount')
//           .doc(_uid.value)
//           .collection('followers')
//           .doc(authController.user.uid)
//           .delete();
//       await firestore
//           .collection('usersAccount')
//           .doc(authController.user!.uid)
//           .collection('following')
//           .doc(_uid.value)
//           .delete();
//       _user.value.update(
//         'followers',
//         (value) => (int.parse(value) - 1).toString(),
//       );
//       isFollowing = false;
//     }
//     _user.value.update('isFollowing', (value) => !value);
//     update();
//   }

//   /*follows(String id) async {
//     DocumentSnapshot doc = await firestore
//         .collection('usersAccount')
//         .doc(authController.user.uid)
//         .collection('following') .doc(_uid.value)
//         .get();
//     var uid = authController.user.uid;
//     if ((doc.data() as dynamic)['likes'].contains(uid)) {
//       await firestore.collection('donationRequest').doc(id).update({
//         'likes': FieldValue.arrayRemove([uid]),
//       });
//     } else {
//       await firestore.collection('donationRequest').doc(id).update({
//         'likes': FieldValue.arrayUnion([uid]),
//       });
//     }
//   }*/
// }
