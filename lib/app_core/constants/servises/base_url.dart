import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/constants/servises/endpoint.dart';
import 'package:shop/app_features/authentication/controllers/user_helper_controller.dart';

class BaseUrl {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: Endpoint.baseUrl,

      //این تابع بازبینی می‌کند که کدام کدهای وضعیت اچ تی تی پی به عنوان موفقیت‌آمیز در نظر گرفته شوند
      // به‌طور پیش‌فرض، دایو فقط کدهای وضعیت بین 200 تا 299 را موفقیت‌آمیز تلقی می‌کند
      validateStatus: (status) => status! < 500,

      //این تنظیمات هدر درخواست را به گونه‌ای تنظیم می‌کند که به سرور اعلام می‌شود
      // شما انتظار دارید پاسخ به فرمت جیسون باشد
      headers: {
        'Accept': 'application/json',
        if (Get.isRegistered<UserHelperController>())
          'Authorization': 'Bearer ${Get.find<UserHelperController>().token}',
      },
    ),
  );
}
