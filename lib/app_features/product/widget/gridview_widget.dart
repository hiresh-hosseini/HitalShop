import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/constants/strings/fixed_text_string.dart';
import 'package:shop/app_core/pakages/cached_network_image_pakage.dart';
import 'package:shop/app_features/product/controller/product_controller.dart';

class GridviewWidget extends StatelessWidget {
  GridviewWidget({super.key});
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: controller.productList!.isEmpty
          ? Center(

              //------------------------------- Text is empty -------------------------------
              child: Text(
              FixedTextString.textProductsWillBeAddedSoon,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ))
          : GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemCount: controller.productList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisExtent: 225,
                mainAxisSpacing: 0,
              ),
              itemBuilder: (context, index) {
                var filterProducts = controller.productList![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //----------------------- Container ---------------------------
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(18),
                          height: 150,
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
                                color:
                                    const Color(0xff14489e).withOpacity(0.15),
                              ),
                            ],
                          ),

                          //----------------------------- Image -------------------------------
                          child: CachedNetworkImagePakage(
                              imageUrl: filterProducts.image!),
                        ),

                        //----------------------------- Discount ---------------------------
                        Visibility(
                          visible: filterProducts.discountPercent != 0,
                          child: Container(
                            margin: const EdgeInsets.only(top: 5, left: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 1),
                            decoration: BoxDecoration(
                              color: const Color(0xffff3d3d),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '${filterProducts.discountPercent}٪',
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),

                    //----------------------------- price ---------------------------
                    Row(
                      children: [
                        Text(
                          filterProducts.price ?? '',
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(width: 2),
                        const Text(
                          'ت',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const Spacer(),

                        //----------------------------- Real price ---------------------------
                        Visibility(
                          visible: filterProducts.discountPercent != 0,
                          child: Text(
                            filterProducts.realPrice ?? '',
                            style: TextStyle(
                              fontSize: 9.sp,
                              color: const Color(0xff8c8c8c),
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    //----------------------------- Title ---------------------------
                    Text(
                      filterProducts.title ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
