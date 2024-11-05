import 'package:shop/app_core/constants/servises/base_url.dart';
import 'package:shop/app_core/constants/servises/endpoint.dart';
import 'package:shop/app_data/responses/dashboard_response.dart';

class ProductRespository extends BaseUrl {
  Future<DashboardResponse> getDashborad() async {
    var response = await dio.get(Endpoint.dashboard);
    return DashboardResponse.fromJson(response.data);
  }
}
