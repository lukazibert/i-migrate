import 'package:flutter/material.dart';
import 'package:i_migrate/controllers/NavigationController.dart';
import 'package:i_migrate/views/GoogleMapsView.dart';
import 'package:i_migrate/views/GoogleMapsView.dart';
import 'package:i_migrate/views/SelectionView.dart';
import 'components/CustomAppBar.dart';
import 'components/CustomBottomNavigationBar.dart';
import 'dart:developer';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: Composition(),
    );
  }
}

class Composition extends StatelessWidget {
  Composition({super.key});

  final navigationController = Get.put(NavigationController());

  final List<CustomAppBar?> _appBarList = [
    null,
    CustomAppBar(
        title: "Selection",
        leadingIcon: const SizedBox(
          width: 28,
          height: 28,
        ),
        tailIcon: IconButton(
          icon: Image.asset(
            'lib/assets/Icons/CompareIcon.png',
          ),
          onPressed: () {},
          iconSize: 28.0,
        )),
    CustomAppBar(
      title: "Migration Agent",
      leadingIcon: const SizedBox(
        width: 28,
        height: 28,
      ),
      tailIcon: const SizedBox(
        width: 28,
        height: 28,
      ),
    ),
    CustomAppBar(
      title: "User Profile",
      leadingIcon: const SizedBox(
        width: 28,
        height: 28,
      ),
      tailIcon: const SizedBox(
        width: 28,
        height: 28,
      ),
    )
  ];

  final PageController _pageController = PageController(initialPage: 0);

  // bool _disableScroll = false;

  // @override
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _appBarList[navigationController.currentPageIndex.value],
        body: PageView.builder(
          physics: navigationController.currentPageIndex.value == 0
              ? const NeverScrollableScrollPhysics()
              : const ClampingScrollPhysics(),
          controller: _pageController,
          itemCount: _appBarList.length,
          itemBuilder: ((context, index) {
            switch (index) {
              case 0:
                return GoogleMapsView();
              case 1:
                return SelectionView();
              case 2:
                // Migratin agent view
                return Container();
              case 3:
                // User profile view
                return Container();
              default:
                return GoogleMapsView();
            }
          }),
          onPageChanged: (index) {
            navigationController.setCurrentPageIndex(index);
          },
        ),
        bottomNavigationBar: MyCustomBottomNavigtionBar(
          currentIndex: navigationController.currentPageIndex.value,
          onClick: (selectedPageIndex) {
            navigationController.setCurrentPageIndex(selectedPageIndex);
            _pageController.animateToPage(
              navigationController.currentPageIndex.value,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
    );
  }
}
