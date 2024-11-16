import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_data/repositories/product_respository.dart';
import 'package:shop/app_data/responses/order_response.dart';

class OrderShopController extends GetxController {
  ProductRespository productRepository = ProductRespository();
  OrderResponse? orderResponse;

  Future<void> getOrders() async {
    orderResponse = await productRepository.getOrders();
    update();
  }

  OrderStatus getStatusColor(String status) {
    if (status == 'تحویل داده شده' || status == 'پرداخت شده') {
      return OrderStatus(
          bgColor: const Color(0xff2ac066), txtColor: Colors.white);
    } else if (status == 'در حال آماده سازی') {
      return OrderStatus(
          bgColor: const Color(0x0ffeebeb), txtColor: const Color(0xfff31a1a));
    } else if (status == 'لغو شده') {
      return OrderStatus(
          bgColor: const Color(0xfff31a1a), txtColor: Colors.white);
    }
    return OrderStatus(
        bgColor: const Color(0xff2ac066), txtColor: Colors.white);
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}

class OrderStatus {
  Color bgColor;
  Color txtColor;
  OrderStatus({
    required this.bgColor,
    required this.txtColor,
  });
}
