import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:i_migrate/controllers/GoogleMapViewController.dart';
import 'package:i_migrate/controllers/NavigationController.dart';
import 'package:i_migrate/views/GoogleMapsView.dart';
import 'package:i_migrate/views/GreetingView.dart';
import 'package:i_migrate/views/InterviewView.dart';
import 'package:i_migrate/views/LoadingView.dart';
import 'package:i_migrate/views/MigrationAgentView.dart';
import 'package:i_migrate/views/Authentication/Login.dart';
import 'package:i_migrate/views/Authentication/Register.dart';
import 'package:i_migrate/views/GoogleMapsView.dart';
import 'package:i_migrate/views/ProfileView.dart';
import 'package:i_migrate/views/SelectionView.dart';
import 'package:i_migrate/views/VizaListAPI.dart';
import 'components/CustomAppBar.dart';
import 'components/CustomBottomNavigationBar.dart';
import 'package:get/get.dart';

import 'controllers/SelectionViewController.dart';

void main() {
  runApp(const MyApp());
}

final navigationController = Get.put(NavigationController());

final selectionController = Get.put(SelectionViewController());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'i-migrate',
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
  bool authenticated = false;
  String registerOrLogin = 'register';
  List<Map> regiterdUsers = [
    {'name': 'd', 'email': 'd@gmail.com', 'password': 'd'},
    {'name': 'dorde', 'email': 'dorde@gmail.com', 'password': '123'},
    {'name': 'dorde', 'email': 'dorde@gmail.com', 'password': '123'},
    {'name': 'dorde', 'email': 'dorde@gmail.com', 'password': '123'},
    {'name': 'test_user', 'email': 'testuser@gmail.com', 'password': 'test'}
  ];

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

  final PageController _pageController = PageController(initialPage: 0);

  isLogedin(widget) {
    if (authenticated) {
      return widget;
    } else {
      if (registerOrLogin == 'register') {
        return Register(onClick: (selectedPageIndex) {
          navigationController.setCurrentPageIndex(selectedPageIndex);
          _pageController.animateToPage(
            navigationController.currentPageIndex.value,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }, toLogin: () {
          setState(() {
            registerOrLogin = 'login';
          });
        }, onRegister: (user) {
          setState(() {
            regiterdUsers.add(user);
            registerOrLogin = 'login';
          });
        });
      } else {
        return Login(
            onClick: (selectedPageIndex) {
              navigationController.setCurrentPageIndex(selectedPageIndex);
              _pageController.animateToPage(
                navigationController.currentPageIndex.value,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            toRegister: () {
              setState(() {
                registerOrLogin = 'register';
              });
            },
            onLogin: () {
              setState(() {
                authenticated = true;
              });
            },
            regiterdUsers: regiterdUsers);
      }
    }
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingView()
        : isLogedin(
            MainView(),
            // ),
          );
  }
}

class MainView extends StatelessWidget {
  MainView({super.key});

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

    return Obx(
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
                return MigrationAgentView();
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
