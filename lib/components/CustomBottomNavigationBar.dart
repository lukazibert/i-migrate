import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/NavigationController.dart';

class MyCustomBottomNavigtionBar extends StatelessWidget {
  int currentIndex;
  Function onClick;
  MyCustomBottomNavigtionBar({
    super.key,
    required this.currentIndex,
    required this.onClick,
  });

  final navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: currentIndex == 0
            ? BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                )
              ])
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavigationBarItem(
                onClick: () => onClick(0),
                icon: Icons.map_outlined,
                selected: navigationController.currentPageIndex.value == 0
                    ? true
                    : false),
            NavigationBarItem(
                onClick: () => onClick(1),
                icon: Icons.compare_arrows,
                selected: navigationController.currentPageIndex.value == 1
                    ? true
                    : false),
            NavigationBarItem(
                onClick: () => onClick(2),
                icon: Icons.support_agent,
                selected: navigationController.currentPageIndex.value == 2
                    ? true
                    : false),
            NavigationBarItem(
                onClick: () => onClick(3),
                icon: Icons.account_circle_outlined,
                selected: navigationController.currentPageIndex.value == 3
                    ? true
                    : false),
          ],
        ),
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  IconData icon;
  bool selected;
  Function onClick;

  NavigationBarItem(
      {super.key,
      required this.icon,
      required this.selected,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onClick(),
        child: Container(
          // height: 100,
          padding: EdgeInsets.all(30),
          child: Icon(icon,
              size: 28.0, color: selected ? Color(0xFF4F7E93) : Colors.black),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    width: 3.0,
                    color: selected ? Color(0xFF4F7E93) : Colors.transparent)),
          ),
        ),
      ),
    );
  }
}
