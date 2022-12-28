// FIREBASE
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_mobile_application/controller/user_controller.dart';

FirebaseAuth auth = FirebaseAuth.instance;

// CONTROLLER
var authController = AuthUserController.instance;

var firebaseAuth = FirebaseAuth.instance;
//var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//address selected
//var placeorderpick = "";
//var placeorderdelivery = "";
// var medicalpick = "";
// var medicaldelivery = "";
// var bankpick = "";
// var bankdelivery = "";
// var essentialpick = "";
// var essentialdelivery = "";
var notarypick = "";
var notarydelivery = "";
var picupAddresss = '';
var deliverAddress = '';
var typeOfDcoument = '';
var chip = "";
List selectedProductTiming = [];
//List isInstruction = [];
//var add = "";
double picklat = 0.10;
double picklng = 0.0;
double delilat = 0.0;
double delilng = 0.0;
