import 'package:shop/app_core/constants/servises/base_url.dart';
import 'package:shop/app_core/constants/servises/endpoint.dart';
import 'package:shop/app_data/responses/address_response.dart';

class AddressRepository extends BaseUrl {
  Future<AddressResponse> getAddress() async {
    var response = await dio.get(Endpoint.address);
    return AddressResponse.fromJson(response.data);
  }

  Future<bool> deleteAddress(int id) async {
    var response = await dio.delete('${Endpoint.address}/$id');
    return response.statusCode == 200;
  }
}
