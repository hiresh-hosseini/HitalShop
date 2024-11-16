import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/app_core/pakages/loading_pakage.dart';
import 'package:shop/app_core/widgets/button_widget.dart';
import 'package:shop/app_features/product/controller/cart_controller.dart';
import 'package:shop/app_features/product/screen/order_screen.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(18),
            child: controller.cartResponse == null
                ? Center(
                    child: LoadingPakage(
                    size: 20.0,
                    color: Theme.of(context).primaryColor,
                  ))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'سبد خرید',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 18),
                      controller.cartResponse!.items!.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                itemCount:
                                    controller.cartResponse!.items!.length,
                                itemBuilder: (context, index) {
                                  var cart =
                                      controller.cartResponse!.items![index];
                                  return Column(
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
                                                cart.product!.image ?? '',
                                                height: 86,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: SizedBox(
                                              height: 130,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    cart.product!.title ?? '',
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Visibility(
                                                    visible: cart.product!
                                                            .discountPercent !=
                                                        0,
                                                    child: Text(
                                                      cart.product!.realPrice ??
                                                          '',
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        color:
                                                            Color(0xff8c8c8c),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        cart.product!.price ??
                                                            '',
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
                                          SizedBox(
                                            height: 90,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () =>
                                                      controller.addToCart(
                                                          cart.product!.id!,
                                                          false,
                                                          true),
                                                  child: Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                        color: const Color(
                                                            0xffebebeb),
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: const Color(
                                                                  0xff14489e)
                                                              .withOpacity(
                                                                  0.15),
                                                          offset: const Offset(
                                                              0, 1),
                                                          blurRadius: 4,
                                                        ),
                                                      ],
                                                    ),

                                                    // --------------------------------- Trash ---------------------------
                                                    child: controller
                                                                    .loadingDelete[
                                                                cart.product!
                                                                    .id!] ==
                                                            true
                                                        ? Center(
                                                            child:
                                                                LoadingPakage(
                                                            size: 10.0,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                          ))
                                                        : Center(
                                                            child: Icon(
                                                                Iconsax.trash,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor),
                                                          ),
                                                  ),
                                                ),

                                                // ------------------------ Count -------------------------------
                                                Container(
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xffebebeb),
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: const Color(
                                                                0xff14489e)
                                                            .withOpacity(0.15),
                                                        offset:
                                                            const Offset(0, 1),
                                                        blurRadius: 4,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const SizedBox(width: 6),
                                                      GestureDetector(
                                                        onTap: () => controller
                                                            .addToCart(
                                                                cart.product!
                                                                    .id!,
                                                                true),
                                                        child: Icon(Iconsax.add,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 30),
                                                        child: controller
                                                                        .loadingCount[
                                                                    cart.product!
                                                                        .id!] ==
                                                                true
                                                            ? LoadingPakage(
                                                                size: 12.0,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              )
                                                            : Text(
                                                                cart.count!
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () => controller
                                                            .addToCart(
                                                                cart.product!
                                                                    .id!,
                                                                false),
                                                        child: Icon(
                                                            Iconsax.minus,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      ),
                                                      const SizedBox(width: 6),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 14),
                                      const Divider(),
                                      const SizedBox(height: 14),
                                    ],
                                  );
                                },
                              ),
                            )
                          : const Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Iconsax.close_square,
                                    size: 32,
                                  ),
                                  Center(
                                    child: Text(
                                      'محصولی وجود ندارد',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      Visibility(
                        visible: controller.cartResponse!.items!.isNotEmpty
                            ? true
                            : false,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xff14489e).withOpacity(0.15),
                                blurRadius: 3,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 4),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 4),
                                child: Row(
                                  children: [
                                    const Text(
                                      'مبلغ:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff8c8c8c),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      controller.cartResponse!.price ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const Text(
                                      'تومان',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff8c8c8c),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Row(
                                  children: [
                                    const Text(
                                      'مبلغ تخفیف:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff8c8c8c),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      controller.cartResponse!.discountPrice ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff8c8c8c),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const Text(
                                      'تومان',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff8c8c8c),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(14),
                                    bottomRight: Radius.circular(14),
                                  ),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 10),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'مبلغ کل:',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.cartResponse!.totalPrice ??
                                            '',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      const Text(
                                        'تومان',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                        visible: controller.cartResponse!.items!.isNotEmpty
                            ? true
                            : false,
                        child: ButtonWidget(
                          text: 'ثبت سفارش',
                          onPressed: () {
                            Get.to(() => const OrderScreen());
                          },
                        ),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
          );
        });
  }
}
