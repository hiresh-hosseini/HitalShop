import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/app_core/routes/routs_names.dart';
import 'package:shop/app_data/repositories/register_repository.dart';
import 'package:shop/app_features/authentication/controllers/user_helper_controller.dart';

class RegisterController extends GetxController {
  final form = GlobalKey<FormState>();
  bool isLoading = false;
  RegisterRepository registerRepository = RegisterRepository();
  var prefs = GetStorage();

  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtPasswordRepeat = TextEditingController();

  String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return 'لطفا نام خود را وارد کنید';
    }
    return null;
  }

  String? mobileValidator(String? mobile) {
    if (mobile == null || mobile.isEmpty) {
      return 'لطفا شماره موبایل را وارد کنید';
    } else if (mobile.length != 11) {
      return 'شماره موبایل باید ۱۱ رقمی باشد';
    } else if (!RegExp(r'^09[0-9]{9}$').hasMatch(mobile)) {
      return 'شماره موبایل باید با 09 شروع شود';
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

  String? passwordRepeatValidator(String? passwordRepeat) {
    if (passwordRepeat == null || passwordRepeat.isEmpty) {
      return 'لطفا تکرار رمز خود را وارد کنید';
    } else if (passwordRepeat != txtPassword.text) {
      return 'تکرار رمز عبور یکسان نیست';
    }
    return null;
  }

  Future<void> regiter() async {
    if (form.currentState!.validate()) {
      isLoading = true;
      update();

      // This is response to get a user Token
      var response = await registerRepository.register(
        name: txtName.text,
        mobile: txtMobile.text,
        password: txtPassword.text,
        passwordConformation: txtPasswordRepeat.text,
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

  Future<void> initShared() async {
    await GetStorage.init();
  }

  @override
  void onInit() {
    initShared();
    super.onInit();
  }
}
