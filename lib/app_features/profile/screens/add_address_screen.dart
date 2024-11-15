import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/app_core/pakages/loading_pakage.dart';
import 'package:shop/app_core/widgets/appbar_widget.dart';
import 'package:shop/app_core/widgets/button_widget.dart';
import 'package:shop/app_core/widgets/text_field_widget.dart';
import 'package:shop/app_data/responses/address_response.dart';
import 'package:shop/app_features/profile/controllers/add_address_controller.dart';
import 'package:shop/app_features/profile/screens/map_screen.dart';
import 'package:shop/app_features/profile/widgets/selected_city_widget.dart';
import 'package:shop/app_features/profile/widgets/selected_province_widget.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key, this.address});

  final Address? address;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(
        init: AddAddressController(address: address),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  // -------------------------------- Appbar -----------------------------------------------
                  AppbarWidget(
                      title: address == null ? 'ایجاد آدرس' : 'ویرایش آدرس'),
                  Expanded(
                    child: controller.provinceResponse == null
                        ? Center(
                            child: LoadingPakage(
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 20),
                            child: Form(
                              key: controller.formKey,
                              child: Column(
                                children: [
                                  // ------------------------------- Title address -------------------------------------
                                  TextFieldWidget(
                                    hint: 'عنوان آدرس',
                                    txtController: controller.txtTitle,
                                    validator: controller.titleValidate,
                                  ),
                                  const SizedBox(height: 14),
                                  Row(
                                    children: [
                                      // -------------------------------------- Provinces -----------------------------------
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            // FocusScope.of(context).unfocus();
                                            Get.focusScope?.unfocus();
                                            showModalBottomSheet(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                  top: Radius.circular(24),
                                                ),
                                              ),
                                              context: context,
                                              builder: (context) =>
                                                  SelectedProvinceWidget(
                                                provinces: controller
                                                    .provinceResponse!.data!,
                                                onSelectedProvince: (province) {
                                                  controller
                                                      .selectProvince(province);
                                                },
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .dividerColor),
                                            ),
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: Text(
                                                      controller.selectedProvince ==
                                                              null
                                                          ? 'استان‌'
                                                          : controller
                                                              .selectedProvince!
                                                              .name!,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: controller
                                                                    .selectedProvince ==
                                                                null
                                                            ? Theme.of(context)
                                                                .hintColor
                                                            : Colors.black,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // const Spacer(),
                                                Icon(
                                                  Iconsax.arrow_down_1,
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),

                                      // --------------------------------------- Cites -----------------------------------
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.focusScope?.unfocus();

                                            if (controller.selectedProvince ==
                                                null) {
                                              controller.choose();
                                            } else {
                                              showModalBottomSheet(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                    top: Radius.circular(24),
                                                  ),
                                                ),
                                                context: context,
                                                builder: (context) =>
                                                    SelectedCityWidget(
                                                  cities: controller
                                                      .selectedProvince!
                                                      .cities!,
                                                  onSelectedCity: (city) {
                                                    controller.selectCity(city);
                                                  },
                                                ),
                                              );
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .dividerColor),
                                            ),
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: Text(
                                                      controller.selectedCity ==
                                                              null
                                                          ? 'شهر'
                                                          : controller
                                                              .selectedCity!
                                                              .name!,
                                                      style: TextStyle(
                                                        color: controller
                                                                    .selectedCity ==
                                                                null
                                                            ? Theme.of(context)
                                                                .hintColor
                                                            : Colors.black,
                                                        fontSize: 16,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                Icon(
                                                  Iconsax.arrow_down_1,
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),

                                  // ------------------------------------------ Address ------------------------------------
                                  TextFieldWidget(
                                    hint: 'آدرس',
                                    txtController: controller.txtAddress,
                                    validator: controller.addressValidate,
                                  ),
                                  const SizedBox(height: 14),

                                  // ------------------------------------------ Postal code ------------------------------------
                                  TextFieldWidget(
                                    hint: 'کد پستی',
                                    type: TextInputType.number,
                                    txtController: controller.txtPostalCode,
                                  ),
                                  const SizedBox(height: 14),
                                  GestureDetector(
                                    onTap: () => Get.to(
                                      () => MapScreen(
                                        onSelected: (latlong) {
                                          FocusScope.of(context).unfocus();
                                          controller.selecteLocation(latlong);
                                        },
                                      ),
                                    ),

                                    // ------------------------------------------ Select loaction ------------------------------------
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color:
                                                Theme.of(context).dividerColor),
                                      ),
                                      child: Text(
                                        controller.selectedLocation != null
                                            ? 'موقعیت مکانی انتخاب شد'
                                            : 'انتخاب موقعیت مکانی روی نقشه',
                                        style: TextStyle(
                                          color: controller.selectedLocation !=
                                                  null
                                              ? Colors.black
                                              : Theme.of(context).hintColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  // ------------------------------------------ Select location button ---------------------------------
                                  ButtonWidget(
                                    text: address == null
                                        ? 'افزودن آدرس'
                                        : 'ویرایش‌ آدرس',
                                    onPressed: () => address != null
                                        ? controller.editAddress()
                                        : controller.addAddress(),
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
