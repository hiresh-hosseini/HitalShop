import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/pakages/iconsax_pakage.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key, this.title, this.widget});

  final String? title;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff6a6a6a).withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              title ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Theme.of(context).dividerColor, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff6a6a6a).withOpacity(0.15),
                      blurRadius: 6,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child:
                    IconsaxPakage(icon: IconsaxPakage.arrowLeft2, iconSize: 24),
              ),
            ),
          ),
          widget ?? const SizedBox(),
        ],
      ),
    );
  }
}
