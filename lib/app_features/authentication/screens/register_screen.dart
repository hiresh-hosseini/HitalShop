import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/app_core/constants/strings/fixed_text_string.dart';
import 'package:shop/app_core/routes/routs_names.dart';
import 'package:shop/app_core/widgets/button_widget.dart';
import 'package:shop/app_core/widgets/text_field_widget.dart';
import 'package:shop/app_features/authentication/controllers/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 25).r,
              child: SingleChildScrollView(
                child: Form(
                  key: controller.form,
                  child: Column(
                    children: [
                      Image.asset('assets/images/h.webp', height: 60.0.h),
                      6.verticalSpace,
                      Text(
                        FixedTextString.wellcome,
                        style: TextStyle(
                          fontSize: 15.0.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff8c8c8c),
                        ),
                      ),
                      25.verticalSpace,
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          FixedTextString.register,
                          style: TextStyle(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      18.verticalSpace,

                      //Name------------------------------------------------------------
                      TextFieldWidget(
                        hint: 'نام و نام خانوادگی',
                        icon: Iconsax.user,
                        txtController: controller.txtName,
                        validator: controller.nameValidator,
                      ),
                      10.verticalSpace,

                      //Number------------------------------------------------------------
                      TextFieldWidget(
                        hint: 'شماره موبایل',
                        icon: Iconsax.mobile,
                        type: TextInputType.number,
                        txtController: controller.txtMobile,
                        validator: controller.mobileValidator,
                      ),

                      10.verticalSpace,

                      //Pass------------------------------------------------------------
                      TextFieldWidget(
                        hint: 'رمز عبور',
                        type: TextInputType.visiblePassword,
                        txtController: controller.txtPassword,
                        validator: controller.passwordValidator,
                      ),
                      10.verticalSpace,

                      //Pass Repeat------------------------------------------------------------
                      TextFieldWidget(
                        hint: 'تکرار رمز عبور',
                        type: TextInputType.visiblePassword,
                        txtController: controller.txtPasswordRepeat,
                        validator: controller.passwordRepeatValidator,
                      ),
                      20.verticalSpace,

                      //Register------------------------------------------------------------
                      ButtonWidget(
                        text: 'ثبت نام',
                        onPressed: controller.regiter,
                        isLoading: controller.isLoading,
                      ),
                      20.verticalSpace,
                      GestureDetector(
                        onTap: () => Get.offNamed(NamedRouts.routeLogin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FixedTextString.doYouHaveAnAccount,
                              style: TextStyle(
                                fontSize: 14.0.sp,
                                color: const Color(0xff8c8c8c),
                              ),
                            ),
                            4.horizontalSpace,
                            Text(
                              'وارد شوید',
                              style: TextStyle(
                                fontSize: 12.0.sp,
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
