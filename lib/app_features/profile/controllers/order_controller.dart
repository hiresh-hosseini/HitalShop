import 'package:get/get.dart';
import 'package:shop/app_core/widgets/snackbar_widget.dart';
import 'package:shop/app_data/repositories/address_repository.dart';
import 'package:shop/app_data/repositories/product_respository.dart';
import 'package:shop/app_data/responses/address_response.dart';

class OrderController extends GetxController {
  //Shipping-----------------------------------
  List<ShippingMethod> methods = [
    ShippingMethod(
        title: 'پست پیشتاز(ارسال سریع)',
        price: '20,000',
        value: 1,
        isSelected: false),
    ShippingMethod(
        title: 'تیپاکس', price: '10,000', value: 2, isSelected: false),
  ];

  ShippingMethod? selectedMethod;

  void selectMethod(ShippingMethod value) {
    for (var element in methods) {
      element.isSelected = false;
    }
    value.isSelected = true;
    selectedMethod = value;
    update();
  }

  //---------------------------------------------
  AddressRepository addressRepository = AddressRepository();
  AddressResponse? addressResponse;
  Address? selectedAddress;
  ProductRespository productRepository = ProductRespository();

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

  void selecteAddress(Address address) {
    selectedAddress = address;
    update();
  }

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }
}

class ShippingMethod {
  String title;
  String price;
  bool isSelected;
  int value;
  ShippingMethod({
    required this.title,
    required this.price,
    this.isSelected = false,
    required this.value,
  });
}
