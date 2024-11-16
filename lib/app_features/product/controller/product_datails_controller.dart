import 'package:get/get.dart';
import 'package:shop/app_data/models/product_model.dart';
import 'package:shop/app_data/repositories/product_detail_repository.dart';
import 'package:shop/app_features/product/controller/cart_controller.dart';
import 'package:shop/app_features/profile/controllers/bookmark_controller.dart';

class ProductDatailsController extends GetxController {
  ProductDetailRepository productDetailRepository = ProductDetailRepository();
  ProductModel? productModel;

  final int id = Get.arguments as int;

  Future<void> getProductDetails() async {
    productModel = await productDetailRepository.getProductDetail(id);
    update();
  }

  Future<void> bookmark() async {
    var response = await productDetailRepository.bookmarks(id);
    if (response) {
      productModel!.bookmarked = !productModel!.bookmarked!;
      if (Get.isRegistered<BookmarksController>()) {
        Get.find<BookmarksController>().getBookmarks();
      }
      update();
    }
  }

  Future<void> addToCart(bool increment) async {
    var response = await productDetailRepository.addToCart(
      productId: id,
      increment: increment,
    );
    productModel!.cartCount = response;
    Get.find<CartController>().getCart();
    update();
  }

  @override
  void onInit() {
    getProductDetails();
    super.onInit();
  }
}
