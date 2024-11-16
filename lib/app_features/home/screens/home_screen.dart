import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/pakages/iconsax_pakage.dart';
import 'package:shop/app_core/pakages/screen_util_pakage.dart';
import 'package:shop/app_core/widgets/button_navigation.dart';
import 'package:shop/app_features/category/screen/category_screen.dart';
import 'package:shop/app_features/home/controllers/home_controller.dart';
import 'package:shop/app_features/home/screens/dashboard_screen.dart';
import 'package:shop/app_features/profile/screens/bookmark_screen.dart';
import 'package:shop/app_features/profile/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: ScreenUtilPakage.screenWidth,
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtilPakage.r(12),
                    vertical: ScreenUtilPakage.r(12)),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xffeeeeee),
                            ),
                          ),
                          child: IconsaxPakage(
                              icon: IconsaxPakage.bag_2, iconSize: 26.0),
                        ),
                        // controller.cartResponse == null
                        //         ? Container()
                        //         :
                        Visibility(
                          // visible:
                          // controller.cartResponse!.totalItems != 0,
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffff0000),
                            ),
                            child: Center(
                              child: Text(
                                // controller.cartResponse!.totalItems
                                // .toString(),
                                'totalItems',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset('assets/images/h.webp', height: 50),
                    const Spacer(),
                    GestureDetector(
                      // onTap: () => Get.to(() => const ProductsListScreen()),
                      onTap: () {},
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xffeeeeee),
                          ),
                        ),
                        child: IconsaxPakage(
                          icon: IconsaxPakage.searchNormal,
                          iconSize: 26.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const DashboardScreen(),
                    const CategoryScreen(),
                    Container(color: Colors.red),
                    const BookmarksScreen(),
                    const ProfileScreen(),
                  ],
                ),
              ),
              ButtonNavigation(),
            ],
          ),
        ),
      );
    });
  }
}
