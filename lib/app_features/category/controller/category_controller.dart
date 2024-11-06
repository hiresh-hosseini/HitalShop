import 'package:get/get.dart';
import 'package:shop/app_data/repositories/category_repository.dart';
import 'package:shop/app_data/responses/category_response.dart';

class CategoryController extends GetxController {
  CategoriyResponse? categoryResponse;
  CategoryRepository categoryRepository = CategoryRepository();

  Future<void> getCategories() async {
    categoryResponse = await categoryRepository.getCategories();
    update();
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
