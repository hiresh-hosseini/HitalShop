import 'package:shop/app_core/constants/servises/base_url.dart';
import 'package:shop/app_core/constants/servises/endpoint.dart';
import 'package:shop/app_data/responses/review_response.dart';

class ReviewRepository extends BaseUrl {
  Future<ReviewResponse> getReviews(int id) async {
    var response = await dio.get(Endpoint.productReview(id));
    return ReviewResponse.fromJson(response.data);
  }

  Future<bool> addReview({
    required int productId,
    required int rate,
    required String comment,
  }) async {
    var response = await dio.post(
      Endpoint.review,
      data: {
        'product_id': productId.toString(),
        'rate': rate.toString(),
        'comment': comment,
      },
    );
    return response.statusCode == 200;
  }
}
