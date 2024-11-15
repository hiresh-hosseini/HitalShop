import 'package:get/get.dart';
import 'package:shop/app_features/profile/controllers/edit_profile_controller.dart';
import 'package:shop/app_features/profile/controllers/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<EditProfileController>(() => EditProfileController(),
        fenix: true);
    // Get.lazyPut<AddAddressController>(() => AddAddressController(),
    // fenix: true);
    // Get.lazyPut<ShopMapController>(() => ShopMapController(), fenix: true);
    // Get.lazyPut<AddressController>(() => AddressController(), fenix: true);
  }
}
