// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';
// import 'package:shop/app_core/pakages/iconsax_pakage.dart';
// import 'package:shop/app_features/product/controller/comments_controller.dart';

// class RatingbarIndicatorPackage extends StatelessWidget {
//    RatingbarIndicatorPackage({super.key});

//   final controller = Get.find<CommentsController>();

//   @override
//   Widget build(BuildContext context) {
//     return RatingBarIndicator(
//       rating: review.rate!.toDouble(),
//       unratedColor: const Color(0xffededed),
//       itemBuilder: (context, index) =>
//           IconsaxPakage(icon: IconsaxPakage.minus, iconSize: 26),
//       itemCount: 5,
//       itemSize: 24.0,
//       direction: Axis.horizontal,
//     );
//   }
// }
