import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/app_core/constants/strings/fixed_hint_string.dart';
import 'package:shop/app_core/constants/strings/fixed_text_string.dart';
import 'package:shop/app_core/routes/routs_names.dart';
import 'package:shop/app_core/widgets/button_widget.dart';
import 'package:shop/app_core/widgets/text_field_widget.dart';
import 'package:shop/app_features/authentication/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0)
                      .r,
              child: SingleChildScrollView(
                child: Form(
                  key: controller.form,
                  child: Column(
                    children: [
                      Image.asset('assets/images/h.webp', height: 60.0.h),
                      8.verticalSpace,
                      Text(
                        FixedTextString.wellcome,
                        style: TextStyle(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff8c8c8c),
                        ),
                      ),
                      20.verticalSpace,

                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          FixedTextString.login,
                          style: TextStyle(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      18.0.verticalSpace,

                      //Number--------------------------------------------------------
                      TextFieldWidget(
                        hint: FixedHintString.mobile,
                        icon: Iconsax.mobile,
                        type: TextInputType.number,
                        txtController: controller.txtMobile,
                        validator: controller.mobileValidator,
                      ),
                      12.0.verticalSpace,

                      //Pass------------------------------------------------
                      TextFieldWidget(
                        hint: FixedHintString.password,
                        type: TextInputType.visiblePassword,
                        txtController: controller.txtPassword,
                        validator: controller.passwordValidator,
                      ),
                      20.0.verticalSpace,

                      ButtonWidget(
                        text: FixedTextString.login,
                        onPressed: controller.login,
                        isLoading: controller.isLoading,
                      ),
                      20.0.verticalSpace,

                      GestureDetector(
                        onTap: () => Get.offNamed(NamedRouts.routeRegister),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FixedTextString.doYoudontHaveAnAccount,
                              style: TextStyle(
                                fontSize: 14.0.sp,
                                color: const Color(0xff8c8c8c),
                              ),
                            ),
                            6.0.horizontalSpace,
                            Text(
                              'ثبت نام',
                              style: TextStyle(
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
