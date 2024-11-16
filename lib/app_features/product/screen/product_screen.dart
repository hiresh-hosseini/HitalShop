import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/constants/strings/fixed_text_string.dart';
import 'package:shop/app_core/pakages/loading_pakage.dart';
import 'package:shop/app_core/widgets/appbar_widget.dart';
import 'package:shop/app_features/product/controller/product_controller.dart';
import 'package:shop/app_features/product/widget/product_category_list_widget.dart';
import 'package:shop/app_features/product/widget/gridview_widget.dart';
import 'package:shop/app_features/product/widget/searchbox_widget.dart';
import 'package:shop/app_features/product/widget/sort_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  // final int? categoryId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child:
              controller.categoryList == null || controller.productList == null
                  ? Center(
                      child: LoadingPakage(
                        size: 20.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : Column(
                      children: [
                        //------------------------------- AppBar -------------------------------
                        AppbarWidget(title: FixedTextString.textProducts),
                        const SizedBox(height: 15),

                        // ------------------------------- Search and sort -------------------------------
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            children: [
                              SearchboxWidget(),
                              const SizedBox(width: 8),
                              SortWidget(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 22),

                        ProductCategoryListWidget(),
                        const SizedBox(height: 22),
                        GridviewWidget(),
                      ],
                    ),
        ),
      );
    });
  }
}
