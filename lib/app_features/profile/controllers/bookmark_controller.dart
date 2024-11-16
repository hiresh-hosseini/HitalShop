import 'package:get/get.dart';
import 'package:shop/app_data/repositories/profile_repository.dart';
import 'package:shop/app_data/responses/filter_product_response.dart';

class BookmarksController extends GetxController {
  ProfileRepository profileRepository = ProfileRepository();
  FilterProductResponse? filterProductResponse;

  Future<void> getBookmarks() async {
    filterProductResponse = await profileRepository.getBookmarks();
    update();
  }

  void deleteBookmark(int id) async {
    var response = await profileRepository.bookmarks(id);
    if (response) {
      filterProductResponse!.filterProducts!
          .removeWhere((element) => element.id == id);
      update();
    }
  }

  @override
  void onInit() {
    getBookmarks();
    super.onInit();
  }
}
