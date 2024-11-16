import 'package:get/get.dart';
import 'package:shop/app_data/models/product_model.dart';
import 'package:shop/app_data/repositories/product_detail_repository.dart';
import 'package:shop/app_data/repositories/product_respository.dart';
import 'package:shop/app_data/responses/city_reposnse.dart';

class CartController extends GetxController {
  ProductRespository productRepository = ProductRespository();
  CartResponse? cartResponse;
  ProductDetailRepository productDetailRepository = ProductDetailRepository();
  ProductModel? productDetails;

  var loadingDelete = <int, bool>{};
  var loadingCount = <int, bool>{};

  Future<void> getCart() async {
    cartResponse = await productRepository.getCart();
    update();
  }

  Future<void> addToCart(int id, bool increment, [bool delete = false]) async {
    delete ? loadingDelete[id] = true : loadingCount[id] = true;
    update();
    await productRepository.addToCart(
      productId: id,
      increment: increment,
      delete: delete,
    );
    delete ? loadingDelete[id] = false : loadingCount[id] = false;
    await getCart();
    update();
  }

  @override
  void onInit() {
    getCart();
    super.onInit();
  }
}
