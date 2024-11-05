class DashboardCategoryModel {
  int? id;
  String? title;
  String? image;

  DashboardCategoryModel({this.id, this.title, this.image});

  DashboardCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}
