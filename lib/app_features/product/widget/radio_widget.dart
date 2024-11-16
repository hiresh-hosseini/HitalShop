import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_features/product/controller/order_controller.dart';

class RadioWidget extends StatelessWidget {
  const RadioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) {
      return Column(
          children: List.generate(
        controller.methods.length,
        (index) {
          var method = controller.methods[index];
          return GestureDetector(
            onTap: () => controller.selectMethod(method),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              margin: const EdgeInsets.only(bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: Row(
                children: [
                  Text(
                    method.title,
                    style:
                        const TextStyle(color: Color(0xff8c8c8c), fontSize: 16),
                  ),
                  const Spacer(),
                  Text(method.price,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 3),
                  const Text('تومان',
                      style: TextStyle(color: Color(0xff8c8c8c), fontSize: 12)),
                  const SizedBox(width: 10),
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xff707070)),
                    ),
                    child: Visibility(
                      visible: method.isSelected,
                      child: Center(
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ));
    });
  }
}
