import 'package:shop/app_core/constants/servises/base_url.dart';
import 'package:shop/app_core/constants/servises/endpoint.dart';
import 'package:shop/app_data/models/product_model.dart';

class ProductDetailRepository extends BaseUrl {
  Future<ProductModel> getProductDetail(int id) async {
    var response = await dio.get('${Endpoint.products}/$id');
    return ProductModel.fromJson(response.data['data']);
  }
}
