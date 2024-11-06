import 'package:shop/app_data/models/product_model.dart';

class FilterProductResponse {
  List<ProductModel>? filterProducts;

  FilterProductResponse({this.filterProducts});

  FilterProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      filterProducts = <ProductModel>[];
      json['data'].forEach((v) {
        filterProducts!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (filterProducts != null) {
      data['data'] = filterProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
