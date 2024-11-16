import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/pakages/loading_pakage.dart';
import 'package:shop/app_core/widgets/appbar_widget.dart';
import 'package:shop/app_features/product/controller/order_shop_controller.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderShopController>(
        init: OrderShopController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: controller.orderResponse == null
                  ? Center(
                      child: LoadingPakage(
                      size: 20.0,
                      color: Theme.of(context).primaryColor,
                    ))
                  : Column(
                      children: [
                        const AppbarWidget(title: 'سفارش‌ها'),
                        const SizedBox(height: 14),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: controller.orderResponse!.data!.length,
                            itemBuilder: (context, index) {
                              var order =
                                  controller.orderResponse!.data![index];
                              return Container(
                                padding: const EdgeInsets.all(14),
                                margin: const EdgeInsets.only(bottom: 14),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: const Color(0xffebebeb)),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xff787878)
                                          .withOpacity(0.1),
                                      offset: const Offset(0, 1),
                                      blurRadius: 14,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'ارسال سفارش به:',
                                          style: TextStyle(
                                            color: Color(0xff8c8c8c),
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          order.address ?? '',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'شماره سفارش: ${order.trackingCode}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),

                                    //Image----------------------------------------------------
                                    const SizedBox(height: 14),
                                    SizedBox(
                                      height: 50,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: order.products!.length,
                                        itemBuilder: (context, index) {
                                          return Stack(
                                            alignment: Alignment.topLeft,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    left: BorderSide(
                                                        color: Theme.of(context)
                                                            .dividerColor,
                                                        width: 1.5),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Image.network(
                                                    order.products![index]
                                                            .image ??
                                                        '',
                                                    height: 60,
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: order.products![index]
                                                        .count! >
                                                    1,
                                                child: Container(
                                                  height: 18,
                                                  width: 18,
                                                  margin: const EdgeInsets.only(
                                                      left: 6),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xffcbe0ff),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      order.products![index]
                                                          .count!
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                    Row(
                                      children: [
                                        Text(
                                          order.products!.length.toString(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 2),
                                        const Text(
                                          'قلم کالا',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff8c8c8c),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        const Spacer(),
                                        const Text(
                                          'قیمت سفارش:',
                                          style: TextStyle(
                                            color: Color(0xff8c8c8c),
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          order.totalPrice ?? '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 3),
                                        const Text(
                                          'تومان',
                                          style: TextStyle(
                                            color: Color(0xff8c8c8c),
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                          decoration: BoxDecoration(
                                            color: controller
                                                .getStatusColor(order.status!)
                                                .bgColor,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            order.status ?? '',
                                            style: TextStyle(
                                              color: controller
                                                  .getStatusColor(order.status!)
                                                  .txtColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            ),
          );
        });
  }
}
