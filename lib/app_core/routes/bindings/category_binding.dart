import 'package:get/get.dart';
import 'package:shop/app_features/category/controller/category_controller.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController(), fenix: true);
  }
}
