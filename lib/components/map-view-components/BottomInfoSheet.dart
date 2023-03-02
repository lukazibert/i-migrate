import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_migrate/components/map-view-components/CountryInfo.dart';
import '../../views/CoutryInfoView.dart';
import 'CoutryInfoList.dart';
import '../../controllers/GoogleMapViewController.dart';

class BottomInfoSheet extends StatelessWidget {
  BottomInfoSheet({super.key});
  final mapViewController = Get.put(MapViewController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 7.0,
      bottom: 0,
      child: GestureDetector(
        onVerticalDragEnd: (details) {
          if (mapViewController.sheetExpanded.value &&
              !mapViewController.showCoutryList.value &&
              details.velocity.pixelsPerSecond.dy < 0) {
            mapViewController.setFullSpecificCountryView(true);
            Future.delayed(Duration(milliseconds: 350), () {
              Get.to(() => CoutryInfoView());
              mapViewController.resetState();
            });
          } else if (details.velocity.pixelsPerSecond.dy < 0) {
            mapViewController.openSearch();
          } else if (details.velocity.pixelsPerSecond.dy > 0) {
            mapViewController.closeSearch();
            // mapViewController.clearSearchInput();
            // mapViewController.showSearch();
            // mapViewController.setCoutryInfo(false);
          }
        },
        // onVerticalDragStart: (details) {
        //   mapViewController.setSheetStartY(details.globalPosition.dy);
        // },
        // onVerticalDragUpdate: (details) {
        //   // if (mapViewController.bottomSheetOpen.value &&
        //   //     mapViewController.sheetStartY.value >
        //   //         mapViewController.sheetCurrentY.value) {
        //   //   // mapViewController.setWholeInfo(true);
        //   //   // mapViewController.hideSearch();
        //   //   Get.to(CoutryInfoView());
        //   // }

        //   mapViewController.setSheetCurrentY(details.globalPosition.dy);
        //   if (mapViewController.bottomSheetOpen.value &&
        //       mapViewController.sheetStartY.value >
        //           mapViewController.sheetCurrentY.value &&
        //       mapViewController.sheetStartY.value -
        //               mapViewController.sheetCurrentY.value >
        //           500) {
        //     // mapViewController.setWholeInfo(true);
        //     // mapViewController.hideSearch();
        //     // Get.to(CoutryInfoView());
        //     print("up");
        //   }
        //   if (mapViewController.sheetStartY.value >
        //       mapViewController.sheetCurrentY.value) {
        //     mapViewController.openSearch();
        //   }

        //   if (mapViewController.bottomSheetOpen.value &&
        //       mapViewController.sheetStartY.value <
        //           mapViewController.sheetCurrentY.value) {
        //     mapViewController.closeSearch();
        //     mapViewController.clearSearchInput();
        //     mapViewController.showSearch();
        //     mapViewController.setCoutryInfo(false);
        //   }
        // },
        child: Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              height: !mapViewController.fullSpecificCountryView.value
                  ? (mapViewController.sheetExpanded.value
                      ? MediaQuery.of(context).size.height * 0.7
                      : 40.0)
                  : MediaQuery.of(context).size.height * 0.9,
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
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DragHandle(),
                  (mapViewController.sheetExpanded.value
                      ? (mapViewController.showCoutryList.value
                          ? CoutryInfoList()
                          : CountryInfo())
                      : Container()),
                ],
              ),
            )),
      ),
    );
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
