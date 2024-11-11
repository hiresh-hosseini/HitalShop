import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/constants/strings/fixed_text_string.dart';
import 'package:shop/app_core/pakages/cached_network_image_pakage.dart';
import 'package:shop/app_core/pakages/iconsax_pakage.dart';
import 'package:shop/app_core/routes/routs_names.dart';
import 'package:shop/app_data/models/product_model.dart';
import 'package:shop/app_features/product/controller/product_controller.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget(
      {super.key, required this.title, required this.listParoducts, this.sort});
  final String title;
  final List<ProductModel> listParoducts;
  final Sort? sort;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(
            NamedRouts.routeProduct,
            arguments: {'sort': sort},
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                //Title-----------------------------------------------------------
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0.sp,
                  ),
                ),
                const Spacer(),
                Text(
                  FixedTextString.textShowAll,
                  style: TextStyle(
                      fontSize: 14, color: Theme.of(context).primaryColor),
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
        const SizedBox(height: 20),

        //List-------------------------------------------------------------
        SizedBox(
          height: 200.0.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(right: 18),
            scrollDirection: Axis.horizontal,
            itemCount: listParoducts.length,
            itemBuilder: (context, index) {
              var products = listParoducts[index];
              return GestureDetector(
                onTap: () => Get.toNamed(NamedRouts.routeProductDetails,
                    arguments: products.id),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Container--------------------------------------------------
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              height: 160,
                              width: 160,

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
                                    color: const Color(0xff14489e)
                                        .withOpacity(0.15),
                                  ),
                                ],
                              ),

                              //Image------------------------------------------------------------
                              child: CachedNetworkImagePakage(
                                imageUrl: products.image ?? '',
                              ),
                            ),

                            //Discount--------------------------------------------------------
                            Visibility(
                              visible: products.discountPercent != 0,
                              child: Container(
                                margin: const EdgeInsets.only(top: 5, left: 5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 1),
                                decoration: BoxDecoration(
                                  color: const Color(0xffff3d3d),
                                  borderRadius: BorderRadius.circular(4),
                                ),

                                //------------------ discountPercent ----------------------
                                child: Text(
                                  '${products.discountPercent}%',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        Row(
                          children: [
                            //------------------------- realPrice -------------------------
                            Text(
                              products.realPrice ?? '',
                              style: TextStyle(
                                fontSize: 14.0.sp,
                              ),
                            ),
                            const SizedBox(width: 2),

                            //------------------------- Toman ---------------------------
                            Text(
                              FixedTextString.textToman,
                              style: TextStyle(
                                  fontSize: 14.0.sp,
                                  color: const Color(0xff8c8c8c)),
                            ),
                            const Spacer(),

                            //------------------------- price ---------------------------
                            Visibility(
                              visible: products.discountPercent != 0,
                              child: Text(
                                products.price ?? '',
                                style: TextStyle(
                                  fontSize: 10.0.sp,
                                  color: const Color(0xff8c8c8c),
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),

                        //------------------------- Title ---------------------------
                        Text(
                          products.title ?? '',
                          style: TextStyle(
                            fontSize: 14.0.sp,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
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
