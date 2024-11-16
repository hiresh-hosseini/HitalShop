import 'package:shop/app_core/constants/servises/base_url.dart';
import 'package:shop/app_core/constants/servises/endpoint.dart';
import 'package:shop/app_data/responses/city_reposnse.dart';
import 'package:shop/app_data/responses/dashboard_response.dart';
import 'package:shop/app_data/responses/filter_product_response.dart';
import 'package:shop/app_data/responses/order_response.dart';

class ProductRespository extends BaseUrl {
  Future<DashboardResponse> getDashborad() async {
    var response = await dio.get(Endpoint.dashboard);
    return DashboardResponse.fromJson(response.data);
  }

  Future<FilterProductResponse> getFilterProducts({
    int? categoryId,
    String? keyword,
    String? orderColumn,
    String? orderType,
  }) async {
    // For send to server----------------
    Map<String, dynamic> request = {};
    // Add to request-------------------
    if (categoryId != null) request['category_id'] = categoryId.toString();

    if (keyword != null) request['keyword'] = keyword;

    if (orderColumn != null) request['order_column'] = orderColumn;

    if (orderType != null) request['order_type'] = orderType;

    var response = await dio.get(Endpoint.products, queryParameters: request);
    return FilterProductResponse.fromJson(response.data);
  }

  Future<CartResponse> getCart() async {
    var response = await dio.get(Endpoint.cart);
    return CartResponse.fromJson(response.data);
  }

  Future<String> order(
      {required int addressId, required int shippingMethod}) async {
    var response = await dio.post(Endpoint.order, data: {
      'address_id': addressId.toString(),
      'shipping_method': shippingMethod.toString(),
    });
    return response.data['payment_link'];
  }

  Future<OrderResponse> getOrders() async {
    var response = await dio.get(Endpoint.order);
    return OrderResponse.fromJson(response.data);
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
