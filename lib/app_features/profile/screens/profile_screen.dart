import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shop/app_core/constants/strings/fixed_hint_string.dart';
import 'package:shop/app_core/constants/strings/fixed_text_string.dart';
import 'package:shop/app_core/pakages/loading_pakage.dart';
import 'package:shop/app_core/routes/routs_names.dart';
import 'package:shop/app_features/profile/controllers/address_controller.dart';
import 'package:shop/app_features/profile/controllers/profile_controller.dart';
import 'package:shop/app_features/profile/widgets/logout_dialog_widget.dart';
import 'package:shop/app_features/profile/widgets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: controller.profileUserModel == null
                  ? Center(
                      child: LoadingPakage(
                          size: 20.0, color: Theme.of(context).primaryColor))
                  : SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff14489e).withOpacity(0.15),
                                  offset: const Offset(0, 1),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 90,
                                  width: 90,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffe8f1ff),
                                  ),
                                  child: const Icon(
                                    Iconsax.user,
                                    size: 38,
                                  ),
                                ),
                                const SizedBox(height: 10),

                                //-------------------------------- Name -----------------------------------------
                                Text(
                                  controller.profileUserModel!.name ?? '',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 4),

                                //---------------------------------- Mobile ----------------------------------------
                                Text(
                                  controller.profileUserModel!.mobile ?? '',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 10),

                                // --------------------------------------- Edit ----------------------------------------
                                GestureDetector(
                                  onTap: () => Get.toNamed(
                                      NamedRouts.routeEditProfileScreen,
                                      arguments: controller.profileUserModel),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Iconsax.edit,
                                        size: 22,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        FixedTextString.textEdit,
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),

                          // ---------------------------------------- Map ------------------------------------
                          GestureDetector(
                            onTap: () {
                              final addressController =
                                  Get.put(AddressController());
                              addressController.getAddress();
                              addressController.update();
                              Get.toNamed(
                                NamedRouts.routeAddressScreen,
                                arguments: addressController.addressResponse,
                              );
                            },
                            child: ProfileWidget(
                              title: FixedHintString.addresses,
                              icon: Iconsax.map,
                            ),
                          ),

                          // ---------------------------------------- Truck fast -------------------------------
                          GestureDetector(
                            onTap: () {},
                            child: ProfileWidget(
                              title: FixedHintString.orders,
                              icon: Iconsax.truck_fast,
                            ),
                          ),

                          // ------------------------------- Share ------------------------------------------
                          GestureDetector(
                            onTap: () => Share.share(
                              FixedTextString.textShare,
                            ),
                            child: ProfileWidget(
                                title: FixedHintString.inviteFriends,
                                icon: Iconsax.user_cirlce_add),
                          ),

                          // -------------------------------- Logout ------------------------------------------
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const LogoutDialogWidget());
                            },
                            child: ProfileWidget(
                              title: FixedHintString.logout,
                              icon: Iconsax.logout_1,
                            ),
                          ),
                          const SizedBox(height: 35),
                        ],
                      ),
                    ),
            ),
          );
        });
  }
}
