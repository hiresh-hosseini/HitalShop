import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/constants/strings/fixed_text_string.dart';
import 'package:shop/app_core/pakages/loading_pakage.dart';
import 'package:shop/app_core/pakages/slider_widget.dart';
import 'package:shop/app_features/home/controllers/dashboard_controller.dart';
import 'package:shop/app_features/home/widgets/catrgory_list_widget.dart';
import 'package:shop/app_features/home/widgets/product_list_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return controller.dashboardResponse == null
              ? LoadingPakage(color: Theme.of(context).primaryColor)
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SliderWidget(
                        images: controller.dashboardResponse!.sliders ?? [],
                      ),
                      const SizedBox(height: 15),

                      //------------------------------ Categories ------------------------------
                      CategoriesListWidget(
                          listCategories:
                              controller.dashboardResponse!.categories ?? []),
                      const SizedBox(height: 10),

                      //------------------------------ Products ------------------------------
                      ProductListWidget(
                          listParoducts: controller
                                  .dashboardResponse!.discountedProducts ??
                              [],
                          title: FixedTextString.textAmazingDiscounts),
                      ProductListWidget(
                          listParoducts:
                              controller.dashboardResponse!.latestProducts ??
                                  [],
                          title: FixedTextString.textLastestProducts),
                      const SizedBox(height: 15),
                    ],
                  ),
                );
        });
  }
}