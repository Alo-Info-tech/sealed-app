// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_const, avoid_print, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, unnecessary_null_comparison, no_leading_underscores_for_local_identifiers, unused_element

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:new_mobile_application/colors.dart';

import 'package:new_mobile_application/pages/place_order_filled_screen.dart';
import 'package:page_transition/page_transition.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  static const kGoogleApiKey = 'AIzaSyCMwJJ0TXLf-eLQGaWnEeWZAhvxNvtw92A';
  final homeScaffoldKey = GlobalKey<ScaffoldState>();

//address for all details

  // ignore: prefer_typing_uninitialized_variables
  var pincode;
  late String long = "";
  late String lat = "";

  final TextEditingController search = TextEditingController();
  LatLng? latlong;
  CameraPosition? _cameraPosition;
  GoogleMapController? _controller;

  late GoogleMapController googleMapController;

  final Mode _mode = Mode.overlay;

  // ignore: prefer_typing_uninitialized_variables
  var add;
  late Position position;
  // ignore: prefer_final_fields
  Set<Marker> _markers = {};
  TextEditingController locationController = TextEditingController();
  bool isAddress = false;
  bool isMap = true;
  String? pos;
  @override
  void initState() {
    isMap = true;
    super.initState();
    _cameraPosition = const CameraPosition(target: LatLng(0, 0), zoom: 10.0);
    getCurrentLocation();
    getCurrentAddress();
    //  displayPrediction();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            (latlong != null)
                ? Container(
                    child: isMap == true
                        ? GoogleMap(
                            initialCameraPosition: _cameraPosition!,
                            markers: _markers,
                            mapType: MapType.normal,
                            onMapCreated: (GoogleMapController controller) {
                              googleMapController = controller;
                            },
                          )
                        : Container(),
                  )
                : Container(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 50),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: firstColor,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 200,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Icon(MdiIcons.helpCircleOutline),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Help",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 340,
                ),
                InkWell(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> PlaceOrderFilledScreen()));
                     
                    
                  },
                  child: Container(
                    width: 325,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                            bottomLeft: Radius.circular(18),
                            bottomRight: Radius.circular(18)),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          width: 325,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: const Radius.circular(18),
                                  topRight: const Radius.circular(18)),
                              color: firstColor),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Row(
                              children: const [
                                Text(
                                  "Order ID: 6527236",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 43,
                                ),
                                Text(
                                  "10 Dec 2022 09.30 AM",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '  Delivery partner assigned ',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text("  Arriving in 12 mins"),
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 80,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color.fromARGB(
                                        255, 246, 246, 246)),
                                child: Column(
                                  children: const [
                                    Text(
                                      "OTP",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      "9518",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 20),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    const AssetImage('assets/images/AVA.png'),
                                backgroundColor:
                                    const Color.fromARGB(255, 130, 128, 128),
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Dhinakaran",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: firstColor,
                                          size: 18,
                                        ),
                                        Text(
                                          "Star Partner",
                                          style: TextStyle(
                                              color: firstColor, fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 100,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: firstColor),
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: firstColor,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          "Call",
                                          style: TextStyle(
                                              color: firstColor, fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      // bottomSheet: Container(
      //   color: Colors.white,
      //  height: 150,
      //   width: double.infinity,
      //   child: Padding(
      //     padding: const EdgeInsets.all(0.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.all(12.0),
      //           child: Container(
      //             decoration:
      //                 BoxDecoration(
      //                   border: Border.all(color: Colors.grey),
      //                   borderRadius: BorderRadius.circular(10)),

      //             child: TextFormField(

      //               decoration: const InputDecoration(border: InputBorder.none,

      //                 hintText: 'Enter Street,Area, Location'),),
      //           ),
      //         ),
      //         const SizedBox(height: 10,),
      //         Container(
      //           height: 50,
      //           width: MediaQuery.of(context).size.width/1.2,
      //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      //         color: firstColor
      //           ),
      //           child: ElevatedButton(onPressed: (){
      //             _handlePressButton();

      //           }, child: const Text("Enter Complete address", style: const TextStyle(color: Colors.white, fontSize: 16),),),
      //         )
      //       ],
      //     ),
      //   ),
      // )
    );
  }

  Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    // ignore: unrelated_type_equality_checks
    if (permission != PermissionStatus.granted) {
      LocationPermission permission = await Geolocator.requestPermission();
      // ignore: unrelated_type_equality_checks
      if (permission != PermissionStatus.granted) getLocation();
      return;
    }
    getLocation();
  }

  List<Address> results = [];
  getLocation() async {
    position = await Geolocator.getCurrentPosition();

    //  print("latitute position is ${position.latitude}");

    setState(() {
      latlong = LatLng(position.latitude, position.longitude);
      _cameraPosition = CameraPosition(target: latlong!, zoom: 10.0);
      if (_controller != null)
        // ignore: curly_braces_in_flow_control_structures
        _controller!
            .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition!));

      _markers.add(Marker(
          markerId: const MarkerId("a"),
          draggable: true,
          position: latlong!,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          onDragEnd: (_currentlatLng) {
            latlong = _currentlatLng;
          }));
    });

    getCurrentAddress();
  }

  void getCurrentAddress() async {
    final coordinates = Coordinates(latlong!.latitude, latlong!.longitude);
    results = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = results.first;

    if (first != null) {
      // ignore: prefer_typing_uninitialized_variables
      var address;
      address = first.featureName;
      address = " $address, ${first.subLocality}";
      address = " $address, ${first.subLocality}";
      address = " $address, ${first.locality}";
      address = " $address, ${first.countryName}";
      //address = " $address, ${first.postalCode}";

      // print("address ${first.toString()}");

      //   print('Location is ${locationController.text}');

      // print(address);
      locationController.text = address;
      setState(() {
        pincode = "  ${first.postalCode}";

        add = address;
        //     print("name $name");
        //    print("city $city");
        //   print("district $district");
        //  print("address $addressline");
        // print("pincode $pincode");
        //print("country $country");

        //print('address is ${add.toString()}');
      });
    }
  }

  Future<void> _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        //onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: [""],
        radius: 6,
        decoration: InputDecoration(
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.white))),
        components: [
          Component(Component.country, "pk"),
          Component(Component.country, "in")
        ]);

    displayPrediction(p!, homeScaffoldKey.currentState);
  }

  // void onError(PlacesAutocompleteResponse response) {
  //   homeScaffoldKey.currentState!
  //       // ignore: deprecated_member_use
  //       .showSnackBar(SnackBar(content: Text(response.errorMessage!)));
  // }

  Future<void> displayPrediction(
      Prediction p, ScaffoldState? currentState) async {
    if (p != null) {
      GoogleMapsPlaces places = GoogleMapsPlaces(
          apiKey: kGoogleApiKey,
          apiHeaders: await const GoogleApiHeaders().getHeaders());

      PlacesDetailsResponse detail =
          await places.getDetailsByPlaceId(p.placeId!);
      print('details is ${p.description.toString()}');
      final lat = detail.result.geometry!.location.lat;
      final lng = detail.result.geometry!.location.lng;

      _markers.clear();
      _markers.add(Marker(
          markerId: const MarkerId("0"),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: detail.result.name)));

      setState(() {
        isAddress = true;
        add = p.description.toString();
      });

      googleMapController
          .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
    }
  }
}
