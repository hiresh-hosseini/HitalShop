import 'package:get/get.dart';
import 'package:shop/app_features/home/controllers/dashboard_controller.dart';
import 'package:shop/app_features/home/controllers/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.put(DashboardController());
  }
}
