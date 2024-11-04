import 'package:shop/app_core/constants/servises/base_url.dart';
import 'package:shop/app_core/constants/servises/endpoint.dart';
import 'package:shop/app_core/widgets/snackbar_widget.dart';
import 'package:shop/app_data/responses/auth_response.dart';

class LoginRepository extends BaseUrl {
  Future<AuthResponse?> login({
    required String mobile,
    required String password,
  }) async {
    var response = await dio.post(Endpoint.login, data: {
      'mobile': mobile,
      'password': password,
    });

    if (response.statusCode == 200) {
      successMessage('ورود با موفقیت انجام شد');
    } else {
      errorMessage(response.data['message']);
      return null;
    }
    return AuthResponse.fromJson(response.data);
  }
}
