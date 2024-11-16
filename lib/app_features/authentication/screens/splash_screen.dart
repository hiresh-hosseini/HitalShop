import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/pakages/loading_pakage.dart';
import 'package:shop/app_features/authentication/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Image.asset(
                'assets/images/b.webp',
                height: ScreenUtil().screenHeight,
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.2),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/v.webp',
                      height: 130.0.h,
                    ),
                  ),
                  if (controller.isLoading)
                    LoadingPakage(
                      size: 20.0,
                      color: Theme.of(context).primaryColor,
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
