import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../controllers/GoogleMapViewController.dart';

class GoogleMapWidget extends StatelessWidget {
  GoogleMapWidget({super.key});

  final mapViewController = Get.put(MapViewController());

  void _onMapCreated(GoogleMapController controller) {
    mapViewController.setGoogleMapController(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.terrain,
      onMapCreated: _onMapCreated,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      initialCameraPosition: const CameraPosition(
        target: LatLng(48.8588443, 2.2943506),
        zoom: 4.0,
      ),
      markers: {
        // Add a marker for Slovenia
        Marker(
            markerId: const MarkerId("Slovenia"),
            position: const LatLng(46.151241, 14.995463),
            infoWindow: const InfoWindow(title: "Slovenia"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            onTap: () {
              mapViewController.focusCoutry();
              mapViewController.animateCamera(
                  CameraPosition(target: LatLng(43.7, 14.995463), zoom: 6.8));
            }),
        // Add a marker for Germany
        Marker(
          markerId: const MarkerId("Germany"),
          position: const LatLng(51.165691, 10.451526),
          infoWindow: const InfoWindow(title: "Germany"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          onTap: () {
            mapViewController.focusCoutry();
            mapViewController.animateCamera(
                CameraPosition(target: LatLng(42.165691, 10.451526), zoom: 5));
          },
        ),
        // Add a marker for UK
        Marker(
          markerId: const MarkerId("UK"),
          position: const LatLng(55.378051, -3.435973),
          infoWindow: const InfoWindow(title: "UK"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          onTap: () {
            mapViewController.focusCoutry();
            mapViewController.animateCamera(CameraPosition(
                target: LatLng(27.378051, -3.435973), zoom: 3.5));
          },
        ),
      },
    );
  }
}
