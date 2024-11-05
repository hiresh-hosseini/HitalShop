import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/pakages/iconsax_pakage.dart';

class HomeController extends GetxController {
  PageController pageController = PageController();
  int currentPage = 0;

  final List<MenuItem> menuItems = [
    MenuItem(icon: IconsaxPakage.element_3),
    MenuItem(icon: IconsaxPakage.shoppingCart),
    MenuItem(icon: IconsaxPakage.heart),
    MenuItem(icon: IconsaxPakage.user),
  ];

  // ------------------------ For scroll screen ------------------------
  void changePage(int page) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    currentPage = page;
    update();
  }
}

class MenuItem {
  IconData icon;

  MenuItem({required this.icon});
}
