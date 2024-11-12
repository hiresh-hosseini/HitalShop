import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/widgets/snackbar_widget.dart';
import 'package:shop/app_data/repositories/review_repository.dart';
import 'package:shop/app_features/product/controller/comments_controller.dart';

class AddCommentController extends GetxController {
  TextEditingController textComment = TextEditingController();

  ReviewRepository reviewRepository = ReviewRepository();
  int rate = 1;
  bool isLoading = false;

  final int productId = Get.arguments as int;

  void onRate(double value) {
    rate = value.toInt();
    update();
  }

  Future<void> addComment() async {
    isLoading = true;
    update();
    var response = await reviewRepository.addReview(
      productId: productId,
      rate: rate,
      comment: textComment.text,
    );

    if (response) {
      Get.find<CommentsController>().getReviews();
      Get.back();
      successMessage('نظر شما موفقیت ارسال شد');
    } else {
      errorMessage('خطایی وجود دارد');
    }
    isLoading = false;
    update();
  }
}
