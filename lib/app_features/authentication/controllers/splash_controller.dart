import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/app_core/routes/routs_names.dart';
import 'package:shop/app_features/authentication/controllers/user_helper_controller.dart';

class SplashController extends GetxController {
  var prefs = GetStorage();
  bool isLoading = false;

  Future<void> initShared() async {
    isLoading = true;
    update();
    await GetStorage.init();
    await Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        if (prefs.read('token') != null) {
          Get.offNamed(NamedRouts.routeHome);
          Get.put(UserHelperController(prefs.read('token')));
        } else {
          Get.offNamed(NamedRouts.routeStart);
        }
      },
    );
  }

  @override
  void onInit() {
    initShared();
    super.onInit();
  }
}
