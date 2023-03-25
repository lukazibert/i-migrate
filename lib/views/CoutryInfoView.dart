import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i_migrate/components/CustomAppBar.dart';
import 'package:i_migrate/components/CustomBottomNavigationBar.dart';
import 'package:i_migrate/controllers/NavigationController.dart';
import '../components/cards/BulletPointCard.dart';
import '../controllers/GoogleMapViewController.dart';
import '../controllers/SelectionViewController.dart';

class CoutryInfoView extends StatelessWidget {
  bool showAddCountryIcon;

  CoutryInfoView({super.key, required this.showAddCountryIcon});
  final mapViewController = Get.put(MapViewController());
  final navigationController = Get.put(NavigationController());
  final selectionController = Get.put(SelectionViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leadingIcon: IconButton(
            icon: Image.asset(
              "lib/assets/Icons/Arrow icon.png",
              width: 28.0,
              height: 28.0,
            ),
            onPressed: () {
              mapViewController.closeSearch();
              Get.back();
            },
          ),
          title: "Germany",
          tailIcon: (showAddCountryIcon
              ? IconButton(
                  icon: Image.asset(
                    "lib/assets/Icons/Plus icon.png",
                    width: 28.0,
                    height: 28.0,
                  ),
                  onPressed: () {
                    navigationController.setCurrentPageIndex(1);
                    Get.back();
                    navigationController.pageController.value.jumpToPage(
                      navigationController.currentPageIndex.value,
                    );
                    selectionController.clearSelectedValues();
                  },
                )
              : Container(
                  height: 28,
                  width: 28,
                ))),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: BulletPointCard(
                  index: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: BulletPointCard(
                  index: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: BulletPointCard(
                  index: 0,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyCustomBottomNavigtionBar(
        currentIndex: 0,
        onClick: (selectedPageIndex) {
          navigationController.setCurrentPageIndex(selectedPageIndex);
          Get.back();
          navigationController.pageController.value.jumpToPage(
            navigationController.currentPageIndex.value,
          );
        },
      ),
    );
  }
}
