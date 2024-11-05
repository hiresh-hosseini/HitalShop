import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilPakage extends StatelessWidget {
  const ScreenUtilPakage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return this.child;
      },
    );
  }

  static double get screenHeight => ScreenUtil().screenHeight;
  static double get screenWidth => ScreenUtil().screenWidth;
  static double r(double size) => size.r;
  static double w(double size) => size.w;
  static double h(double size) => size.h;
  static double sp(double size) => size.sp;
}
