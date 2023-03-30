import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i_migrate/views/GoogleMapsView.dart';

class MapViewController extends GetxController {
  //  Search button

  //  True if the search button is visible on screen
  final searchButtonVisible = true.obs;

  //  True if the search button is expanded in to the inut field
  final searchButtonExpanded = false.obs;

  //  Data the user enters into the search input field
  final searchInputValue = "".obs;

  setSearchButtonVisibility(bool val) => searchButtonVisible(val);

  setSearchButtonExpanded(bool val) => searchButtonExpanded(val);

  setSearchInputValue(String val) => searchInputValue(val);

  clearSearchInputField() => searchInputValue("");

  filterCoutry() {
    if (searchInputValue == "") {
      return coutries;
    } else {
      return coutries
          .where((name) =>
              name.toLowerCase().contains(searchInputValue.toLowerCase()))
          .toList();
    }
  }

  final coutries = [
    "Germany",
    "Italy",
    "United Kingdom",
    "Slovenia",
  ];

  // Bottom Sheet

  //  True if bottom sheet is open/expanded
  final sheetExpanded = false.obs;

  //  Indicates whether the list of countries is currently being displayed (true)
  //  or if a selected country is currently being displayed (false)
  final showCoutryList = true.obs;

  // If true animate to whole view for specific country
  final fullSpecificCountryView = false.obs;

  setFullSpecificCountryView(bool val) => fullSpecificCountryView(true);

  //  Idicates which country from the data array is being utilized.
  final selectedCoutryIndex = 0.obs;

  openSearch() {
    searchButtonExpanded(true);
    sheetExpanded(true);
  }

  closeSearch() {
    searchButtonExpanded(false);
    sheetExpanded(false);
    resetState();
  }

  selectSpecificCountry() {
    showCoutryList(false);
    searchButtonVisible(false);
  }

  resetState() {
    searchButtonExpanded(false);
    searchButtonVisible(true);
    sheetExpanded(false);
    showCoutryList(true);
    clearSearchInputField();
    fullSpecificCountryView(false);
  }

  focusCoutry() {
    searchButtonVisible(false);
    sheetExpanded(true);
    showCoutryList(false);
  }

  //  Google Maps
  final mapController = Rx<dynamic>(null);

  setGoogleMapController(GoogleMapController controller) {
    mapController(controller);
  }

  animateCamera(CameraPosition cameraPosition) {
    // final GoogleMapsView controller = googleMapsController;
    mapController.value
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  final germanyData = [
    {
      "name": "Visa Requierments",
      "bulletPoints": [
        "Valid Passport",
        "Free from criminal convictions ",
        "Non-EU citizens must have a valid work visa"
      ]
    },
  ].obs;
}
