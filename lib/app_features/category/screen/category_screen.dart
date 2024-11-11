import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/constants/strings/fixed_text_string.dart';
import 'package:shop/app_core/pakages/cached_network_image_pakage.dart';
import 'package:shop/app_core/pakages/loading_pakage.dart';
import 'package:shop/app_core/routes/routs_names.dart';
import 'package:shop/app_features/category/controller/category_controller.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      builder: (controller) {
        return controller.categoryResponse == null
            ? LoadingPakage(color: Theme.of(context).primaryColor)
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ---------------------------- Text category ----------------------------
                    Text(
                      FixedTextString.textCategories,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: GridView.builder(
                        itemCount:
                            controller.categoryResponse?.categories?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 110,
                        ),
                        itemBuilder: (context, index) {
                          final category =
                              controller.categoryResponse!.categories![index];
                          return GestureDetector(
                            onTap: () => Get.toNamed(
                              NamedRouts.routeProduct,
                              arguments: {'categoryId': category.id},
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                        color: Theme.of(context).dividerColor,
                                        width: 1),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        offset: const Offset(0, 1),
                                        color: const Color(0xff14489e)
                                            .withOpacity(0.15),
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: CachedNetworkImagePakage(
                                      imageUrl: category.image ?? ''),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  category.title ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
