import 'package:get/get.dart';
import 'package:shop/app_features/authentication/controllers/login_controller.dart';
import 'package:shop/app_features/authentication/controllers/register_controller.dart';
import 'package:shop/app_features/authentication/controllers/splash_controller.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  }
}
