import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/constants/strings/fixed_text_string.dart';
import 'package:shop/app_core/pakages/iconsax_pakage.dart';
import 'package:shop/app_core/pakages/loading_pakage.dart';
import 'package:shop/app_core/pakages/product_slider_Package.dart';
import 'package:shop/app_core/routes/routs_names.dart';
import 'package:shop/app_core/widgets/appbar_widget.dart';
import 'package:shop/app_features/product/controller/product_datails_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDatailsController>(builder: (controller) {
      final productDetail = controller.productModel;
      return Scaffold(
        body: SafeArea(
          child: productDetail == null
              ? Center(
                  child: LoadingPakage(color: Theme.of(context).primaryColor))
              : Column(
                  children: [
                    // -------------------------------------- Appbar Widget --------------------------------------
                    AppbarWidget(
                      widget: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => controller.bookmark(),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Theme.of(context).dividerColor)),
                            child: controller.productModel!.bookmarked!
                                ? IconsaxPakage(
                                    icon: IconsaxPakage.heartFill,
                                    iconSize: 24,
                                    color: Colors.red,
                                  )
                                : IconsaxPakage(
                                    icon: IconsaxPakage.heart, iconSize: 24),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    //------------------- Product slider widget ----------------------------
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //----------------------------------------------- Details -------------------------------------------------
                            ProductSliderPackage(
                              images: productDetail.gallery ?? [],
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: Row(
                                children: [
                                  Text(
                                    '${FixedTextString.textCategory} ${productDetail.category}',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 16),
                                  ),
                                  const Spacer(),
                                  Visibility(
                                    visible: productDetail.discountPercent != 0,
                                    child: Row(
                                      children: [
                                        Text(
                                          productDetail.realPrice ?? '',
                                          style: const TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Color(0xff8c8c8c),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3),
                                          decoration: BoxDecoration(
                                            color: const Color(0xffff3d3d),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            '${productDetail.discountPercent}%',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 6),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      productDetail.title ?? '',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    productDetail.price ?? '',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    FixedTextString.textToman,
                                    style: const TextStyle(
                                      color: Color(0xff8c8c8c),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: Text(
                                productDetail.description ?? '',
                                style: const TextStyle(
                                  color: Color(0xff8c8c8c),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            //--------------------------------------------- Comment -------------------------------------------
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 45,
                                color: Colors.white,
                                elevation: 0,
                                onPressed: () {
                                  Get.toNamed(
                                    NamedRouts.routeCommentsScreen,
                                    arguments: productDetail.id,
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Theme.of(context).dividerColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconsaxPakage(
                                        icon: IconsaxPakage.messageText_1,
                                        iconSize: 14),
                                    const SizedBox(width: 10),
                                    Text(
                                      FixedTextString.textOpinions,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${controller.productModel!.reviewsCount} ${FixedTextString.textOpinion}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff8c8c8c)),
                                    ),
                                    const SizedBox(width: 3),
                                    IconsaxPakage(
                                        icon: IconsaxPakage.arrowLeft_24,
                                        iconSize: 20),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                          ],
                        ),
                      ),
                    ),

                    // -------------------------------------------------  Button ---------------------------------------

                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.09),
                            offset: const Offset(0, -1),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: IconsaxPakage(
                                  icon: IconsaxPakage.add,
                                  iconSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'cartCount',
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: IconsaxPakage(
                                  icon: IconsaxPakage.trash,
                                  iconSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      );
    });
  }
}
