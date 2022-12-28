import 'dart:io';
import 'package:new_mobile_application/model/current_user_model.dart';
import 'package:new_mobile_application/model/user_model.dart' as model;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:new_mobile_application/utlities/const.dart';
//import 'package:image_picker/image_picker.dart';

class AuthUserController extends GetxController {
  static AuthUserController instance = Get.find();
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? verificationId;
  var eid;
//  Rx<bool> showLoading = false as Rx<bool>;

  //register
  Rx<File>? _pickedImage;
  File get profilePhoto => _pickedImage!.value;
  User? get user => _user!.value;

  Rx<User?>? _user;

  @override
  void onReady() {
    _user = Rx<User>(_auth.currentUser!);
    _user!.bindStream(firebaseAuth.authStateChanges());
    //current user
    // ever(_user, _setInitialScreen);
    super.onReady();
  }

//get profile
  var _currentUser;

  List<CurrentUSer> get currentUser => _currentUser.value;

  @override
  void onInit() {
    super.onInit();
    _currentUser!.bindStream(firestore
        .collection('usersDetails')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get);
    update();
  }

  // void pickImage() async {
  //   final pickedImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     Get.snackbar('Profile Picture',
  //         'You have successfully selected your profile picture!');
  //   }

  //   //_pickedImage = Rx<File>(File(pickedImage.path).toString());
  //   _pickedImage = Rx<File>(File(pickedImage.path));
  // }

  // // upload to firebase storage
  // Future<String> _uploadToStorage(File image) async {
  //   Reference ref = firebaseStorage
  //       .ref()
  //       .child('profilePics')
  //       .child(firebaseAuth.currentUser.uid);

  //   UploadTask uploadTask = ref.putFile(image);
  //   TaskSnapshot snap = await uploadTask;
  //   String downloadUrl = await snap.ref.getDownloadURL();
  //   return downloadUrl;
  // }

  // registering the user
  void registerUserProfile({
    String? name,
    String? description,
    String? address,
    String? phone,
    String? dob,
    String? email,
    String? uid,
  }) async {
    try {
      model.User user = model.User(
        name: name,
        address: address,
        email: email,
        description: description,
        phone: phone,
        dob: dob,
        uid: _auth.currentUser!.uid,
      );
      await firestore
          .collection('usersDetails')
          .doc(_auth.currentUser!.uid)
          .set(user.toJson());
      //   Get.off(HomePage());

    } catch (e) {
      // print("error is ${e.toString()}");
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
      );
      return null;
    }
  }

  void signOut() async {
    await _auth.signOut();
    // Get.to(OnBoard());
  }
}
