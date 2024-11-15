import 'package:shop/app_core/constants/servises/base_url.dart';
import 'package:shop/app_core/constants/servises/endpoint.dart';
import 'package:shop/app_data/models/user_model.dart';
import 'package:shop/app_data/responses/filter_product_response.dart';

class ProfileRepository extends BaseUrl {
  Future<UserModel> getProfile() async {
    var response = await dio.get(Endpoint.profile);
    return UserModel.fromJson(response.data['data']);
  }

  Future<bool> editProfile(
      {required String name, String? oldPassword, String? newPassword}) async {
    var response = await dio.post(Endpoint.profile, data: {
      'name': name,
      if (oldPassword != null && oldPassword.isNotEmpty)
        'old_password': oldPassword,
      if (newPassword != null && newPassword.isNotEmpty)
        'new_password': newPassword,
    });
    return response.statusCode == 200;
  }

  Future<bool> bookmarks(int id) async {
    var response = await dio.post(Endpoint.bookmars(id));
    return response.statusCode == 200;
  }

  Future<FilterProductResponse> getBookmarks() async {
    var response = await dio.get(Endpoint.bookmarks);
    return FilterProductResponse.fromJson(response.data);
  }
}
