import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/app_core/pakages/loading_pakage.dart';
import 'package:shop/app_core/widgets/appbar_widget.dart';
import 'package:shop/app_core/widgets/button_widget.dart';
import 'package:shop/app_features/product/controller/cart_controller.dart';
import 'package:shop/app_features/product/controller/order_controller.dart';
import 'package:shop/app_features/product/widget/radio_widget.dart';
import 'package:shop/app_features/profile/screens/add_address_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        init: OrderController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: controller.addressResponse == null
                  ? Center(
                      child: LoadingPakage(
                      size: 20.0,
                      color: Theme.of(context).primaryColor,
                    ))
                  : Column(
                      children: [
                        const AppbarWidget(title: 'تکمیل سفارش'),
                        const SizedBox(height: 18),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'آدرس خود را انتخاب کنید',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    const SizedBox(height: 14),
                                    Column(
                                      children: List.generate(
                                        controller
                                            .addressResponse!.data!.length,
                                        (index) {
                                          var address = controller
                                              .addressResponse!.data![index];
                                          return GestureDetector(
                                            onTap: () => controller
                                                .selecteAddress(address),
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              margin: const EdgeInsets.only(
                                                  bottom: 15),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                    color: controller
                                                                .selectedAddress
                                                                ?.id ==
                                                            address.id
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Theme.of(context)
                                                            .dividerColor,
                                                    width: 1),
                                              ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                          controller
                                                                  .addressResponse!
                                                                  .data![index]
                                                                  .title ??
                                                              '',
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900)),
                                                      const Spacer(),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                              color: Theme.of(
                                                                      context)
                                                                  .dividerColor,
                                                              width: 1),
                                                        ),
                                                        child: IconButton(
                                                          onPressed: () {
                                                            Get.to(() => AddAddressScreen(
                                                                address: controller
                                                                    .addressResponse!
                                                                    .data![index]));
                                                          },
                                                          icon: Icon(
                                                            Iconsax.edit,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            size: 24,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 12),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                              color: Theme.of(
                                                                      context)
                                                                  .dividerColor,
                                                              width: 1),
                                                        ),
                                                        child: IconButton(
                                                          onPressed: () {
                                                            controller.deleteAddress(
                                                                controller
                                                                    .addressResponse!
                                                                    .data![
                                                                        index]
                                                                    .id!);
                                                          },
                                                          icon: Icon(
                                                            Iconsax.trash,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            size: 24,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                        controller
                                                                .addressResponse!
                                                                .data![index]
                                                                .address ??
                                                            '',
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xff8c8c8c),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900)),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Visibility(
                                                    visible: controller
                                                            .addressResponse!
                                                            .data![index]
                                                            .postalCode !=
                                                        null,
                                                    child: Row(
                                                      children: [
                                                        const Text(
                                                          'کدپستی:',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          controller
                                                              .addressResponse!
                                                              .data![index]
                                                              .postalCode
                                                              .toString(),
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xff8c8c8c),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    ButtonWidget(
                                      hasBorder: true,
                                      text: 'افزودن آدرس',
                                      onPressed: () => Get.to(
                                          () => const AddAddressScreen()),
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      'شیوه‌ی ارسال را انتخاب کنید',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    const SizedBox(height: 14),
                                    const RadioWidget(),
                                    const SizedBox(height: 16),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xff14489e)
                                                .withOpacity(0.15),
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
                                                  'هزینه‌ی ارسال:',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xff8c8c8c),
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  controller.selectedMethod
                                                          ?.price ??
                                                      '0',
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
                                                  Get.find<CartController>()
                                                          .cartResponse!
                                                          .price ??
                                                      '',
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18),
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
                                                  Get.find<CartController>()
                                                          .cartResponse!
                                                          .discountPrice ??
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
                                              border: Border(
                                                  top: BorderSide(
                                                      color: Theme.of(context)
                                                          .disabledColor)),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18,
                                                      vertical: 10),
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    'مبلغ کل:',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Color(0xff8c8c8c),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    controller.getTotalPrice(),
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
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    ButtonWidget(
                                      text: 'پرداخت آنلاین',
                                      onPressed: () {
                                        controller.order();
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
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
