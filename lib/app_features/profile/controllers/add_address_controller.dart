import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/widgets/snackbar_widget.dart';
import 'package:shop/app_data/repositories/provinc_repository.dart';
import 'package:shop/app_data/responses/address_response.dart';
import 'package:shop/app_data/responses/province_response.dart';
import 'package:shop/app_features/profile/controllers/address_controller.dart';
import 'package:shop/app_features/profile/controllers/order_controller.dart';

class AddAddressController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtPostalCode = TextEditingController();

  ProvinceRepository provinceRepository = ProvinceRepository();
  ProvinceResponse? provinceResponse;

  Province? selectedProvince;
  City? selectedCity;

  String? selectedLocation;
  final Address? address;
  AddAddressController({this.address});

  Future<void> getProvince() async {
    provinceResponse = await provinceRepository.getProvince();
    if (address != null) {
      selectedProvince = provinceResponse!.data!
          .firstWhere((element) => element.id == address!.provinceId);
      selectedCity = selectedProvince!.cities!
          .firstWhere((element) => element.id == address!.cityId);
    }
    update();
  }

  void selectProvince(Province province) {
    selectedProvince = province;
    selectedCity = null;
    update();
  }

  void selecteLocation(String location) {
    selectedLocation = location;
    update();
  }

  void selectCity(City city) {
    selectedCity = city;
    update();
  }

  void choose() {
    errorMessage('لطفا اول استان را انتخاب کنید');
    update();
  }

  Future<void> addAddress() async {
    if (formKey.currentState!.validate()) {
      if (selectedCity != null) {
        var response = await provinceRepository.addAddress(
          title: txtTitle.text,
          cityId: selectedCity!.id!,
          address: txtAddress.text,
          postalCode: txtPostalCode.text,
          latLong: selectedLocation,
        );
        if (response) {
          if (Get.isRegistered<AddressController>()) {
            Get.find<AddressController>().getAddress();
          }
          if (Get.isRegistered<OrderController>()) {
            Get.find<OrderController>().getAddress();
          }
          Get.back();
          successMessage('آدرس با موفقیت ایجاد شد');
        } else {
          errorMessage('خطایی رخ داده است');
        }
      } else {
        errorMessage('لطفا شهر خود را انتخاب کنید');
      }
    }
  }

  Future<void> editAddress() async {
    if (formKey.currentState!.validate()) {
      if (selectedCity != null) {
        var response = await provinceRepository.editAddress(
          address!.id!,
          title: txtTitle.text,
          cityId: selectedCity!.id!,
          address: txtAddress.text,
          postalCode: txtPostalCode.text,
          latLong: selectedLocation,
        );
        if (response) {
          Get.find<AddressController>().getAddress();
          Get.back();
          successMessage('آدرس با موفقیت ویرایش شد');
        } else {
          errorMessage('خطایی رخ داده است');
        }
      } else {
        errorMessage('لطفا شهر خود را انتخاب کنید');
      }
    }
  }

  String? titleValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا عنوان آدرس را وارد کنید';
    }
    return null;
  }

  String? addressValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا آدرس را وارد کنید';
    }
    return null;
  }

  @override
  void onInit() {
    getProvince();
    if (address != null) {
      txtTitle.text = address!.title ?? '';
      txtAddress.text = address!.address ?? '';
      txtPostalCode.text = address!.postalCode.toString();
      selectedLocation = address!.latlong;
      update();
    }
    super.onInit();
  }
}
