import 'package:shop/app_core/constants/servises/base_url.dart';
import 'package:shop/app_core/constants/servises/endpoint.dart';
import 'package:shop/app_data/responses/dashboard_response.dart';
import 'package:shop/app_data/responses/filter_product_response.dart';

class ProductRespository extends BaseUrl {
  Future<DashboardResponse> getDashborad() async {
    var response = await dio.get(Endpoint.dashboard);
    return DashboardResponse.fromJson(response.data);
  }

  Future<FilterProductResponse> getFilterProducts({int? categoryId}) async {
    // For send to server----------------
    Map<String, dynamic> request = {};
    // Add to request-------------------
    if (categoryId != null) {
      request['category_id'] = categoryId.toString();
    }

    var response = await dio.get(Endpoint.products, queryParameters: request);
    return FilterProductResponse.fromJson(response.data);
  }
}
