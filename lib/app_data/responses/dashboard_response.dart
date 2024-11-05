import 'package:shop/app_data/models/dashboard_category_model.dart';
import 'package:shop/app_data/models/dashborad_product_model.dart';

class DashboardResponse {
  List<String>? sliders;
  List<DashboardCategoryModel>? categories;
  List<DashboardProductModel>? discountedProducts;
  List<DashboardProductModel>? latestProducts;

  DashboardResponse(
      {this.sliders,
      this.categories,
      this.discountedProducts,
      this.latestProducts});

  DashboardResponse.fromJson(Map<String, dynamic> json) {
    sliders = json['sliders'].cast<String>();
    if (json['categories'] != null) {
      categories = <DashboardCategoryModel>[];
      json['categories'].forEach((v) {
        categories!.add(DashboardCategoryModel.fromJson(v));
      });
    }
    if (json['discounted_products'] != null) {
      discountedProducts = <DashboardProductModel>[];
      json['discounted_products'].forEach((v) {
        discountedProducts!.add(DashboardProductModel.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = <DashboardProductModel>[];
      json['latest_products'].forEach((v) {
        latestProducts!.add(DashboardProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sliders'] = sliders;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (discountedProducts != null) {
      data['discounted_products'] =
          discountedProducts!.map((v) => v.toJson()).toList();
    }
    if (latestProducts != null) {
      data['latest_products'] = latestProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
