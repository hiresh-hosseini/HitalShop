import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/constants/strings/fixed_text_string.dart';
import 'package:shop/app_core/routes/routs_names.dart';
import 'package:shop/app_core/widgets/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                'assets/images/v.webp',
                height: 150.0.h,
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0.r),
                  topRight: Radius.circular(40.0.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(0.08),
                    blurRadius: 10.0.r,
                    offset: Offset(0.0.r, -6.0.r),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
                child: Column(
                  children: [
                    Text(
                      FixedTextString.textWellcome,
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16.0.sp),
                    ),
                    6.verticalSpace,
                    Text(
                      FixedTextString.textChooseAnOptionTocontinue,
                      style: TextStyle(
                          fontSize: 12.0.sp, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 18.w, right: 18.w, top: 18.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: ButtonWidget(
                              text: FixedTextString.textRegister,
                              onPressed: () {
                                Get.toNamed(NamedRouts.routeRegister);
                              },
                            ),
                          ),
                          14.horizontalSpace,
                          Expanded(
                            child: ButtonWidget(
                              text: FixedTextString.textLogin,
                              onPressed: () {
                                Get.toNamed(NamedRouts.routeLogin);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
