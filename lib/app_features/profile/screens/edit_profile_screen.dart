import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/app_core/constants/strings/fixed_hint_string.dart';
import 'package:shop/app_core/constants/strings/fixed_text_string.dart';
import 'package:shop/app_core/widgets/appbar_widget.dart';
import 'package:shop/app_core/widgets/button_widget.dart';
import 'package:shop/app_core/widgets/text_field_widget.dart';
import 'package:shop/app_features/profile/controllers/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
        init: EditProfileController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      AppbarWidget(title: FixedTextString.textEditProfile),
                      const SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          children: [
                            // ---------------------------- Name ---------------------------
                            TextFieldWidget(
                              txtController: controller.txtName,
                              hint: FixedHintString.userName,
                              icon: Iconsax.user,
                              validator: controller.nameValidate,
                            ),
                            const SizedBox(height: 14),

                            // ----------------------------- Mobile ----------------------------
                            TextFieldWidget(
                                txtController: controller.txtMobile,
                                hint: FixedHintString.mobile,
                                icon: Iconsax.mobile,
                                disabled: true),
                            const SizedBox(height: 14),

                            // ----------------------------------------- Old pass ------------------------------
                            TextFieldWidget(
                              txtController: controller.txtOldPass,
                              hint: FixedHintString.oldPassword,
                              type: TextInputType.visiblePassword,
                              validator: controller.txtOldPassValidate,
                            ),
                            const SizedBox(height: 14),

                            // --------------------------------- New pass --------------------------------
                            TextFieldWidget(
                              txtController: controller.txtNewPss,
                              hint: FixedHintString.newPassword,
                              type: TextInputType.visiblePassword,
                              validator: controller.txtNewPassValidate,
                            ),
                            const SizedBox(height: 24),

                            // ------------------------------ Button edit --------------------------------
                            ButtonWidget(
                              text: FixedTextString.textEdit,
                              onPressed: () {
                                controller.editProfile();
                              },
                              isLoading: controller.isLoading,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
