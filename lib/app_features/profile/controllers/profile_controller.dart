import 'package:get/get.dart';
import 'package:shop/app_data/models/user_model.dart';
import 'package:shop/app_data/repositories/profile_repository.dart';

class ProfileController extends GetxController {
  ProfileRepository profileRepository = ProfileRepository();
  UserModel? profileUserModel;

  Future<void> getProfile() async {
    profileUserModel = await profileRepository.getProfile();
    update();
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
