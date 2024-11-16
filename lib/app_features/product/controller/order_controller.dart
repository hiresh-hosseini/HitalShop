import 'package:get/get.dart';
import 'package:shop/app_core/widgets/snackbar_widget.dart';
import 'package:shop/app_data/repositories/address_repository.dart';
import 'package:shop/app_data/repositories/product_respository.dart';
import 'package:shop/app_data/responses/address_response.dart';
import 'package:shop/app_features/product/controller/cart_controller.dart';
import 'package:shop/app_features/product/screen/peyment_screen.dart';

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

  // توی کلاس وقتی گتر استفاده میشه که بخواییم توی کلاس محاسبه انجام بدم و ریترن کنم
  // استرینگ تعریف میکنم که بتونم به جای مبلغ کل نشون بدم
  String getTotalPrice() {
    /// قیمت کل رو از کارت کنترلر میگیره
    var totalPrice = Get.find<CartController>().cartResponse!.totalPrice;
    // میخوام مقدار اینتیجر رو بریزم تو این
    /// چون استرینگه به اینت تبدیل میشه
    var total = int.parse(totalPrice!.replaceAll(',', ''));

    /// اینم از چیزی که کاربر انتخاب کرده میگیره که اونم تبدیل میشه
    int shippingPrice = 0;
    if (selectedMethod != null) {
      shippingPrice = int.parse(selectedMethod!.price.replaceAll(',', ''));
    }
    // تبدیل میکنم به استرینگ چون باید توی تابع استرینگ برگردونم
    /// و حال اونا رو جمع و ریترن میکنه
    return (total + shippingPrice).toString();
  }

  Future<void> order() async {
    if (selectedAddress != null && selectedMethod != null) {
      var link = await productRepository.order(
          addressId: selectedAddress!.id!,
          shippingMethod: selectedMethod!.value);
      Get.off(() => PeymetnScreen(link: link));
    } else {
      errorMessage('لطفا همه‌ی موارد را انتخاب کنید');
    }
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
