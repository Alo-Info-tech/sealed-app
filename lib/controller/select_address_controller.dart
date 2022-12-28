import 'package:get/get.dart';

class SelectAddressController extends GetxController {
  // RxInt value = 0.obs;

  // void add() {
  //   value.value++;
  //   update();
  // }

  // void subtract() {
  //   value.value--;
  //   update();
  // }
  var placeorderpickup = ''.obs;
  var placeorderdelivery = "".obs;
  var esspick = ''.obs;
  var essdelivery = ''.obs;
  var bankpick = ''.obs;
  var bankdelivery = ''.obs;
  var medipickup = ''.obs;
  var medidelivery = ''.obs;
  var notarypick = ''.obs;
  var notarydeliv = ''.obs;

  // var pickLatlong = 0.0.obs;
  //var deliveryLatlng = 0.0;
  void placeorderpick(String? address) {
    placeorderpickup = RxString(address.toString());
    // placeorderdelivery = RxString(address.toString());
    //  print(placeorderdelivery);

    update();
  }

  void placedelivery(String? address) {
    // placeorderpickup = RxString(address.toString());
    placeorderdelivery = RxString(address.toString());
    print(placeorderdelivery);

    update();
  }

  void essentialpick(String? address) {
    esspick = RxString(address.toString());
    // placeorderdelivery = RxString(address.toString());
    //  print(placeorderdelivery);

    update();
  }

  void essentialdelivery(String? address) {
    essdelivery = RxString(address.toString());
    // placeorderdelivery = RxString(address.toString());
    //  print(placeorderdelivery);

    update();
  }

  void bankpickk(String? address) {
    bankpick = RxString(address.toString());
    // placeorderdelivery = RxString(address.toString());
    //  print(placeorderdelivery);

    update();
  }

  void bankdeliveryy(String? address) {
    bankdelivery = RxString(address.toString());
    // placeorderdelivery = RxString(address.toString());
    //  print(placeorderdelivery);

    update();
  }

  void medicalpick(String? address) {
    medipickup = RxString(address.toString());
    // placeorderdelivery = RxString(address.toString());
    //  print(placeorderdelivery);

    update();
  }

  void medicaldelivery(String? address) {
    medidelivery = RxString(address.toString());
    // placeorderdelivery = RxString(address.toString());
    //  print(placeorderdelivery);

    update();
  }

  void notarypickup(String? address) {
    notarypick = RxString(address.toString());
    // placeorderdelivery = RxString(address.toString());
    //  print(placeorderdelivery);

    update();
  }

  void notarydelivery(String? address) {
    notarydeliv = RxString(address.toString());
    // placeorderdelivery = RxString(address.toString());
    //  print(placeorderdelivery);

    update();
  }
  // void pickLtatong(double picklat) {
  //   pickLatlong = RxDouble(picklat);
  // }
}
