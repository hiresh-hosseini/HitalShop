import 'package:get/get.dart';
import 'package:shop/app_core/widgets/snackbar_widget.dart';
import 'package:shop/app_data/repositories/address_repository.dart';
import 'package:shop/app_data/responses/address_response.dart';

class AddressController extends GetxController {
  AddressRepository addressRepository = AddressRepository();
  AddressResponse? addressResponse;

  Future<void> getAddress() async {
    addressResponse = await addressRepository.getAddress();
    update();
  }

  Future<void> deleteAddress(int id) async {
    var respones = await addressRepository.deleteAddress(id);
    update();
    if (respones) {
      addressResponse!.data!.removeWhere((element) => element.id == id);
      successMessage('آدرس با موفقیت حذف شد');
    } else {
      errorMessage('خطایی رخ داده است');
    }
  }

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }
}
