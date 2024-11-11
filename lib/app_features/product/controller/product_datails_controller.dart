import 'package:get/get.dart';
import 'package:shop/app_data/models/product_model.dart';
import 'package:shop/app_data/repositories/product_detail_repository.dart';

class ProductDatailsController extends GetxController {
  ProductDetailRepository productDetailRepository = ProductDetailRepository();
  ProductModel? productModel;

  final int id;
  ProductDatailsController(this.id);

  Future<void> getProductDetails() async {
    productModel = await productDetailRepository.getProductDetail(id);
    update();
  }

  @override
  void onInit() {
    getProductDetails();
    super.onInit();
  }
}
