import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/constants/strings/fixed_hint_string.dart';
import 'package:shop/app_core/pakages/iconsax_pakage.dart';
import 'package:shop/app_features/product/controller/product_controller.dart';

class SearchboxWidget extends StatelessWidget {
  SearchboxWidget({super.key});
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
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

        //Search-----------------------------------------------------
        child: TextFormField(
          controller: controller.searchController,
          onChanged: (value) => controller.search(value),
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            hintText: FixedHintString.writetheDesiredProductName,
            hintStyle: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
                fontWeight: FontWeight.bold),
            suffixIcon: IconsaxPakage(
              icon: IconsaxPakage.searchNormal,
              iconSize: 24,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
