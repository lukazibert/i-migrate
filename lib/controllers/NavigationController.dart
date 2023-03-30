import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final currentPageIndex = 0.obs;

  setCurrentPageIndex(int newIndex) => currentPageIndex(newIndex);

  final pageController = PageController(initialPage: 0).obs;

  // set
}
