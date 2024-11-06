import 'package:shop/app_data/models/category_model.dart';

class CategoriyResponse {
  List<CategoryModel>? categories;

  CategoriyResponse({this.categories});

  CategoriyResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      categories = <CategoryModel>[];
      json['data'].forEach((v) {
        categories!.add(CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['data'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
