import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/widgets/snackbar_widget.dart';
import 'package:shop/app_data/models/user_model.dart';
import 'package:shop/app_data/repositories/profile_repository.dart';
import 'package:shop/app_data/responses/auth_response.dart';
import 'package:shop/app_features/profile/controllers/profile_controller.dart';

class EditProfileController extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtOldPass = TextEditingController();
  TextEditingController txtNewPss = TextEditingController();

  UserModel profileUserModel = Get.arguments as UserModel;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  ProfileRepository profileRepository = ProfileRepository();
  AuthResponse? authResponse;

  String? nameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا نام و نام خانوادگی را وارد کنید';
    }
    return null;
  }

  String? txtOldPassValidate(String? value) {
    if (txtNewPss.text.isNotEmpty && value!.isEmpty) {
      return 'لطفا رمز عبور قبلی را وارد کنید';
    }
    return null;
  }

  String? txtNewPassValidate(String? value) {
    if (txtOldPass.text.isNotEmpty && value!.isEmpty) {
      return 'لطفا رمز عبور جدید را وارد کنید';
    }
    return null;
  }

  Future<void> editProfile() async {
    isLoading = true;
    update();
    if (formKey.currentState!.validate()) {
      var response = await profileRepository.editProfile(
        name: txtName.text,
        oldPassword: txtOldPass.text,
        newPassword: txtNewPss.text,
      );
      if (response) {
        Get.find<ProfileController>().getProfile();
        Get.back();
        successMessage('ویرایش با موفقیت انجام شد');
      } else {
        errorMessage('ویرایش با مشکل مواجه شد');
      }
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    txtName.text = profileUserModel.name ?? '';
    txtMobile.text = profileUserModel.mobile ?? '';
    super.onInit();
  }
}
