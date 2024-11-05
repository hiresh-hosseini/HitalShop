import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/pakages/iconsax_pakage.dart';
import 'package:shop/app_features/home/controllers/home_controller.dart';

class ButtonNavigation extends StatelessWidget {
  ButtonNavigation({super.key});
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff000000).withOpacity(0.09),
                blurRadius: 6,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                controller.menuItems.length,
                (index) {
                  return Padding(
                    padding: EdgeInsets.only(left: index == 1 ? 50 : 0),
                    child: GestureDetector(
                      onTap: () => controller.changePage(index + 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(controller.menuItems[index].icon),
                          controller.currentPage == index + 1
                              ? Container(
                                  height: 2,
                                  width: 18,
                                  margin: const EdgeInsets.only(top: 4),
                                  color: Theme.of(context).primaryColor,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        // ------------------------- Home button --------------------------
        Positioned(
          bottom: 35,
          child: GestureDetector(
            onTap: () => controller.changePage(0),
            child: Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xff3b7be3),
                    Color(0xff29388b),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Icon(
                IconsaxPakage.home_2,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
