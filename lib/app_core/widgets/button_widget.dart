import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/app_core/pakages/loading_pakage.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.hasBorder = false,
  });

  final String text;
  final Function()? onPressed;
  final bool isLoading;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // ------------------‌ Button background color ------------------
      color: hasBorder
          ? Theme.of(context).scaffoldBackgroundColor
          : Theme.of(context).primaryColor,

      // ------------------‌ Button desgin ------------------
      minWidth: double.infinity,
      height: 35.0.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
        side: BorderSide(
            color:
                hasBorder ? Theme.of(context).primaryColor : Colors.transparent,
            width: 1),
      ),

      // ------------------‌ If isLoading is == true ------------------
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading
          ? const LoadingPakage(
              size: 20.0,
              color: Colors.white,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ------------------‌ Add icon can be display if the border is true ------------------
                Visibility(
                  visible: hasBorder,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0.w),
                    child: Icon(
                      Iconsax.add,
                      color: Theme.of(context).primaryColor,
                      size: 24.0.h,
                    ),
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: hasBorder
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
    );
  }
}
