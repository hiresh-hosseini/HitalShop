import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_features/product/controller/product_controller.dart';

class CategoryListWidget extends StatelessWidget {
  CategoryListWidget({super.key});
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        itemCount: controller.categoryList!.length,
        itemBuilder: (context, index) {
          var category = controller.categoryList![index];

          //------------------------------ OnTap -----------------------------
          return GestureDetector(
            onTap: () => controller.selectCategory(category.id!),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: controller.selectedCategoryId == category.id!
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 1),
                borderRadius: BorderRadius.circular(100),
              ),

              //------------------------------ Text -----------------------------
              child: Center(
                child: Text(
                  category.title ?? '',
                  style: TextStyle(
                    color: controller.selectedCategoryId == category.id!
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
