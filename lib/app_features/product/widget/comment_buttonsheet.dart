import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/constants/strings/fixed_hint_string.dart';
import 'package:shop/app_core/constants/strings/fixed_text_string.dart';
import 'package:shop/app_core/pakages/iconsax_pakage.dart';
import 'package:shop/app_core/widgets/button_widget.dart';
import 'package:shop/app_features/product/controller/add_comment_controller.dart';

class CommentButtonsheet extends StatelessWidget {
  const CommentButtonsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCommentController>(builder: (controller) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    FixedTextString.textSendOpinine,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: RatingBar.builder(
                      itemSize: 34,
                      initialRating: 1,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      unratedColor: const Color(0xffededed),
                      itemBuilder: (context, _) => IconsaxPakage(
                        icon: IconsaxPakage.start1,
                        iconSize: 14,
                        color: const Color(0xfff4d42d),
                      ),
                      onRatingUpdate: (rating) {
                        controller.onRate(rating);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              //------------------------------- TextFormField -------------------------------------
              TextFormField(
                controller: controller.textComment,
                maxLines: 6,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xffe1e1e1), width: 0.5),
                  ),
                  hintText: FixedHintString.sendYourOpinien,
                ),
              ),
              const SizedBox(height: 10),
              ButtonWidget(
                text: FixedTextString.textSendOpinine,
                onPressed: () => controller.addComment(),
                isLoading: controller.isLoading,
              ),
            ],
          ),
        ),
      );
    });
  }
}
