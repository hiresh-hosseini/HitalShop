import 'package:get/get.dart';
import 'package:shop/app_features/product/controller/add_comment_controller.dart';
import 'package:shop/app_features/product/controller/comments_controller.dart';

class CommentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommentsController>(() => CommentsController(), fenix: true);
    Get.lazyPut<AddCommentController>(() => AddCommentController(),
        fenix: true);
  }
}
