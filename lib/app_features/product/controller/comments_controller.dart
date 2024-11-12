import 'package:get/get.dart';
import 'package:shop/app_data/repositories/review_repository.dart';
import 'package:shop/app_data/responses/review_response.dart';

class CommentsController extends GetxController {
  ReviewRepository reviewRepository = ReviewRepository();
  ReviewResponse? reviewResponse;
  final int productId = Get.arguments as int;

  Future<void> getReviews() async {
    reviewResponse = await reviewRepository.getReviews(productId);
    update();
  }

  @override
  void onInit() {
    getReviews();
    super.onInit();
  }
}
