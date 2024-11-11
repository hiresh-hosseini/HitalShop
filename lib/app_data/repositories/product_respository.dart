import 'package:shop/app_core/constants/servises/base_url.dart';
import 'package:shop/app_core/constants/servises/endpoint.dart';
import 'package:shop/app_data/responses/dashboard_response.dart';
import 'package:shop/app_data/responses/filter_product_response.dart';

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
}
