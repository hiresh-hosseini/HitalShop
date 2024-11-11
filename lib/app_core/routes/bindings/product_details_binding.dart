import 'package:get/get.dart';
import 'package:shop/app_features/product/controller/product_datails_controller.dart';

class ProductDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDatailsController>(
        () => ProductDatailsController(Get.arguments as int),
        fenix: true);
  }
}
