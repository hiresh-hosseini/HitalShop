import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/app_core/pakages/loading_pakage.dart';
import 'package:shop/app_core/routes/routs_names.dart';
import 'package:shop/app_features/profile/controllers/bookmark_controller.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookmarksController>(
        init: BookmarksController(),
        builder: (controller) {
          return controller.filterProductResponse == null
              ? Center(
                  child: LoadingPakage(
                      size: 20.0, color: Theme.of(context).primaryColor))
              : Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'علاقه‌مندی‌ها',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller
                              .filterProductResponse!.filterProducts!.length,
                          itemBuilder: (context, index) {
                            var product = controller
                                .filterProductResponse!.filterProducts![index];
                            return GestureDetector(
                              onTap: () => Get.toNamed(
                                NamedRouts.routeProductDetails,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 90,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0xff14489e)
                                                  .withOpacity(0.15),
                                              offset: const Offset(0, 1),
                                              blurRadius: 3,
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Image.network(
                                            product.image ?? '',
                                            height: 86,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: SizedBox(
                                          height: 110,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product.title ?? '',
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Spacer(),
                                              Visibility(
                                                visible:
                                                    product.discountPercent !=
                                                        0,
                                                child: Text(
                                                  product.realPrice ?? '',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: Color(0xff8c8c8c),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    product.price ?? '',
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Text(
                                                    'تومان',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => controller.deleteBookmark(
                                          product.id!,
                                        ),
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: const Color(0xffebebeb),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(0xff14489e)
                                                    .withOpacity(0.15),
                                                offset: const Offset(0, 1),
                                                blurRadius: 4,
                                              ),
                                            ],
                                          ),
                                          child: const Center(
                                            child: Icon(Iconsax.heart5,
                                                color: Colors.red),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  const Divider(),
                                  const SizedBox(height: 14),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
        });
  }
}
