import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/app_core/pakages/loading_pakage.dart';
import 'package:shop/app_core/widgets/appbar_widget.dart';
import 'package:shop/app_core/widgets/button_widget.dart';
import 'package:shop/app_features/profile/controllers/address_controller.dart';
import 'package:shop/app_features/profile/screens/add_address_screen.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
        init: AddressController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const AppbarWidget(title: 'آدرس‌ها'),
                  Expanded(
                    child: controller.addressResponse == null
                        ? Center(
                            child: LoadingPakage(
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            itemCount: controller.addressResponse!.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(bottom: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Theme.of(context).dividerColor,
                                      width: 1),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            controller.addressResponse!
                                                    .data![index].title ??
                                                '',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900)),
                                        const Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: Theme.of(context)
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
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .dividerColor,
                                                width: 1),
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              controller.deleteAddress(
                                                  controller.addressResponse!
                                                      .data![index].id!);
                                            },
                                            icon: Icon(
                                              Iconsax.trash,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                          controller.addressResponse!
                                                  .data![index].address ??
                                              '',
                                          style: const TextStyle(
                                              color: Color(0xff8c8c8c),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900)),
                                    ),
                                    const SizedBox(height: 8),
                                    Visibility(
                                      visible: controller.addressResponse!
                                              .data![index].postalCode !=
                                          null,
                                      child: Row(
                                        children: [
                                          const Text(
                                            'کدپستی:',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            controller.addressResponse!
                                                .data![index].postalCode
                                                .toString(),
                                            style: const TextStyle(
                                                color: Color(0xff8c8c8c),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ButtonWidget(
                      hasBorder: true,
                      text: 'افزودن آدرس',
                      onPressed: () => Get.to(() => const AddAddressScreen()),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        });
  }
}
