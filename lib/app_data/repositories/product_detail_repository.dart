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

  // چون میخوام مقداری که سرور بهم میده رو برگردونم اینت تعریف میکنم
  Future<int> addToCart(
      {required int productId,
      required bool increment,
      bool delete = false}) async {
    var response = await dio.post(Endpoint.addToCart, data: {
      'product_id': productId.toString(),
      'increment': increment,
      'delete': delete,
    });
    return response.data['count'] ?? 0;
  }
}
