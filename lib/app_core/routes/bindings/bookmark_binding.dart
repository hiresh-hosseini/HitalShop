import 'package:get/get.dart';
import 'package:shop/app_features/profile/controllers/bookmark_controller.dart';

class BookmarkBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookmarksController>(() => BookmarksController(), fenix: true);
  }
}
