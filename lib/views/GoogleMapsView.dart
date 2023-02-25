import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:permission/permission.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({super.key});

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  late GoogleMapController _mapController;
  bool _searchOpen = false;
  bool _infoSheetOpen = false;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    // _getCurrentLoaction();
  }

  void activateSearch() {
    setState(() {
      _searchOpen = !_searchOpen;
      _infoSheetOpen = !_infoSheetOpen;
    });
  }

  // void _getCurrentLoaction() async {
  //   try {
  //     var permissions = await Permission.getPermissionsStatus(
  //         [PermissionName.Calendar, PermissionName.Camera]);

  //     var permissionNames = await Permission.requestPermissions(
  //         [PermissionName.Calendar, PermissionName.Camera]);

  //     Permission.openSettings;

  //     LocationData currnentLocation = await location.getLocation();
  //     _mapController.animateCamera(CameraUpdate.newCameraPosition(
  //         CameraPosition(
  //             target: LatLng(currnentLocation.latitude ?? 0.0,
  //                 currnentLocation.longitude ?? 0.0),
  //             zoom: 4.0)));
  //   } catch (e) {
  //     print("Error at locaion: " + e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GoogleMap(
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
          ),
          // Add a marker for Germany
          Marker(
            markerId: const MarkerId("Germany"),
            position: const LatLng(51.165691, 10.451526),
            infoWindow: const InfoWindow(title: "Germany"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          ),
          // Add a marker for UK
          Marker(
            markerId: const MarkerId("UK"),
            position: const LatLng(55.378051, -3.435973),
            infoWindow: const InfoWindow(title: "UK"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          ),
        },
      ),
      BottomInfoSheet(
        expandSearch: () => activateSearch(),
        infoSheetOpen: _infoSheetOpen,
      ),
      SearchButton(
          expandInfoSheet: () => activateSearch(), searchOpen: _searchOpen)
    ]);
  }
}

class SearchButton extends StatefulWidget {
  Function expandInfoSheet;
  bool searchOpen;
  SearchButton(
      {super.key, required this.expandInfoSheet, required this.searchOpen});

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  late bool _expandButton;

  @override
  Widget build(BuildContext context) {
    setState(() {
      _expandButton = widget.searchOpen;
    });
    return Positioned(
        right: 7,
        top: MediaQuery.of(context).padding.top + 21,
        child: AnimatedContainer(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 21),
          width: _expandButton ? MediaQuery.of(context).size.width - 14 : 70.0,
          height: 70,
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.white),
          child: GestureDetector(
            onTap: () {
              setState(() {
                // _expandButton = !_expandButton;
                widget.expandInfoSheet();
              });
            },
            child: _expandButton
                ? Container(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                            flex: 12,
                            child: TextField(
                              cursorColor: Color(0xFF4F7E93),
                              decoration: InputDecoration(
                                  hintText: "  Search for a specific coutry",
                                  focusColor: Colors.grey,
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF4F7E93)))),
                            )),
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.search,
                            size: 28.0,
                          ),
                        ),
                      ],
                    ),
                  )
                : const Icon(
                    Icons.search,
                    size: 28.0,
                  ),
          ),
        ));
  }
}

class DragHandle extends StatelessWidget {
  const DragHandle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[400],
      ),
      width: 75.0,
      height: 10,
    );
  }
}

class BottomInfoSheet extends StatefulWidget {
  Function expandSearch;
  bool infoSheetOpen;
  BottomInfoSheet(
      {super.key, required this.expandSearch, required this.infoSheetOpen});

  @override
  State<BottomInfoSheet> createState() => _BottomInfoSheetState();
}

class _BottomInfoSheetState extends State<BottomInfoSheet> {
  late double _animatedContainerHeight;

  @override
  Widget build(BuildContext context) {
    setState(() {
      _animatedContainerHeight = widget.infoSheetOpen
          ? MediaQuery.of(context).size.height * 0.7
          : 40.0;
    });
    return Positioned(
      left: 7.0,
      bottom: 0,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! < 0) {
            setState(() {
              // _animatedContainerHeight =
              //     MediaQuery.of(context).size.height * 0.7;
              widget.expandSearch();
            });
          } else if (details.primaryDelta! > 0 &&
              _animatedContainerHeight > 40) {
            setState(() {
              // _animatedContainerHeight = 40.0;
              widget.expandSearch();
            });
          }
        },
        child: AnimatedContainer(
            // margin: EdgeInsets.symmetric(horizontal: 3.0),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: _animatedContainerHeight,
            width: MediaQuery.of(context).size.width - 14.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28.0),
                  topRight: Radius.circular(28.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [DragHandle()],
            )),
      ),
    );
  }
}
