import 'package:flutter/material.dart';
import 'package:i_migrate/controllers/GoogleMapViewController.dart';
import 'package:i_migrate/controllers/NavigationController.dart';
import 'package:i_migrate/views/GoogleMapsView.dart';
import 'package:i_migrate/views/GreetingView.dart';
import 'package:i_migrate/views/InterviewView.dart';
import 'package:i_migrate/views/LoadingView.dart';
import 'package:i_migrate/views/ProfileView.dart';
import 'package:i_migrate/views/SelectionView.dart';
import 'components/CustomAppBar.dart';
import 'components/CustomBottomNavigationBar.dart';
import 'package:get/get.dart';

import 'controllers/SelectionViewController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'i-migrate',
      // home: InterviewView(),
      home: Composition(),
    );
  }
}

class Composition extends StatefulWidget {
  Composition({super.key});

  @override
  State<Composition> createState() => _CompositionState();
}

class _CompositionState extends State<Composition> {
  final navigationController = Get.put(NavigationController());

  final selectionController = Get.put(SelectionViewController());

  final mapViewController = Get.put(MapViewController());

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate data retrieval from a database after 3 seconds
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  // @override
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              if (selectionController.isComparing.value) {
                selectionController.stopComparing();
              } else {
                selectionController.startComparing();
              }
            },
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
      null
    ];

    return isLoading
        ? LoadingView()
        : Obx(
            () => Scaffold(
              appBar: _appBarList[navigationController.currentPageIndex.value],
              body: PageView.builder(
                physics: navigationController.currentPageIndex.value == 0
                    ? const NeverScrollableScrollPhysics()
                    : const ClampingScrollPhysics(),
                controller: navigationController.pageController.value,
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
                      return ProfileView();
                    default:
                      return GoogleMapsView();
                  }
                }),
                onPageChanged: (index) {
                  navigationController.setCurrentPageIndex(index);
                  selectionController.stopComparing();
                  mapViewController.resetState();
                },
              ),
              bottomNavigationBar: MyCustomBottomNavigtionBar(
                currentIndex: navigationController.currentPageIndex.value,
                onClick: (selectedPageIndex) {
                  navigationController.setCurrentPageIndex(selectedPageIndex);
                  navigationController.pageController.value.animateToPage(
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
