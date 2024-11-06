import 'package:shop/app_core/constants/servises/base_url.dart';
import 'package:shop/app_core/constants/servises/endpoint.dart';
import 'package:shop/app_data/responses/category_response.dart';

class CategoryRepository extends BaseUrl {
  Future<CategoriyResponse> getCategories() async {
    var response = await dio.get(Endpoint.categories);
    return CategoriyResponse.fromJson(response.data);
  }
}
