import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/constants/strings/fixed_text_string.dart';
import 'package:shop/app_core/pakages/iconsax_pakage.dart';
import 'package:shop/app_core/pakages/loading_pakage.dart';
import 'package:shop/app_core/widgets/appbar_widget.dart';
import 'package:shop/app_features/product/controller/comments_controller.dart';
import 'package:shop/app_features/product/widget/comment_buttonsheet.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentsController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //------------------------------------------- Appbar -----------------------------------------
              AppbarWidget(title: FixedTextString.textOpinions),
              Expanded(
                child: controller.reviewResponse == null
                    ? Center(
                        child: LoadingPakage(
                            size: 20.0, color: Theme.of(context).primaryColor),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(18),
                        itemCount: controller.reviewResponse!.data!.length,
                        itemBuilder: (context, index) {
                          var review = controller.reviewResponse!.data![index];
                          return Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(bottom: 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Theme.of(context).dividerColor,
                                  width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // ------------------------------------- User -----------------------------------------
                                    Text(
                                      review.user ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff8c8c8c),
                                      ),
                                    ),
                                    const Spacer(),

                                    //-------------------------------------- RatingBarIndicator -----------------------------
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: RatingBarIndicator(
                                        rating: review.rate!.toDouble(),
                                        unratedColor: const Color(0xffededed),
                                        itemBuilder: (context, index) =>
                                            IconsaxPakage(
                                                icon: IconsaxPakage.start1,
                                                iconSize: 26,
                                                color: const Color(0xfff4d42d)),
                                        itemCount: 5,
                                        itemSize: 24.0,
                                        direction: Axis.horizontal,
                                      ),
                                    ),
                                  ],
                                ),

                                //----------------------------------- data ------------------------------------
                                Text(
                                  review.date ?? '',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff8c8c8c),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  review.comment ?? '',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff8c8c8c),
                                  ),
                                ),
                                Visibility(
                                  visible: review.reply != null,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 14),
                                      const Divider(),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text(
                                            FixedTextString.textAnswer,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff8c8c8c),
                                            ),
                                          ),

                                          // -------------------------------------- Reply --------------------------------------------
                                          Text(
                                            review.reply ?? '',
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              context: context,
              builder: (context) => const CommentButtonsheet(),
              routeSettings: RouteSettings(
                arguments: controller.productId,
              ),
            );
          },
          child: IconsaxPakage(
            icon: IconsaxPakage.add,
            iconSize: 28,
            color: Colors.white,
          ),
        ),
      );
    });
  }
}
