import 'package:get/get.dart';

class NavigationController extends GetxController {
  final currentPageIndex = 0.obs;

  setCurrentPageIndex(int newIndex) => currentPageIndex(newIndex);
}
