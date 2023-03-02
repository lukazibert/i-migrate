import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../components/map-view-components/BottomInfoSheet.dart';
import '../components/map-view-components/GoogleMapWidget.dart';
import '../components/map-view-components/SearchButtton.dart';
import '../controllers/GoogleMapViewController.dart';

class GoogleMapsView extends StatelessWidget {
  GoogleMapsView({super.key});

  final mapViewController = Get.put(MapViewController());

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [GoogleMapWidget(), BottomInfoSheet(), SearchButton()]);
  }
}
