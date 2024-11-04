import 'package:shop/app_core/constants/servises/base_url.dart';
import 'package:shop/app_core/constants/servises/endpoint.dart';
import 'package:shop/app_core/widgets/snackbar_widget.dart';
import 'package:shop/app_data/responses/auth_response.dart';

class RegisterRepository extends BaseUrl {
  Future<AuthResponse?> register({
    required String name,
    required String mobile,
    required String password,
    required String passwordConformation,
  }) async {
    var response = await dio.post(Endpoint.register, data: {
      'name': name,
      'mobile': mobile,
      'password': password,
      'password_confirmation': passwordConformation,
    });
    if (response.statusCode == 200) {
      successMessage('ثبت نام با موفقیت انجام شد.');
    } else {
      errorMessage(response.data['message']);
      return null;
    }
    return AuthResponse.fromJson(response.data);
  }
}
