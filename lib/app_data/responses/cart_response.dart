import 'package:shop/app_data/models/product_model.dart';

class CartResponse {
  int? totalItems;
  String? price;
  String? discountPrice;
  String? totalPrice;
  List<Items>? items;

  CartResponse(
      {this.totalItems,
      this.price,
      this.discountPrice,
      this.totalPrice,
      this.items});

  CartResponse.fromJson(Map<String, dynamic> json) {
    totalItems = json['total_items'];
    price = json['price'];
    discountPrice = json['discount_price'];
    totalPrice = json['total_price'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_items'] = totalItems;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['total_price'] = totalPrice;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? count;
  ProductModel? product;

  Items({this.count, this.product});

  Items.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}
