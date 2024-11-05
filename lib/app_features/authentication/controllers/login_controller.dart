import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/app_core/routes/routs_names.dart';
import 'package:shop/app_data/repositories/login_repository.dart';
import 'package:shop/app_features/authentication/controllers/user_helper_controller.dart';

class LoginController extends GetxController {
  final form = GlobalKey<FormState>();
  bool isLoading = false;
  LoginRepository loginRepository = LoginRepository();
  var prefs = GetStorage();

  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  String? mobileValidator(String? mobile) {
    if (mobile == null || mobile.isEmpty) {
      return 'لطفا شماره موبایل را وارد کنید';
    } else if (mobile.length != 11) {
      return 'شماره موبایل باید ۱۱ رقمی باشد';
    } else if (!RegExp(r'^09[0-9]{9}$').hasMatch(mobile)) {
      return 'شماره موبایل باید با ۰۹ شروع شود';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'لطفا رمز خود را وارد کنید';
    } else if (password.length < 8) {
      return 'رمز باید ۸ رقمی باشد';
    }
    return null;
  }

  Future<void> initShared() async {
    await GetStorage.init();
  }

  Future<void> login() async {
    if (form.currentState!.validate()) {
      isLoading = true;
      update();
      var response = await loginRepository.login(
        mobile: txtMobile.text,
        password: txtPassword.text,
      );
      if (response != null) {
        prefs.write('token', response.token!);
        Get.put(UserHelperController(response.token!));

        Get.offAllNamed(NamedRouts.routeHome);
      }
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    initShared();
    super.onInit();
  }
}
