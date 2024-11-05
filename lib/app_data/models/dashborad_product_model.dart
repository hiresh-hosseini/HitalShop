class DashboardProductModel {
  int? id;
  String? title;
  String? image;
  String? price;
  String? realPrice;
  int? discountPercent;
  String? description;
  String? category;
  List<String>? gallery;
  int? reviewsCount;
  bool? bookmarked;
  int? cartCount;
  int? count;

  DashboardProductModel(
      {this.id,
      this.title,
      this.image,
      this.price,
      this.realPrice,
      this.discountPercent,
      this.description,
      this.category,
      this.gallery,
      this.reviewsCount,
      this.bookmarked,
      this.count,
      this.cartCount});

  DashboardProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    realPrice = json['real_price'];
    discountPercent = json['discount_percent'];
    description = json['description'];
    category = json['category'];
    reviewsCount = json['reviews_count'];
    bookmarked = json['bookmarked'];
    cartCount = json['cart_count'];
    count = json['count'];
    if (json['gallery'] != null) {
      gallery = json['gallery'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['price'] = price;
    data['real_price'] = realPrice;
    data['discount_pt'] = discountPercent;
    return data;
  }
}
