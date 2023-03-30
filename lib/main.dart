import 'package:flutter/material.dart';
import 'package:i_migrate/controllers/NavigationController.dart';
import 'package:i_migrate/views/GoogleMapsView.dart';

import 'package:i_migrate/views/Authentication/Login.dart';
import 'package:i_migrate/views/Authentication/Register.dart';
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

class Composition extends StatefulWidget {
  Composition({
    super.key,
  });

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
    {'name': 'dorde', 'email': 'dorde@gmail.com', 'password': '123'}
  ];

  void initState() {
    super.initState();
  }

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
    ),
  ];

  final PageController _pageController = PageController(initialPage: 0);

  // bool _disableScroll = false;
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
    return Obx(
      () => isLogedin(Scaffold(
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
              // return Register(onClick: (selectedPageIndex) {
              //   navigationController.setCurrentPageIndex(selectedPageIndex);
              //   _pageController.animateToPage(
              //     navigationController.currentPageIndex.value,
              //     duration: const Duration(milliseconds: 300),
              //     curve: Curves.easeInOut,
              //   );
              // });
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
      )),
    );
  }
}
