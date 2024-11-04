import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void successMessage(String message) {
  Get.snackbar(
    'موفق',
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    colorText: Colors.white,
    margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20).r,
  );
}

void errorMessage(String message) {
  Get.snackbar('ناموفق', message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20).r);
}
