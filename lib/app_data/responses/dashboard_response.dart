import 'package:shop/app_data/models/category_model.dart';
import 'package:shop/app_data/models/product_model.dart';

class DashboardResponse {
  List<String>? sliders;
  List<CategoryModel>? categories;
  List<ProductModel>? discountedProducts;
  List<ProductModel>? latestProducts;

  DashboardResponse(
      {this.sliders,
      this.categories,
      this.discountedProducts,
      this.latestProducts});

  DashboardResponse.fromJson(Map<String, dynamic> json) {
    sliders = json['sliders'].cast<String>();
    if (json['categories'] != null) {
      categories = <CategoryModel>[];
      json['categories'].forEach((v) {
        categories!.add(CategoryModel.fromJson(v));
      });
    }
    if (json['discounted_products'] != null) {
      discountedProducts = <ProductModel>[];
      json['discounted_products'].forEach((v) {
        discountedProducts!.add(ProductModel.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = <ProductModel>[];
      json['latest_products'].forEach((v) {
        latestProducts!.add(ProductModel.fromJson(v));
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
