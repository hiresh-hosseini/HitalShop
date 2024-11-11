import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/constants/strings/fixed_text_string.dart';
import 'package:shop/app_core/pakages/cached_network_image_pakage.dart';
import 'package:shop/app_core/pakages/iconsax_pakage.dart';
import 'package:shop/app_core/routes/routs_names.dart';
import 'package:shop/app_data/models/category_model.dart';
import 'package:shop/app_features/home/controllers/home_controller.dart';

class HomeCategoriesListWidget extends StatelessWidget {
  const HomeCategoriesListWidget({super.key, required this.listCategories});

  // final int? categoryId;
  final List<CategoryModel> listCategories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Get.find<HomeController>().changePage(1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                //------------------------------- Categories ----------------------------
                const SizedBox(height: 40),
                Text(
                  FixedTextString.textCategories,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0.sp,
                  ),
                ),
                const Spacer(),

                //------------------------------ Show All -----------------------------
                Text(
                  FixedTextString.textShowAll,
                  style: TextStyle(
                      fontSize: 12.0.sp, color: Theme.of(context).primaryColor),
                ),
                const SizedBox(width: 2),
                IconsaxPakage(
                    icon: IconsaxPakage.arrowLeft2,
                    iconSize: 16,
                    color: Theme.of(context).primaryColor),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),

        //------------------------------- List view ----------------------------
        SizedBox(
          height: 150,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(right: 18),
            scrollDirection: Axis.horizontal,
            itemCount: listCategories.length,
            itemBuilder: (context, index) {
              var categories = listCategories[index];
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: GestureDetector(
                  onTap: () => Get.toNamed(
                    NamedRouts.routeProduct,
                    arguments: {'categoryId': categories.id},
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                              color: const Color(0xff14489e).withOpacity(0.15),
                            ),
                          ],
                        ),

                        //----------------------------- Image ----------------------------
                        child: CachedNetworkImagePakage(
                            imageUrl: categories.image ?? ''),
                      ),
                      const SizedBox(height: 8),

                      //---------------------------- Title ----------------------------
                      Text(
                        categories.title ?? '',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
