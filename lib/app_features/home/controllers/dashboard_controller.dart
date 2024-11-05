import 'package:get/get.dart';
import 'package:shop/app_data/repositories/product_respository.dart';
import 'package:shop/app_data/responses/dashboard_response.dart';

class DashboardController extends GetxController {
  ProductRespository productRespository = ProductRespository();
  DashboardResponse? dashboardResponse;

  Future<void> getDashboard() async {
    dashboardResponse = await productRespository.getDashborad();
    update();
  }

  @override
  void onInit() {
    getDashboard();
    super.onInit();
  }
}
