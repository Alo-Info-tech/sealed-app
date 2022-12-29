// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_null_comparison, duplicate_ignore, avoid_print, sort_child_properties_last, depend_on_referenced_packages, unused_import, library_private_types_in_public_api, prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_mobile_application/catogery/add_address_screen.dart';
import 'package:new_mobile_application/colors.dart';
import 'package:page_transition/page_transition.dart';

class MapScreen extends StatefulWidget {
  final String category;
  const MapScreen({Key? key, required this.category}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // static const kGoogleApiKey = '';
  static const kGoogleApiKey = 'AIzaSyDfaG1piL6bYVYsGNX1Lev3f-gptl1M_k8';
  final homeScaffoldKey = GlobalKey<ScaffoldState>();

//address for all details

  // ignore: prefer_typing_uninitialized_variables
  var pincode;
  late String long = "";
  late String lat = "";
  var latpass;
  var lngpass;

  final TextEditingController search = TextEditingController();
  LatLng? latlong;
  LatLng? startLocation = LatLng(8.0325, 77.3196);
  CameraPosition? _cameraPosition;
  GoogleMapController? _controller;
  PolylinePoints polylinePoints = PolylinePoints();

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
    ////  getDirections();
    // markers.add(Marker(
    //   //add start location marker
    //   markerId: MarkerId(startLocation.toString()),
    //   position: startLocation!, //position of marker
    //   infoWindow: InfoWindow(
    //     //popup info
    //     title: 'Starting Point ',
    //     snippet: 'Start Marker',
    //   ),
    //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    // ));
    // markers.add(Marker(
    //   //add distination location marker
    //   markerId: MarkerId(endLocation.toString()),
    //   position: endLocation, //position of marker
    //   infoWindow: InfoWindow(
    //     //popup info
    //     title: 'Destination Point ',
    //     snippet: 'Destination Marker',
    //   ),
    //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    // ));
    super.initState();
  }

  //Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {};
  //polylines to show direction
  // double laaaa = 8.1262;

  // LatLng startLocation = LatLng(laaaa, 77.3196);
  LatLng endLocation = LatLng(8.1833, 77.4119);

  double distance = 0.0;

  @override
  //api payment due to cancelled
  // getDirections() async {
  //   List<LatLng> polylineCoordinates = [];

  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     kGoogleApiKey,
  //     PointLatLng(startLocation!.latitude, startLocation!.longitude),
  //     PointLatLng(endLocation.latitude, endLocation.longitude),
  //     //travelMode: TravelMode.driving,
  //   );

  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //   } else {
  //     //  print(result.errorMessage);
  //   }

  //   //polulineCoordinates is the List of longitute and latidtude.
  //   double totalDistance = 0;
  //   for (var i = 0; i < polylineCoordinates.length - 1; i++) {
  //     totalDistance += calculateDistance(
  //         polylineCoordinates[i].latitude,
  //         polylineCoordinates[i].longitude,
  //         polylineCoordinates[i + 1].latitude,
  //         polylineCoordinates[i + 1].longitude);
  //   }
  //   // print(totalDistance);

  //   setState(() {
  //     distance = totalDistance;
  //   });

  //   //add to the list of poly line coordinates
  //   addPolyLine(polylineCoordinates);
  // }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            // future: getLocation(),
            //////////  //  future: getDirections(),
            builder: (context, snapshot) {
          return SafeArea(
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
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            SizedBox(
                              height: 20,
                            ),
                            //             Container(decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.grey),
                            //     borderRadius: BorderRadius.circular(10)),
                            //               child: TextFormField(
                            //   onTap: (() {
                            //     _handlePressButton();
                            //   }),
                            //   decoration: InputDecoration(
                            //       border: InputBorder.none,
                            //       hintText: ' Search'),
                            // ),)
                            // InkWell(
                            //   onTap: () {
                            //     // print(distance.toString());
                            //   },
                            //   child: Container(
                            //       child: Card(
                            //     child: Container(
                            //         padding: EdgeInsets.all(20),
                            //         child: Text(
                            //             "Total Distance: " +
                            //                 distance.toStringAsFixed(2) +
                            //                 " KM",
                            //             style: TextStyle(
                            //                 fontSize: 20,
                            //                 fontWeight:
                            //                     FontWeight.bold))),
                            //   )),
                            // ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),

                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: firstColor),
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.9,
                        child: TextButton(
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                MdiIcons.mapMarkerOutline,
                                color: Colors.white,
                              ),
                              Text(
                                "Use current Location",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                duration: Duration(milliseconds: 300),
                                type: PageTransitionType.fade,
                                child: AddAddressScreen(
                                  add: add,
                                  latpass: latpass.toString(),
                                  lngpass: lngpass.toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }),
        bottomSheet: Container(
          color: Colors.white,
          height: 250,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      onTap: (() {
                        _handlePressButton();
                      }),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ' Enter Street, Area, Location'),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                // Container(
                //   height: 50,
                //   width: MediaQuery.of(context).size.width / 1.2,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       ),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       _handlePressButton();
                //     },
                //     child: Text(
                //       "Enter Complete address",
                //       style: TextStyle(color: Colors.white, fontSize: 16),
                //     ),
                //   ),
                // )
                isAddress == false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Current Location',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.1,
                                        child: TextButton(
                                          onPressed: () {
                                            // String pos1 = position.longitude
                                            //     .toString();
                                            // String pos2 = position.latitude
                                            //     .toString();
                                            // String pos3 = ',';
                                            // pos = pos1 + pos3 + pos2;

                                            setState(() {
                                              isAddress = true;
                                              lat =
                                                  position.latitude.toString();
                                              long =
                                                  position.longitude.toString();
                                            });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text('Enter Complete Address'),
                                            ],
                                          ),
                                          style: TextButton.styleFrom(
                                            primary: Colors.white,
                                            backgroundColor: firstColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    print(lngpass);
                                  },
                                  child: Text(
                                    add.toString(),
                                    style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AddAddressScreen(
                                              add: add,
                                              latpass: latpass.toString(),
                                              lngpass: lngpass.toString(),
                                            ),
                                          ));
                                    },
                                    child: const Text('Enter Complete Address'),
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: firstColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                // // Center(
                //   child: ElevatedButton(
                //       onPressed: () {
                //         Navigator.push(
                //           context,
                //           PageTransition(
                //             duration: Duration(milliseconds: 500),
                //             type: PageTransitionType.rightToLeft,
                //             child: AddAddressScreen(),
                //           ),
                //         );
                //       },
                //       style: ElevatedButton.styleFrom(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 75, vertical: 15),
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10.0),
                //           ),
                //           primary: firstColor),
                //       child: const Text("Enter Complete Address")),
                // ),
              ],
            ),
          ),
        ));
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

  double curentlat = 0.0;

  List<Address> results = [];
  getLocation() async {
    position = await Geolocator.getCurrentPosition();

    // ignore: avoid_print
    //  print("latitute position is ${position.latitude}");

    setState(() {
      latlong = LatLng(position.latitude, position.longitude);
      startLocation = LatLng(position.latitude, position.longitude);
      curentlat = latlong!.latitude.toDouble();
      print("!!!!!!!!!!!!!!!!!!!!!!!!${startLocation.toString()}");
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

  void getlatlong() async {
    final coordinates = Coordinates(latlong!.latitude, latlong!.longitude);
    results = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = results.first;
    // ignore: unnecessary_null_comparison
    if (first != null) {
      // ignore: prefer_typing_uninitialized_variables
      var address;
      address = first.featureName;
      address = " $address, ${first.subLocality}";
      //address = " $address, ${first.subLocality}";
      address = " $address, ${first.locality}";
      address = " $address, ${first.countryName}";
      //adddddd = first.locality;
      //address = " $address, ${first.postalCode}";

      // print("address ${first.toString()}");

      //   print('Location is ${locationController.text}');
      // ignore: avoid_print
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
        // ignore: avoid_print
        //print('address is ${add.toString()}');
      });
    }
  }

  void getCurrentAddress() async {
    final coordinates = Coordinates(latlong!.latitude, latlong!.longitude);
    results = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = results.first;
    // ignore: unnecessary_null_comparison
    if (first != null) {
      // ignore: prefer_typing_uninitialized_variables
      var address;
      address = first.featureName;
      address = " $address, ${first.subLocality}";
      //address = " $address, ${first.subLocality}";
      address = " $address, ${first.locality}";
      address = " $address, ${first.countryName}";
      //adddddd = first.locality;
      //address = " $address, ${first.postalCode}";

      // print("address ${first.toString()}");

      //   print('Location is ${locationController.text}');
      // ignore: avoid_print
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
        // ignore: avoid_print
        //print('address is ${add.toString()}');
      });
    }
  }

  Future<void> _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        // onError: onError,
        mode: _mode,
        logo: Text(" "),
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
  //       // ignore: deprecated_member_user
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
      setState(() {
        startLocation = LatLng(lat, lng);
        latpass = lat;
        lngpass = lng;
      });

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

var adddddd = "";
