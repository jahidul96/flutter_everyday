// ignore_for_file: unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMapScreen extends StatefulWidget {
  const ShowMapScreen({Key? key}) : super(key: key);

  @override
  State<ShowMapScreen> createState() => ShowMapScreenState();
}

class ShowMapScreenState extends State<ShowMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  bool isMe = false;

  LatLng? userLocation;

  final List<Marker> _markers = [];
  List<Marker> markerList = [
    const Marker(
      markerId: MarkerId("first"),
      position: LatLng(
        22.3569,
        91.7832,
      ),
      infoWindow: InfoWindow(title: "Hell"),
    ),
    // Marker(
    //   markerId: const MarkerId("second"),
    //   position: const LatLng(
    //     23.4607,
    //     91.1809,
    //   ),
    //   infoWindow: const InfoWindow(title: "Hell"),
    //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    // ),
  ];

  var initialCameraPosition = const CameraPosition(
    target: LatLng(22.3569, 91.7832),
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();

    _markers.addAll(markerList);
  }

// line between places!!
  final Polyline _polyline = const Polyline(
    polylineId: PolylineId("demo"),
    color: Colors.pink,
    points: [
      LatLng(
        22.3569,
        91.7832,
      ),
      LatLng(
        23.4607,
        91.1809,
      ),
    ],
    width: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: GoogleMap(
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              initialCameraPosition: initialCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: Set<Marker>.of(_markers),
            ),
          ),
        ],
      ),
    );
  }
}
