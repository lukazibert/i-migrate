import 'package:flutter/material.dart';
import 'package:i_migrate/views/GoogleMapsView.dart';
import 'package:i_migrate/views/GoogleMapsView.dart';
import 'package:i_migrate/views/SelectionView.dart';
import 'components/CustomAppBar.dart';
import 'components/CustomBottomNavigationBar.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  int _currentPageIndex = 0;

  final List<CustomAppBar?> _appBarList = [
    null,
    CustomAppBar(
        title: "Selection",
        leadingIcon: Container(
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
      leadingIcon: Container(
        width: 28,
        height: 28,
      ),
      tailIcon: Container(
        width: 28,
        height: 28,
      ),
    ),
    CustomAppBar(
      title: "User Profile",
      leadingIcon: Container(
        width: 28,
        height: 28,
      ),
      tailIcon: Container(
        width: 28,
        height: 28,
      ),
    )
  ];

  final PageController _pageController = PageController(initialPage: 0);
  bool _disableScroll = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page == 0) {
        setState(() {
          _disableScroll = true;
        });
      } else {
        setState(() {
          _disableScroll = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarList[_currentPageIndex],
      body: PageView.builder(
        physics: _disableScroll
            ? NeverScrollableScrollPhysics()
            : ClampingScrollPhysics(),
        controller: _pageController,
        itemCount: _appBarList.length,
        itemBuilder: ((context, index) {
          switch (index) {
            case 0:
              return GoogleMapsView();
            case 1:
              return SelectionView();
            case 2:
              return Container();
            case 3:
              return Container();
            default:
              return GoogleMapsView();
          }
        }),
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
      bottomNavigationBar: MyCustomBottomNavigtionBar(
        currentIndex: _currentPageIndex,
        onClick: (selectedPageIndex) => {
          setState((() => {
                _currentPageIndex = selectedPageIndex,
                _pageController.animateToPage(
                  selectedPageIndex,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                )
              }))
        },
      ),
    );
  }
}
