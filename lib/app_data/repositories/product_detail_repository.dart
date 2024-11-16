import 'package:shop/app_core/constants/servises/base_url.dart';
import 'package:shop/app_core/constants/servises/endpoint.dart';
import 'package:shop/app_data/models/product_model.dart';
import 'package:shop/app_data/responses/filter_product_response.dart';

class ProductDetailRepository extends BaseUrl {
  Future<ProductModel> getProductDetail(int id) async {
    var response = await dio.get('${Endpoint.products}/$id');
    return ProductModel.fromJson(response.data['data']);
  }

  Future<bool> bookmarks(int id) async {
    var response = await dio.post(Endpoint.bookmars(id));
    return response.statusCode == 200;
  }

  Future<FilterProductResponse> getBookmarks() async {
    var response = await dio.get(Endpoint.bookmarks);
    return FilterProductResponse.fromJson(response.data);
  }
}
