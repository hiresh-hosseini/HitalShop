import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/app_core/widgets/button_widget.dart';
import 'package:shop/app_features/product/screen/order_screen.dart';

class OrderFailedScreen extends StatelessWidget {
  const OrderFailedScreen({super.key, required this.type, required this.id});
  final String type;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.green,
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Iconsax.close_circle5,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'پرداخت موفق نبود',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'کد رهگیری',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffc8c8c8),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    id,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ButtonWidget(
                    text: 'رفتن به سفارشات',
                    onPressed: () => Get.off(
                      const OrderScreen(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
