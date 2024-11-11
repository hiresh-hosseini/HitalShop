import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/pakages/iconsax_pakage.dart';
import 'package:shop/app_features/product/controller/product_controller.dart';

class SortWidget extends StatelessWidget {
  SortWidget({super.key});
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Sort>(
      color: Colors.white,
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      onSelected: (value) => controller.sort(value),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).dividerColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffea5e24).withOpacity(0.19),
              offset: const Offset(0, 1),
              blurRadius: 4,
            ),
          ],
        ),
        child: IconsaxPakage(icon: IconsaxPakage.sort, iconSize: 30),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: Sort(orderColumn: 'id', orderType: 'DESC'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xffdedede),
                  ),
                ),
              ),
              child: const Center(
                child: Text(
                  '‌‌جدیدترین‌',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          PopupMenuItem(
            value: Sort(orderColumn: 'discount', orderType: 'DESC'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xffdedede),
                  ),
                ),
              ),
              child: const Center(
                child: Text(
                  'بیشترین‌تخفیف',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          PopupMenuItem(
            value: Sort(orderColumn: 'price', orderType: 'ASC'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xffdedede),
                  ),
                ),
              ),
              child: const Center(
                child: Text(
                  'ارزان‌ترین',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          PopupMenuItem(
            value: Sort(orderColumn: 'price', orderType: 'DESC'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Center(
                child: Text(
                  'گران‌ترین',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}
