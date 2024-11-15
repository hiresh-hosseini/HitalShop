import 'package:shop/app_core/constants/servises/base_url.dart';
import 'package:shop/app_core/constants/servises/endpoint.dart';
import 'package:shop/app_data/responses/province_response.dart';

class ProvinceRepository extends BaseUrl {
  Future<ProvinceResponse> getProvince() async {
    final response = await dio.get(Endpoint.provinces);
    return ProvinceResponse.fromJson(response.data);
  }

  // بول میذارم چون یا آدرس ایجاد میشه یا خطا میده
  Future<bool> addAddress({
    required String title,
    required int cityId,
    required String address,
    String? postalCode,
    String? latLong,
  }) async {
    var response = await dio.post(Endpoint.address, data: {
      'title': title,
      'city_id': cityId.toString(),
      'address': address,
      'latlong': latLong,
      'postal_code': postalCode
    });
    return response.statusCode == 200;
  }

  Future<bool> editAddress(
    int id, {
    required String title,
    required int cityId,
    required String address,
    String? postalCode,
    String? latLong,
  }) async {
    var response = await dio.put('${Endpoint.address}/$id', data: {
      'title': title,
      'city_id': cityId.toString(),
      'address': address,
      'latlong': latLong,
      'postal_code': postalCode
    });
    return response.statusCode == 200;
  }
}
