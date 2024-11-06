import 'package:get/get.dart';
import 'package:shop/app_data/models/category_model.dart';
import 'package:shop/app_data/models/product_model.dart';
import 'package:shop/app_data/repositories/category_repository.dart';
import 'package:shop/app_data/repositories/product_respository.dart';

class ProductController extends GetxController {
  int? selectedCategoryId;

  List<CategoryModel>? categoryList;
  List<ProductModel>? productList;
  // Initializing a category with repository
  CategoryRepository categoryRepository = CategoryRepository();
  ProductRespository productRespository = ProductRespository();

  Future<void> getCategories() async {
    var response = await categoryRepository.getCategories();
    categoryList = response.categories;
    update();
  }

  // وقتی کاربر روی لیست افقی دسته بندی زد آیدیشو به این تابع پاس میدم
  void selectCategory(int id) {
    selectedCategoryId = id;
    getFilterProducts();
    update();
  }

  Future<void> getFilterProducts() async {
    var response = await productRespository.getFilterProducts(
        categoryId: selectedCategoryId);
    productList = response.filterProducts;
    update();
  }

  @override
  void onInit() {
    getCategories();
    getFilterProducts();
    super.onInit();
  }
}
